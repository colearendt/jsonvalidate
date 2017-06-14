## DO NOT EDIT BY HAND... 

context('required validation')

schema <- '{
    "properties": {
        "foo": {

        },
        "bar": {

        }
    },
    "required": [
        "foo"
    ]
}
'
test_that("present required property is valid",{ 

 json <- '{
    "foo": 1
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("non-present required property is invalid",{ 

 json <- '{
    "bar": 1
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-objects",{ 

 json <- '12
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('required default validation')

schema <- '{
    "properties": {
        "foo": {

        }
    }
}
'
test_that("not required by default",{ 

 json <- '{

}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


