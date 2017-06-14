## DO NOT EDIT BY HAND... 

context('minProperties validation')

schema <- '{
    "minProperties": 1
}
'
test_that("longer is valid",{ 

 json <- '{
    "foo": 1,
    "bar": 2
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("exact length is valid",{ 

 json <- '{
    "foo": 1
}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("too short is invalid",{ 

 json <- '{

}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-objects",{ 

 json <- '""
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


