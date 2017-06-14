## DO NOT EDIT BY HAND... 

context('valid definition')

schema <- '{
    "$ref": "http://json-schema.org/draft-04/schema#"
}
'
test_that("valid definition schema",{ 
skip('Test not currently supported')

 json <- '{
    "definitions": {
        "foo": {
            "type": "integer"
        }
    }
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('invalid definition')

schema <- '{
    "$ref": "http://json-schema.org/draft-04/schema#"
}
'
test_that("invalid definition schema",{ 
skip('Test not currently supported')

 json <- '{
    "definitions": {
        "foo": {
            "type": 1
        }
    }
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


