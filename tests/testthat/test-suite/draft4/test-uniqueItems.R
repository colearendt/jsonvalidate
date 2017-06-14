## DO NOT EDIT BY HAND... 

context('uniqueItems validation')

schema <- '{
    "uniqueItems": true
}
'
test_that("unique array of integers is valid",{ 

 json <- '[
    1,
    2
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("non-unique array of integers is invalid",{ 

 json <- '[
    1,
    1
]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("numbers are unique if mathematically unequal",{ 

 json <- '[
    1,
    1,
    1
]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("unique array of objects is valid",{ 

 json <- '[
    {
        "foo": "bar"
    },
    {
        "foo": "baz"
    }
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("non-unique array of objects is invalid",{ 

 json <- '[
    {
        "foo": "bar"
    },
    {
        "foo": "bar"
    }
]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("unique array of nested objects is valid",{ 

 json <- '[
    {
        "foo": {
            "bar": {
                "baz": true
            }
        }
    },
    {
        "foo": {
            "bar": {
                "baz": false
            }
        }
    }
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("non-unique array of nested objects is invalid",{ 

 json <- '[
    {
        "foo": {
            "bar": {
                "baz": true
            }
        }
    },
    {
        "foo": {
            "bar": {
                "baz": true
            }
        }
    }
]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("unique array of arrays is valid",{ 

 json <- '[
    [
        "foo"
    ],
    [
        "bar"
    ]
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("non-unique array of arrays is invalid",{ 

 json <- '[
    [
        "foo"
    ],
    [
        "foo"
    ]
]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("1 and true are unique",{ 

 json <- '[
    1,
    true
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("0 and false are unique",{ 

 json <- '[
    0,
    false
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("unique heterogeneous types are valid",{ 

 json <- '[
    {

    },
    [
        1
    ],
    true,
    null,
    1
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("non-unique heterogeneous types are invalid",{ 

 json <- '[
    {

    },
    [
        1
    ],
    true,
    null,
    {

    },
    1
]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


