## DO NOT EDIT BY HAND... 

context('oneOf')

schema <- '{
    "oneOf": [
        {
            "type": "integer"
        },
        {
            "minimum": 2
        }
    ]
}
'
test_that("first oneOf valid",{ 

 json <- '1
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("second oneOf valid",{ 

 json <- '2.5
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("both oneOf valid",{ 

 json <- '3
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("neither oneOf valid",{ 

 json <- '1.5
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('oneOf with base schema')

schema <- '{
    "type": "string",
    "oneOf": [
        {
            "minLength": 2
        },
        {
            "maxLength": 4
        }
    ]
}
'
test_that("mismatch base schema",{ 

 json <- '3
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("one oneOf valid",{ 

 json <- '"foobar"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("both oneOf valid",{ 

 json <- '"foo"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


