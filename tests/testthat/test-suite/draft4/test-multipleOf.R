## DO NOT EDIT BY HAND... 

context('by int')

schema <- '{
    "multipleOf": 2
}
'
test_that("int by int",{ 

 json <- '10
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("int by int fail",{ 

 json <- '7
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("ignores non-numbers",{ 

 json <- '"foo"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('by number')

schema <- '{
    "multipleOf": 1.5
}
'
test_that("zero is multiple of anything",{ 

 json <- '0
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("4.5 is multiple of 1.5",{ 

 json <- '4.5
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("35 is not multiple of 1.5",{ 

 json <- '35
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('by small number')

schema <- '{
    "multipleOf": 0.0001
}
'
test_that("0.0075 is multiple of 0.0001",{ 

 json <- '0.0075
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("0.00751 is not multiple of 0.0001",{ 
skip('Test not currently supported')

 json <- '0.00751
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


