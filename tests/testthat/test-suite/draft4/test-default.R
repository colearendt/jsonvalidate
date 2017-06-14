## DO NOT EDIT BY HAND... 

context('invalid type for default')

schema <- '{
    "properties": {
        "foo": {
            "type": "integer",
            "default": [

            ]
        }
    }
}
'
test_that("valid when property is specified",{ 

 json <- '{
    "foo": 13
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("still valid when the invalid default is used",{ 

 json <- '{

}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('invalid string value for default')

schema <- '{
    "properties": {
        "bar": {
            "type": "string",
            "minLength": 4,
            "default": "bad"
        }
    }
}
'
test_that("valid when property is specified",{ 

 json <- '{
    "bar": "good"
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("still valid when the invalid default is used",{ 

 json <- '{

}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


