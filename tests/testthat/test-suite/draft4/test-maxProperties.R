## DO NOT EDIT BY HAND... 

context('maxProperties validation')

schema <- '{
    "maxProperties": 2
}
'
test_that("shorter is valid",{ 

 json <- '{
    "foo": 1
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("exact length is valid",{ 

 json <- '{
    "foo": 1,
    "bar": 2
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("too long is invalid",{ 

 json <- '{
    "foo": 1,
    "bar": 2,
    "baz": 3
}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-objects",{ 

 json <- '"foobar"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


