#git clone https://github.com/json-schema-org/JSON-Schema-Test-Suite.git testsuite

#library(tidyjson)
#library(tidyr)

pass_skip <- function(.x, .f) {
  if (identical(.x[[1]],.f))
    return(.x)
  else
    return(NULL)
}
remove_null <- function(.l) {
  .l[!as.logical(lapply(.l,is.null))]
}
read_file <- function(.file) {
  as.character(jsonlite::minify(paste(readLines(.file),collapse=' ')))
}

json_prep_tests <- function(.json) {
  .json %>% as.character() %>% tidyjson::gather_array('testid') %>%
    tidyjson::spread_values(desc=tidyjson::json_chr(description)) %>%
    tidyjson::gather_object() %>%
    dplyr::mutate(json=as.character(.)) %>% dplyr::tbl_df() %>%
    tidyr::spread(key=name, value=json) %>% dplyr::select(-description)
}

json_expand_tests <- function(.x) {
  as.tbl_json(.x) %>% gather_array('subtestid') %>% 
    gather_object('name') %>%
    dplyr::mutate(json=as.character(.)) %>% dplyr::tbl_df() %>%
    spread(key=name, value=json) %>%
    dplyr::select(-document.id)
}


generate_context <- function(.desc, .schema, .tests, .skippable=NULL) {
  stopifnot(c('data','description','valid') %in% names(.tests))
  stopifnot(inherits(.tests,'data.frame'))
  .desc <- stringr::str_replace(.desc,'[\"\']','')
  v <- c(paste0("context('",.desc,"')"),'')
  
  v <- c(v,paste0("schema <- '"
                  ,as.character(jsonlite::prettify(.schema))
                  , "'"
  )
  )
  
  v <- c(v,as.character(mapply(FUN=generate_test
                               , .data=.tests$data
                               , .desc=.tests$description
                               , .valid=.tests$valid
                               , .skippable=list(.skippable)
  )))
}

generate_test <- function(.data, .desc, .valid, .skippable=NULL) {
  .skippable <- as.character(lapply(.skippable, function(.x){
    return(.x[[length(.x)]])
  }))
  
  .test <- paste(
    ifelse(stringr::str_replace_all(stringr::str_trim(.desc)
                                    , '[\"\']'
                                    ,''
    ) %in% stringr::str_trim(.skippable)
    | identical(.skippable,'*')
    ,"skip('Test not currently supported')\n\n"
    ,"\n")
    , paste0("json <- '"
             ,as.character(jsonlite::prettify(.data))
             ,"'\n")
    ,paste0(
      "expect_",stringr::str_to_lower(.valid)
      ,"("
      ,"json_validate(json,schema,verbose=TRUE))")
    ,collapse='\n')
  v <- paste0("test_that(",.desc,",{ \n",.test," \n})\n\n")
}
generate_files <- function(.indir, .outdir, .skippable=NULL) {
  r <- '(.*)(?:\\.json)'
  files <- dir(.indir)
  files <- files[grepl(r,files)]
  filenames <- stringi::stri_match(files,regex=r)[,2]
  outfiles <- NULL
  for (i in seq_along(files)) {
    f <- paste(.indir,files[[i]],sep='/')
    fname <- filenames[[i]]
    outfname <- paste0('test-',fname,'.R')
    
    raw <- read_file(f)
    d <- json_prep_tests(raw)
    d$testjson <- lapply(d$tests, json_expand_tests)
    
    t <- unlist(mapply(FUN=generate_context
                       , d$desc
                       , d$schema
                       , d$testjson
                       , list(
                         remove_null(
                           lapply(.skippable,pass_skip,outfname)
                           )
                       )
                       )
                )
    t <- c('## DO NOT EDIT BY HAND... \n'
           ,t
           )
    .output <- paste0(.outdir,'/',outfname)
    if (file.exists(.output)) {
      .exists <- readLines(.output)
      if (!identical(.exists,t)){
        writeLines(t,.output)
      }
    } else {
      writeLines(t,.output)
    }
    
    outfiles <- c(outfiles,outfname)
  }
  invisible(NULL)
}

skip = list(
  c('test-refRemote.R','*')
  ,c('test-definitions.R','*')
  ,c('test-ref.R','remote ref valid')
  ,c('test-ref.R','remote ref invalid')
  ,c('test-multipleOf.R','0.00751 is not multiple of 0.0001')
  ,c('test-minLength.R','one supplementary Unicode code point is not long enough')
  ,c('test-maxLength.R','two supplementary Unicode code points is long enough')
  ,c('test-zeroTerminatedFloats.R','*')
  ,c('test-ecmascript-regex.R','*')
)
generate_files('tests/testsuite/tests/draft4/optional/'
               ,'tests/testthat/test-suite/draft4'
               , .skippable=skip)

# skip3 <- list(
#   c('test-refRemote.R','*')
#   ,c('test-ref.R','*')
#   ,c('test-types.R','*')
#   ,c('test-extends.R','mismatch extends')
#   ,c('test-extends.R','mismatch both')
#   ,c('test-extends.R','mismatch second extends')
#   ,c('test-extends.R','mismatch first extends')
#   ,c('test-extends.R','mismatch extended')
#   ,c('test-divisibleBy.R','0.00751 is not divisible by 0.0001')
#   ,c('test-divisibleBy.R','35 is not divisible by 1.5')
#   ,c('test-divisibleBy.R','int by int fail')
#   ,c('test-disallow.R','mismatch')
#   ,c('test-disallow.R','other mismatch')
#   ,c('test-disallow.R','disallowed')
#   ,c('test-minLength.R','one supplementary Unicode code point is not long enough')
#   ,c('test-maxLength.R','two supplementary Unicode code points is long enough')
# )
# generate_files('tests/testsuite/tests/draft3','tests/testthat/test-suite/draft3',skip3)
# 
# skip6 <- list(
#   c('test-allOf.R','any value is invalid')
#   , c('test-anyOf.R','any value is invalid')
#   ,c('test-const.R','another value is invalid')
#   ,c('test-const.R','another type is invalid')
#   ,c('test-const.R','another object is invalid')
#   ,c('test-boolean_schema.R','empty array is invalid')
#   ,c('test-boolean_schema.R','array is invalid')
#   ,c('test-boolean_schema.R','empty object is invalid')
#   ,c('test-boolean_schema.R','object is invalid')
#   ,c('test-boolean_schema.R','null is invalid')
#   ,c('test-boolean_schema.R','boolean false is invalid')
#   ,c('test-boolean_schema.R','boolean true is invalid')
#   ,c('test-boolean_schema.R','string is invalid')
#   ,c('test-boolean_schema.R','number is invalid')
# )
# generate_files('tests/testsuite/tests/draft6','tests/testthat/test-suite/draft6')