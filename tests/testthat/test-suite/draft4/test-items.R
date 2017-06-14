## DO NOT EDIT BY HAND... 

context('a schema given for items')

schema <- '{
    "items": {
        "type": "integer"
    }
}
'
test_that("valid items",{ 

 json <- '[
    1,
    2,
    3
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("wrong type of items",{ 

 json <- '[
    1,
    "x"
]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-arrays",{ 

 json <- '{
    "foo": "bar"
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("JavaScript pseudo-array is valid",{ 

 json <- '{
    "0": "invalid",
    "length": 1
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('an array of schemas for items')

schema <- '{
    "items": [
        {
            "type": "integer"
        },
        {
            "type": "string"
        }
    ]
}
'
test_that("correct types",{ 

 json <- '[
    1,
    "foo"
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("wrong types",{ 

 json <- '[
    "foo",
    1
]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("incomplete array of items",{ 

 json <- '[
    1
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("array with additional items",{ 

 json <- '[
    1,
    "foo",
    true
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("empty array",{ 

 json <- '[

]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("JavaScript pseudo-array is valid",{ 

 json <- '{
    "0": "invalid",
    "1": "valid",
    "length": 2
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


