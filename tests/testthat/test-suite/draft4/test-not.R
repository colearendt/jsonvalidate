## DO NOT EDIT BY HAND... 

context('not')

schema <- '{
    "not": {
        "type": "integer"
    }
}
'
test_that("allowed",{ 

 json <- '"foo"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("disallowed",{ 

 json <- '1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('not multiple types')

schema <- '{
    "not": {
        "type": [
            "integer",
            "boolean"
        ]
    }
}
'
test_that("valid",{ 

 json <- '"foo"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("mismatch",{ 

 json <- '1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("other mismatch",{ 

 json <- 'true
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('not more complex schema')

schema <- '{
    "not": {
        "type": "object",
        "properties": {
            "foo": {
                "type": "string"
            }
        }
    }
}
'
test_that("match",{ 

 json <- '1
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("other match",{ 

 json <- '{
    "foo": 1
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("mismatch",{ 

 json <- '{
    "foo": "bar"
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('forbidden property')

schema <- '{
    "properties": {
        "foo": {
            "not": {

            }
        }
    }
}
'
test_that("property present",{ 

 json <- '{
    "foo": 1,
    "bar": 2
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("property absent",{ 

 json <- '{
    "bar": 1,
    "baz": 2
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


