## DO NOT EDIT BY HAND... 

context('validation of date-time strings')

schema <- '{
    "format": "date-time"
}
'
test_that("a valid date-time string",{ 

 json <- '"1963-06-19T08:30:06.283185Z"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an invalid date-time string",{ 

 json <- '"06/19/1963 08:30:06 PST"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("only RFC3339 not all of ISO 8601 are valid",{ 

 json <- '"2013-350T01:01:01"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('validation of URIs')

schema <- '{
    "format": "uri"
}
'
test_that("a valid URI",{ 

 json <- '"http://foo.bar/?baz=qux#quux"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an invalid protocol-relative URI Reference",{ 

 json <- '"//foo.bar/?baz=qux#quux"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an invalid URI",{ 

 json <- '"\\\\WINDOWS\\fileshare"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an invalid URI though valid URI reference",{ 

 json <- '"abc"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('validation of e-mail addresses')

schema <- '{
    "format": "email"
}
'
test_that("a valid e-mail address",{ 

 json <- '"joe.bloggs@example.com"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an invalid e-mail address",{ 

 json <- '"2962"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('validation of IP addresses')

schema <- '{
    "format": "ipv4"
}
'
test_that("a valid IP address",{ 

 json <- '"192.168.0.1"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an IP address with too many components",{ 

 json <- '"127.0.0.0.1"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an IP address with out-of-range values",{ 

 json <- '"256.256.256.256"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an IP address without 4 components",{ 

 json <- '"127.0"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an IP address as an integer",{ 

 json <- '"0x7f000001"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('validation of IPv6 addresses')

schema <- '{
    "format": "ipv6"
}
'
test_that("a valid IPv6 address",{ 

 json <- '"::1"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an IPv6 address with out-of-range values",{ 

 json <- '"12345::"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an IPv6 address with too many components",{ 

 json <- '"1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("an IPv6 address containing illegal characters",{ 

 json <- '"::laptop"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


context('validation of host names')

schema <- '{
    "format": "hostname"
}
'
test_that("a valid host name",{ 

 json <- '"www.example.com"
'
 expect_true(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a host name starting with an illegal character",{ 

 json <- '"-a-host-name-that-starts-with--"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a host name containing illegal characters",{ 

 json <- '"not_a_valid_host_name"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


test_that("a host name with a component too long",{ 

 json <- '"a-vvvvvvvvvvvvvvvveeeeeeeeeeeeeeeerrrrrrrrrrrrrrrryyyyyyyyyyyyyyyy-long-host-name-component"
'
 expect_false(json_validate(json,schema,verbose=TRUE)) 
})


