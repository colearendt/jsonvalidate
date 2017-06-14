## DO NOT EDIT BY HAND... 

context('minimum validation')

schema <- '{
    "minimum": 1.1
}
'
test_that("above the minimum is valid",{ 

 json <- '2.6
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("boundary point is valid",{ 

 json <- '1.1
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("below the minimum is invalid",{ 

 json <- '0.6
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-numbers",{ 

 json <- '"x"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('exclusiveMinimum validation')

schema <- '{
    "minimum": 1.1,
    "exclusiveMinimum": true
}
'
test_that("above the minimum is still valid",{ 

 json <- '1.2
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("boundary point is invalid",{ 

 json <- '1.1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


