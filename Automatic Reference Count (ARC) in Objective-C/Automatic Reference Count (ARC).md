# Automatic Reference Count (ARC)

## Table of Content
1. Introduction
2. How ARC works
3. Retain Cycle
4. Problem of ARC
5. Fixing the Problem of ARC

## Figures
1. Demonstrate RC
2. Retain Cycle Occurs
3. Prevent from Retain Cycle


## Introduction
ARC is memory management feature introduced in Objective-C to automatically handle the Memory Management for the objects.

**ARC is not a Garbage Collector**


## How ARC works
So how ARC works it tracks the number of strong reference to an object and automatically release the object from memory when there are no more strong reference to it.

In other worlds when we create an object the Reference Count will increment by one and it will decrements when the object is no longer needed until Reference Count go to zero then the object will release from memory.

```swift
// Assume that we Create Class called Person and it has property called name of type NSString

// Then we initialize this object of type Person
Person *person1 = [[Person alloc] init]; // Reference count of this person1 will increment by one RC = 1

person1 = nil; // Reference count of this person1 will decrement by one RC = 0

// Now object person1 is no longer needed so it will Release from Memory
```
> *figure 1 Demonstrate RC* 

ARC is a powerful feature that manage memory by handling object Reference count automatically.

## Retain Cycle
Retain Cycle occurs when two or more objects are hold a strong reference to each other, Preventing the object from being released from Memory even when they are no longer needed.

## Problem of ARC
ARC help the developer to track the object and release it from memory when it no longer needed automatically.

While ARC is a great and simplify Memory Management, Developer could made a Retain Cycle. and ARC doesn't prevent from Retain Cycle.

```swift
// Create Class called Person and it has property called friend of type Person
@interface Person: NSObject

// By default it's strong reference
@property (strong) Person *friend;

@end


// Then we initialize object of type Person called aly
Person *aly = [[Person alloc] init]; // RC = 1

// And initialize other object of type Person called ahmed
Person *ahmed = [[Person alloc] init]; // RC = 1


// Now we set ahmed as friend of aly
aly.friend = ahmed

// And set aly as friend of ahmed
ahmed.friend = aly


// Now if we wont to set object aly to nil
aly = nil; // RC of aly = 1 -> Reference count does not decrement 

// And if we wont to set object ahmed to nil
ahmed = nil; // RC of ahmed = 1 -> Reference count does not decrement too
```
> *figure 2 Retain Cycle Occurs*

In figure 2, The object aly and object ahmed does not decrement there reference count Why is that!

The reason of this behavior, That we create strong reference between aly and ahmed by using friend property, When we set ahmed as friend of aly now aly has strong reference to ahmed and the same goes to ahmed when we set aly as friend of ahmed now ahmed has strong reference to aly, Now aly and ahmed are strongly referenced to each other this cause a Retain Cycle to objects has strong reference to each other. 

## Fixing the Problem of ARC
To fix the problem in the *figure 2*, We need to make one of this objects has weak reference to the other this will prevent from Retain Cycle and it will decrement reference count of the object that is not needed.

Go to *figure 3* to see how we can implement weak reference.

```swift
// Create Class called Person and it has property called friend of type Person
@interface Person: NSObject

// We need to tell to the object that friend is weak reference by adding (weak keyword) so we can set it to nil
@property (weak) Person *friend;

@end


// Then we initialize object of type Person called aly
Person *aly = [[Person alloc] init]; // RC = 1

// And initialize other object of type Person called ahmed
Person *ahmed = [[Person alloc] init]; // RC = 1


// Now we set ahmed as friend of aly
aly.friend = ahmed

// And set aly as friend of ahmed
ahmed.friend = aly


aly = nil; // RC of aly = 0 -> Now Reference count for aly is decremented as expected

ahmed = nil; // RC of ahmed = 0 -> And Reference count ahmed is decremented as expected
```
> *figure 3 Prevent from Retain Cycle*