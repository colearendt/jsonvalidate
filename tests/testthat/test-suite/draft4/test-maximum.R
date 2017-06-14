## DO NOT EDIT BY HAND... 

context('maximum validation')

schema <- '{
    "maximum": 3
}
'
test_that("below the maximum is valid",{ 

 json <- '2.6
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("boundary point is valid",{ 

 json <- '3
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("above the maximum is invalid",{ 

 json <- '3.5
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-numbers",{ 

 json <- '"x"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('exclusiveMaximum validation')

schema <- '{
    "maximum": 3,
    "exclusiveMaximum": true
}
'
test_that("below the maximum is still valid",{ 

 json <- '2.2
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("boundary point is invalid",{ 

 json <- '3
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


