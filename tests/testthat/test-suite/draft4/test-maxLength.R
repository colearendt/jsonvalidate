## DO NOT EDIT BY HAND... 

context('maxLength validation')

schema <- '{
    "maxLength": 2
}
'
test_that("shorter is valid",{ 

 json <- '"f"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("exact length is valid",{ 

 json <- '"fo"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("too long is invalid",{ 

 json <- '"foo"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-strings",{ 

 json <- '100
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("two supplementary Unicode code points is long enough",{ 
skip('Test not currently supported')

 json <- '"💩💩"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


