## DO NOT EDIT BY HAND... 

context('maxItems validation')

schema <- '{
    "maxItems": 2
}
'
test_that("shorter is valid",{ 

 json <- '[
    1
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("exact length is valid",{ 

 json <- '[
    1,
    2
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("too long is invalid",{ 

 json <- '[
    1,
    2,
    3
]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-arrays",{ 

 json <- '"foobar"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


