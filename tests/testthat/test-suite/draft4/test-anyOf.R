## DO NOT EDIT BY HAND... 

context('anyOf')

schema <- '{
    "anyOf": [
        {
            "type": "integer"
        },
        {
            "minimum": 2
        }
    ]
}
'
test_that("first anyOf valid",{ 

 json <- '1
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("second anyOf valid",{ 

 json <- '2.5
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("both anyOf valid",{ 

 json <- '3
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("neither anyOf valid",{ 

 json <- '1.5
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('anyOf with base schema')

schema <- '{
    "type": "string",
    "anyOf": [
        {
            "maxLength": 2
        },
        {
            "minLength": 4
        }
    ]
}
'
test_that("mismatch base schema",{ 

 json <- '3
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("one anyOf valid",{ 

 json <- '"foobar"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("both anyOf invalid",{ 

 json <- '"foo"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


