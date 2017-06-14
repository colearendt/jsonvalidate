## DO NOT EDIT BY HAND... 

context('simple enum validation')

schema <- '{
    "enum": [
        1,
        2,
        3
    ]
}
'
test_that("one of the enum is valid",{ 

 json <- '1
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("something else is invalid",{ 

 json <- '4
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('heterogeneous enum validation')

schema <- '{
    "enum": [
        6,
        "foo",
        [

        ],
        true,
        {
            "foo": 12
        }
    ]
}
'
test_that("one of the enum is valid",{ 

 json <- '[

]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("something else is invalid",{ 

 json <- 'null
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("objects are deep compared",{ 

 json <- '{
    "foo": false
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('enums in properties')

schema <- '{
    "type": "object",
    "properties": {
        "foo": {
            "enum": [
                "foo"
            ]
        },
        "bar": {
            "enum": [
                "bar"
            ]
        }
    },
    "required": [
        "bar"
    ]
}
'
test_that("both properties are valid",{ 

 json <- '{
    "foo": "foo",
    "bar": "bar"
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("missing optional property is valid",{ 

 json <- '{
    "bar": "bar"
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("missing required property is invalid",{ 

 json <- '{
    "foo": "foo"
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("missing all properties is invalid",{ 

 json <- '{

}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


