## DO NOT EDIT BY HAND... 

context('integer type matches integers')

schema <- '{
    "type": "integer"
}
'
test_that("an integer is an integer",{ 

 json <- '1
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a float is not an integer",{ 

 json <- '1.1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a string is not an integer",{ 

 json <- '"foo"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a string is still not an integer, even if it looks like one",{ 

 json <- '"1"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an object is not an integer",{ 

 json <- '{

}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an array is not an integer",{ 

 json <- '[

]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a boolean is not an integer",{ 

 json <- 'true
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("null is not an integer",{ 

 json <- 'null
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('number type matches numbers')

schema <- '{
    "type": "number"
}
'
test_that("an integer is a number",{ 

 json <- '1
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a float is a number",{ 

 json <- '1.1
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a string is not a number",{ 

 json <- '"foo"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a string is still not a number, even if it looks like one",{ 

 json <- '"1"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an object is not a number",{ 

 json <- '{

}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an array is not a number",{ 

 json <- '[

]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a boolean is not a number",{ 

 json <- 'true
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("null is not a number",{ 

 json <- 'null
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('string type matches strings')

schema <- '{
    "type": "string"
}
'
test_that("1 is not a string",{ 

 json <- '1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a float is not a string",{ 

 json <- '1.1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a string is a string",{ 

 json <- '"foo"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a string is still a string, even if it looks like a number",{ 

 json <- '"1"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an object is not a string",{ 

 json <- '{

}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an array is not a string",{ 

 json <- '[

]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a boolean is not a string",{ 

 json <- 'true
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("null is not a string",{ 

 json <- 'null
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('object type matches objects')

schema <- '{
    "type": "object"
}
'
test_that("an integer is not an object",{ 

 json <- '1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a float is not an object",{ 

 json <- '1.1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a string is not an object",{ 

 json <- '"foo"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an object is an object",{ 

 json <- '{

}
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an array is not an object",{ 

 json <- '[

]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a boolean is not an object",{ 

 json <- 'true
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("null is not an object",{ 

 json <- 'null
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('array type matches arrays')

schema <- '{
    "type": "array"
}
'
test_that("an integer is not an array",{ 

 json <- '1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a float is not an array",{ 

 json <- '1.1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a string is not an array",{ 

 json <- '"foo"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an object is not an array",{ 

 json <- '{

}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an array is an array",{ 

 json <- '[

]
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a boolean is not an array",{ 

 json <- 'true
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("null is not an array",{ 

 json <- 'null
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('boolean type matches booleans')

schema <- '{
    "type": "boolean"
}
'
test_that("an integer is not a boolean",{ 

 json <- '1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a float is not a boolean",{ 

 json <- '1.1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a string is not a boolean",{ 

 json <- '"foo"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an object is not a boolean",{ 

 json <- '{

}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an array is not a boolean",{ 

 json <- '[

]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a boolean is a boolean",{ 

 json <- 'true
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("null is not a boolean",{ 

 json <- 'null
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('null type matches only the null object')

schema <- '{
    "type": "null"
}
'
test_that("an integer is not null",{ 

 json <- '1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a float is not null",{ 

 json <- '1.1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a string is not null",{ 

 json <- '"foo"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an object is not null",{ 

 json <- '{

}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an array is not null",{ 

 json <- '[

]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a boolean is not null",{ 

 json <- 'true
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("null is null",{ 

 json <- 'null
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


context('multiple types can be specified in an array')

schema <- '{
    "type": [
        "integer",
        "string"
    ]
}
'
test_that("an integer is valid",{ 

 json <- '1
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a string is valid",{ 

 json <- '"foo"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a float is invalid",{ 

 json <- '1.1
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an object is invalid",{ 

 json <- '{

}
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an array is invalid",{ 

 json <- '[

]
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a boolean is invalid",{ 

 json <- 'true
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("null is invalid",{ 

 json <- 'null
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


