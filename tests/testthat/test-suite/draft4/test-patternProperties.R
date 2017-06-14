## DO NOT EDIT BY HAND... 

context('patternProperties validates properties matching a regex')

schema <- '{
    "patternProperties": {
        "f.*o": {
            "type": "integer"
        }
    }
}
'
test_that("a single valid match is valid",{ 

 json <- '{
    "foo": 1
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("multiple valid matches is valid",{ 

 json <- '{
    "foo": 1,
    "foooooo": 2
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a single invalid match is invalid",{ 

 json <- '{
    "foo": "bar",
    "fooooo": 2
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("multiple invalid matches is invalid",{ 

 json <- '{
    "foo": "bar",
    "foooooo": "baz"
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-objects",{ 

 json <- '12
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('multiple simultaneous patternProperties are validated')

schema <- '{
    "patternProperties": {
        "a*": {
            "type": "integer"
        },
        "aaa*": {
            "maximum": 20
        }
    }
}
'
test_that("a single valid match is valid",{ 

 json <- '{
    "a": 21
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a simultaneous match is valid",{ 

 json <- '{
    "aaaa": 18
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("multiple matches is valid",{ 

 json <- '{
    "a": 21,
    "aaaa": 18
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an invalid due to one is invalid",{ 

 json <- '{
    "a": "bar"
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an invalid due to the other is invalid",{ 

 json <- '{
    "aaaa": 31
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an invalid due to both is invalid",{ 

 json <- '{
    "aaa": "foo",
    "aaaa": 31
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('regexes are not anchored by default and are case sensitive')

schema <- '{
    "patternProperties": {
        "[0-9]{2,}": {
            "type": "boolean"
        },
        "X_": {
            "type": "string"
        }
    }
}
'
test_that("non recognized members are ignored",{ 

 json <- '{
    "answer 1": "42"
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("recognized members are accounted for",{ 

 json <- '{
    "a31b": null
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("regexes are case sensitive",{ 

 json <- '{
    "a_x_3": 3
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("regexes are case sensitive, 2",{ 

 json <- '{
    "a_X_3": 3
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


