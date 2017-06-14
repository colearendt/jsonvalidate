## DO NOT EDIT BY HAND... 

context('additionalProperties being false does not allow other properties')

schema <- '{
    "properties": {
        "foo": {

        },
        "bar": {

        }
    },
    "patternProperties": {
        "^v": {

        }
    },
    "additionalProperties": false
}
'
test_that("no additional properties is valid",{ 

 json <- '{
    "foo": 1
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an additional property is invalid",{ 

 json <- '{
    "foo": 1,
    "bar": 2,
    "quux": "boom"
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-objects",{ 

 json <- '[
    1,
    2,
    3
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("patternProperties are not additional properties",{ 

 json <- '{
    "foo": 1,
    "vroom": 2
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('additionalProperties allows a schema which should validate')

schema <- '{
    "properties": {
        "foo": {

        },
        "bar": {

        }
    },
    "additionalProperties": {
        "type": "boolean"
    }
}
'
test_that("no additional properties is valid",{ 

 json <- '{
    "foo": 1
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an additional valid property is valid",{ 

 json <- '{
    "foo": 1,
    "bar": 2,
    "quux": true
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an additional invalid property is invalid",{ 

 json <- '{
    "foo": 1,
    "bar": 2,
    "quux": 12
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('additionalProperties can exist by itself')

schema <- '{
    "additionalProperties": {
        "type": "boolean"
    }
}
'
test_that("an additional valid property is valid",{ 

 json <- '{
    "foo": true
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an additional invalid property is invalid",{ 

 json <- '{
    "foo": 1
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('additionalProperties are allowed by default')

schema <- '{
    "properties": {
        "foo": {

        },
        "bar": {

        }
    }
}
'
test_that("additional properties are allowed",{ 

 json <- '{
    "foo": 1,
    "bar": 2,
    "quux": true
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


