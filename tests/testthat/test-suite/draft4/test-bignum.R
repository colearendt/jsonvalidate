## DO NOT EDIT BY HAND... 

context('integer')

schema <- '{
    "type": "integer"
}
'
test_that("a bignum is an integer",{ 

 json <- '1.23456789101112e+52
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('number')

schema <- '{
    "type": "number"
}
'
test_that("a bignum is a number",{ 

 json <- '9.82492837492349e+52
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('integer')

schema <- '{
    "type": "integer"
}
'
test_that("a negative bignum is an integer",{ 

 json <- '-1.23456789101112e+52
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('number')

schema <- '{
    "type": "number"
}
'
test_that("a negative bignum is a number",{ 

 json <- '-9.82492837492349e+52
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('string')

schema <- '{
    "type": "string"
}
'
test_that("a bignum is not a string",{ 

 json <- '9.82492837492349e+52
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('integer comparison')

schema <- '{
    "maximum": 1.84467440737096e+19
}
'
test_that("comparison works for high numbers",{ 

 json <- '1.84467440737096e+19
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('float comparison with high precision')

schema <- '{
    "maximum": 9.72783798187987e+26,
    "exclusiveMaximum": true
}
'
test_that("comparison works for high numbers",{ 

 json <- '9.72783798187987e+26
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('integer comparison')

schema <- '{
    "minimum": -1.84467440737096e+19
}
'
test_that("comparison works for very negative numbers",{ 

 json <- '-1.84467440737096e+19
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('float comparison with high precision on negative numbers')

schema <- '{
    "minimum": -9.72783798187987e+26,
    "exclusiveMinimum": true
}
'
test_that("comparison works for very negative numbers",{ 

 json <- '-9.72783798187987e+26
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


