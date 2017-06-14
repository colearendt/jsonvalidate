## DO NOT EDIT BY HAND... 

context('object properties validation')

schema <- '{
    "properties": {
        "foo": {
            "type": "integer"
        },
        "bar": {
            "type": "string"
        }
    }
}
'
test_that("both properties present and valid is valid",{ 

 json <- '{
    "foo": 1,
    "bar": "baz"
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("one property invalid is invalid",{ 

 json <- '{
    "foo": 1,
    "bar": {

    }
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("both properties invalid is invalid",{ 

 json <- '{
    "foo": [

    ],
    "bar": {

    }
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("doesn't invalidate other properties",{ 

 json <- '{
    "quux": [

    ]
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-objects",{ 

 json <- '[

]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('properties, patternProperties, additionalProperties interaction')

schema <- '{
    "properties": {
        "foo": {
            "type": "array",
            "maxItems": 3
        },
        "bar": {
            "type": "array"
        }
    },
    "patternProperties": {
        "f.o": {
            "minItems": 2
        }
    },
    "additionalProperties": {
        "type": "integer"
    }
}
'
test_that("property validates property",{ 

 json <- '{
    "foo": [
        1,
        2
    ]
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("property invalidates property",{ 

 json <- '{
    "foo": [
        1,
        2,
        3,
        4
    ]
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("patternProperty invalidates property",{ 

 json <- '{
    "foo": [

    ]
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("patternProperty validates nonproperty",{ 

 json <- '{
    "fxo": [
        1,
        2
    ]
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("patternProperty invalidates nonproperty",{ 

 json <- '{
    "fxo": [

    ]
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("additionalProperty ignores property",{ 

 json <- '{
    "bar": [

    ]
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("additionalProperty validates others",{ 

 json <- '{
    "quux": 3
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("additionalProperty invalidates others",{ 

 json <- '{
    "quux": "foo"
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


