## DO NOT EDIT BY HAND... 

context('root pointer ref')

schema <- '{
    "properties": {
        "foo": {
            "$ref": "#"
        }
    },
    "additionalProperties": false
}
'
test_that("match",{ 

 json <- '{
    "foo": false
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("recursive match",{ 

 json <- '{
    "foo": {
        "foo": false
    }
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("mismatch",{ 

 json <- '{
    "bar": false
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("recursive mismatch",{ 

 json <- '{
    "foo": {
        "bar": false
    }
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('relative pointer ref to object')

schema <- '{
    "properties": {
        "foo": {
            "type": "integer"
        },
        "bar": {
            "$ref": "#/properties/foo"
        }
    }
}
'
test_that("match",{ 

 json <- '{
    "bar": 3
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("mismatch",{ 

 json <- '{
    "bar": true
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('relative pointer ref to array')

schema <- '{
    "items": [
        {
            "type": "integer"
        },
        {
            "$ref": "#/items/0"
        }
    ]
}
'
test_that("match array",{ 

 json <- '[
    1,
    2
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("mismatch array",{ 

 json <- '[
    1,
    "foo"
]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('escaped pointer ref')

schema <- '{
    "tilda~field": {
        "type": "integer"
    },
    "slash/field": {
        "type": "integer"
    },
    "percent%field": {
        "type": "integer"
    },
    "properties": {
        "tilda": {
            "$ref": "#/tilda~0field"
        },
        "slash": {
            "$ref": "#/slash~1field"
        },
        "percent": {
            "$ref": "#/percent%25field"
        }
    }
}
'
test_that("slash invalid",{ 

 json <- '{
    "slash": "aoeu"
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("tilda invalid",{ 

 json <- '{
    "tilda": "aoeu"
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("percent invalid",{ 

 json <- '{
    "percent": "aoeu"
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("slash valid",{ 

 json <- '{
    "slash": 123
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("tilda valid",{ 

 json <- '{
    "tilda": 123
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("percent valid",{ 

 json <- '{
    "percent": 123
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('nested refs')

schema <- '{
    "definitions": {
        "a": {
            "type": "integer"
        },
        "b": {
            "$ref": "#/definitions/a"
        },
        "c": {
            "$ref": "#/definitions/b"
        }
    },
    "$ref": "#/definitions/c"
}
'
test_that("nested ref valid",{ 

 json <- '5
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("nested ref invalid",{ 

 json <- '"a"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('ref overrides any sibling keywords')

schema <- '{
    "definitions": {
        "reffed": {
            "type": "array"
        }
    },
    "properties": {
        "foo": {
            "$ref": "#/definitions/reffed",
            "maxItems": 2
        }
    }
}
'
test_that("ref valid",{ 

 json <- '{
    "foo": [

    ]
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ref valid, maxItems ignored",{ 

 json <- '{
    "foo": [
        1,
        2,
        3
    ]
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ref invalid",{ 

 json <- '{
    "foo": "string"
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('remote ref, containing refs itself')

schema <- '{
    "$ref": "http://json-schema.org/draft-04/schema#"
}
'
test_that("remote ref valid",{ 
skip('Test not currently supported')

 json <- '{
    "minLength": 1
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("remote ref invalid",{ 
skip('Test not currently supported')

 json <- '{
    "minLength": -1
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('property named $ref that is not a reference')

schema <- '{
    "properties": {
        "$ref": {
            "type": "string"
        }
    }
}
'
test_that("property named $ref valid",{ 

 json <- '{
    "$ref": "a"
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("property named $ref invalid",{ 

 json <- '{
    "$ref": 2
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('Recursive references between schemas')

schema <- '{
    "id": "http://localhost:1234/tree",
    "description": "tree of nodes",
    "type": "object",
    "properties": {
        "meta": {
            "type": "string"
        },
        "nodes": {
            "type": "array",
            "items": {
                "$ref": "node"
            }
        }
    },
    "required": [
        "meta",
        "nodes"
    ],
    "definitions": {
        "node": {
            "id": "http://localhost:1234/node",
            "description": "node",
            "type": "object",
            "properties": {
                "value": {
                    "type": "number"
                },
                "subtree": {
                    "$ref": "tree"
                }
            },
            "required": [
                "value"
            ]
        }
    }
}
'
test_that("valid tree",{ 

 json <- '{
    "meta": "root",
    "nodes": [
        {
            "value": 1,
            "subtree": {
                "meta": "child",
                "nodes": [
                    {
                        "value": 1.1
                    },
                    {
                        "value": 1.2
                    }
                ]
            }
        },
        {
            "value": 2,
            "subtree": {
                "meta": "child",
                "nodes": [
                    {
                        "value": 2.1
                    },
                    {
                        "value": 2.2
                    }
                ]
            }
        }
    ]
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("invalid tree",{ 

 json <- '{
    "meta": "root",
    "nodes": [
        {
            "value": 1,
            "subtree": {
                "meta": "child",
                "nodes": [
                    {
                        "value": "string is invalid"
                    },
                    {
                        "value": 1.2
                    }
                ]
            }
        },
        {
            "value": 2,
            "subtree": {
                "meta": "child",
                "nodes": [
                    {
                        "value": 2.1
                    },
                    {
                        "value": 2.2
                    }
                ]
            }
        }
    ]
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


