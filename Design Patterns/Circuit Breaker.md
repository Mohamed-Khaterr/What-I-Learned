# Circuit Breaker Design Pattern

## Problem
We send request to Server and it response with fail for example it response with internal server error (code 500) then we send again and it response with fail again this recursion of sending request to the server with fail response will be soo bad in backend side.

## Solution
When we send request to the server and we count the requests we made, if the it response with fail then we send request again and increment the counter this counter will help us to increase the time between each request.

Example:
1. Send Request -> Fail
1. Send Request -> Fail
1. wait 5 seconds
1. Send Request -> Fail
1. wait 10 seconds
1. Send Request -> Fail
1. wait 15 secondes
1. Send Request -> Success

## Resources
- [Learn Microsoft](https://learn.microsoft.com/en-us/azure/architecture/patterns/circuit-breaker)