## DO NOT EDIT BY HAND... 

context('additionalItems as schema')

schema <- '{
    "items": [
        {

        }
    ],
    "additionalItems": {
        "type": "integer"
    }
}
'
test_that("additional items match schema",{ 

 json <- '[
    null,
    2,
    3,
    4
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("additional items do not match schema",{ 

 json <- '[
    null,
    2,
    3,
    "foo"
]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('items is schema, no additionalItems')

schema <- '{
    "items": {

    },
    "additionalItems": false
}
'
test_that("all items match schema",{ 

 json <- '[
    1,
    2,
    3,
    4,
    5
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('array of items with no additionalItems')

schema <- '{
    "items": [
        {

        },
        {

        },
        {

        }
    ],
    "additionalItems": false
}
'
test_that("fewer number of items present",{ 

 json <- '[
    1,
    2
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("equal number of items present",{ 

 json <- '[
    1,
    2,
    3
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("additional items are not permitted",{ 

 json <- '[
    1,
    2,
    3,
    4
]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('additionalItems as false without items')

schema <- '{
    "additionalItems": false
}
'
test_that("items defaults to empty schema so everything is valid",{ 

 json <- '[
    1,
    2,
    3,
    4,
    5
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-arrays",{ 

 json <- '{
    "foo": "bar"
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('additionalItems are allowed by default')

schema <- '{
    "items": [
        {
            "type": "integer"
        }
    ]
}
'
test_that("only the first item is validated",{ 

 json <- '[
    1,
    "foo",
    false
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


