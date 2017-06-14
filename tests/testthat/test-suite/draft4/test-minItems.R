## DO NOT EDIT BY HAND... 

context('minItems validation')

schema <- '{
    "minItems": 1
}
'
test_that("longer is valid",{ 

 json <- '[
    1,
    2
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("exact length is valid",{ 

 json <- '[
    1
]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("too short is invalid",{ 

 json <- '[

]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-arrays",{ 

 json <- '""
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


