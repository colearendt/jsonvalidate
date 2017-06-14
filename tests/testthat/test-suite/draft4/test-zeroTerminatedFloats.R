## DO NOT EDIT BY HAND... 

context('some languages do not distinguish between different types of numeric value')

schema <- '{
    "type": "integer"
}
'
test_that("a float is not an integer even without fractional part",{ 
skip('Test not currently supported')

 json <- '1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


