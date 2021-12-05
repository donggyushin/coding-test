There are N guests (numbered from 0 to N-1) in a sanatorium waiting to be assigned a room. In each room, any number of guests can be accomodated. However, not all guests like to have a lot of roommates.

You are given an array A of N integers: the K-th guest wants to be in a room that contains at most A[K] guests, including themselves.

Write a function:

```
public func solution(_ A: inout[Int]) -> Int
```

that given the array A, returns the minimum number of rooms needed to acommodate all guests.
