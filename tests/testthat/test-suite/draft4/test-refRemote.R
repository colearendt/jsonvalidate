## DO NOT EDIT BY HAND... 

context('remote ref')

schema <- '{
    "$ref": "http://localhost:1234/integer.json"
}
'
test_that("remote ref valid",{ 
skip('Test not currently supported')

 json <- '1
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("remote ref invalid",{ 
skip('Test not currently supported')

 json <- '"a"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('fragment within remote ref')

schema <- '{
    "$ref": "http://localhost:1234/subSchemas.json#/integer"
}
'
test_that("remote fragment valid",{ 
skip('Test not currently supported')

 json <- '1
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("remote fragment invalid",{ 
skip('Test not currently supported')

 json <- '"a"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('ref within remote ref')

schema <- '{
    "$ref": "http://localhost:1234/subSchemas.json#/refToInteger"
}
'
test_that("ref within ref valid",{ 
skip('Test not currently supported')

 json <- '1
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ref within ref invalid",{ 
skip('Test not currently supported')

 json <- '"a"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('base URI change')

schema <- '{
    "id": "http://localhost:1234/",
    "items": {
        "id": "folder/",
        "items": {
            "$ref": "folderInteger.json"
        }
    }
}
'
test_that("base URI change ref valid",{ 
skip('Test not currently supported')

 json <- '[
    [
        1
    ]
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("base URI change ref invalid",{ 
skip('Test not currently supported')

 json <- '[
    [
        "a"
    ]
]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('base URI change - change folder')

schema <- '{
    "id": "http://localhost:1234/scope_change_defs1.json",
    "type": "object",
    "properties": {
        "list": {
            "$ref": "#/definitions/baz"
        }
    },
    "definitions": {
        "baz": {
            "id": "folder/",
            "type": "array",
            "items": {
                "$ref": "folderInteger.json"
            }
        }
    }
}
'
test_that("number is valid",{ 
skip('Test not currently supported')

 json <- '{
    "list": [
        1
    ]
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("string is invalid",{ 
skip('Test not currently supported')

 json <- '{
    "list": [
        "a"
    ]
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('base URI change - change folder in subschema')

schema <- '{
    "id": "http://localhost:1234/scope_change_defs2.json",
    "type": "object",
    "properties": {
        "list": {
            "$ref": "#/definitions/baz/definitions/bar"
        }
    },
    "definitions": {
        "baz": {
            "id": "folder/",
            "definitions": {
                "bar": {
                    "type": "array",
                    "items": {
                        "$ref": "folderInteger.json"
                    }
                }
            }
        }
    }
}
'
test_that("number is valid",{ 
skip('Test not currently supported')

 json <- '{
    "list": [
        1
    ]
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("string is invalid",{ 
skip('Test not currently supported')

 json <- '{
    "list": [
        "a"
    ]
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('root ref in remote ref')

schema <- '{
    "id": "http://localhost:1234/object",
    "type": "object",
    "properties": {
        "name": {
            "$ref": "name.json#/definitions/orNull"
        }
    }
}
'
test_that("string is valid",{ 
skip('Test not currently supported')

 json <- '{
    "name": "foo"
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("null is valid",{ 
skip('Test not currently supported')

 json <- '{
    "name": null
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("object is invalid",{ 
skip('Test not currently supported')

 json <- '{
    "name": {
        "name": null
    }
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


