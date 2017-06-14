## DO NOT EDIT BY HAND... 

context('allOf')

schema <- '{
    "allOf": [
        {
            "properties": {
                "bar": {
                    "type": "integer"
                }
            },
            "required": [
                "bar"
            ]
        },
        {
            "properties": {
                "foo": {
                    "type": "string"
                }
            },
            "required": [
                "foo"
            ]
        }
    ]
}
'
test_that("allOf",{ 

 json <- '{
    "foo": "baz",
    "bar": 2
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("mismatch second",{ 

 json <- '{
    "foo": "baz"
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("mismatch first",{ 

 json <- '{
    "bar": 2
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("wrong type",{ 

 json <- '{
    "foo": "baz",
    "bar": "quux"
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('allOf with base schema')

schema <- '{
    "properties": {
        "bar": {
            "type": "integer"
        }
    },
    "required": [
        "bar"
    ],
    "allOf": [
        {
            "properties": {
                "foo": {
                    "type": "string"
                }
            },
            "required": [
                "foo"
            ]
        },
        {
            "properties": {
                "baz": {
                    "type": "null"
                }
            },
            "required": [
                "baz"
            ]
        }
    ]
}
'
test_that("valid",{ 

 json <- '{
    "foo": "quux",
    "bar": 2,
    "baz": null
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("mismatch base schema",{ 

 json <- '{
    "foo": "quux",
    "baz": null
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("mismatch first allOf",{ 

 json <- '{
    "bar": 2,
    "baz": null
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("mismatch second allOf",{ 

 json <- '{
    "foo": "quux",
    "bar": 2
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("mismatch both",{ 

 json <- '{
    "bar": 2
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('allOf simple types')

schema <- '{
    "allOf": [
        {
            "maximum": 30
        },
        {
            "minimum": 20
        }
    ]
}
'
test_that("valid",{ 

 json <- '25
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("mismatch one",{ 

 json <- '35
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


