## DO NOT EDIT BY HAND... 

context('minLength validation')

schema <- '{
    "minLength": 2
}
'
test_that("longer is valid",{ 

 json <- '"foo"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("exact length is valid",{ 

 json <- '"fo"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("too short is invalid",{ 

 json <- '"f"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-strings",{ 

 json <- '1
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("one supplementary Unicode code point is not long enough",{ 
skip('Test not currently supported')

 json <- '"💩"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


