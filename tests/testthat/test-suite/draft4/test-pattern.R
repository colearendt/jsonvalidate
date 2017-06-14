## DO NOT EDIT BY HAND... 

context('pattern validation')

schema <- '{
    "pattern": "^a*$"
}
'
test_that("a matching pattern is valid",{ 

 json <- '"aaa"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a non-matching pattern is invalid",{ 

 json <- '"abc"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-strings",{ 

 json <- 'true
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('pattern is not anchored')

schema <- '{
    "pattern": "a+"
}
'
test_that("matches a substring",{ 

 json <- '"xxaayy"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


