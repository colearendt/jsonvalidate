## DO NOT EDIT BY HAND... 

context('ECMA 262 regex non-compliance')

schema <- '{
    "format": "regex"
}
'
test_that("ECMA 262 has no support for \\Z anchor from .NET",{ 
skip('Test not currently supported')

 json <- '"^\\S(|(.|\\n)*\\S)\\Z"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


