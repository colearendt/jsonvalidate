## DO NOT EDIT BY HAND... 

context('dependencies')

schema <- '{
    "dependencies": {
        "bar": [
            "foo"
        ]
    }
}
'
test_that("neither",{ 

 json <- '{

}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("nondependant",{ 

 json <- '{
    "foo": 1
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("with dependency",{ 

 json <- '{
    "foo": 1,
    "bar": 2
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("missing dependency",{ 

 json <- '{
    "bar": 2
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-objects",{ 

 json <- '"foo"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('multiple dependencies')

schema <- '{
    "dependencies": {
        "quux": [
            "foo",
            "bar"
        ]
    }
}
'
test_that("neither",{ 

 json <- '{

}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("nondependants",{ 

 json <- '{
    "foo": 1,
    "bar": 2
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("with dependencies",{ 

 json <- '{
    "foo": 1,
    "bar": 2,
    "quux": 3
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("missing dependency",{ 

 json <- '{
    "foo": 1,
    "quux": 2
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("missing other dependency",{ 

 json <- '{
    "bar": 1,
    "quux": 2
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("missing both dependencies",{ 

 json <- '{
    "quux": 1
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('multiple dependencies subschema')

schema <- '{
    "dependencies": {
        "bar": {
            "properties": {
                "foo": {
                    "type": "integer"
                },
                "bar": {
                    "type": "integer"
                }
            }
        }
    }
}
'
test_that("valid",{ 

 json <- '{
    "foo": 1,
    "bar": 2
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("no dependency",{ 

 json <- '{
    "foo": "quux"
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("wrong type",{ 

 json <- '{
    "foo": "quux",
    "bar": 2
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("wrong type other",{ 

 json <- '{
    "foo": 2,
    "bar": "quux"
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("wrong type both",{ 

 json <- '{
    "foo": "quux",
    "bar": "quux"
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


