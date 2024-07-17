# Swift Concurrency

## Async/Await
- 

## Tasks
> Async/Await must run in Task context.

> In the TaskGroup if one of the tasks throw then the other awaiting tasks will canceled.

> Concurrent means Parallel tasks

## Actors
- Actors are like Classes both are stored in Heap memory and The only difference is If there are two threads accessing Heap memory, one of them has to wait for another thread to finish the process.
- Actors are **Thread-Safe**.
- Actors uses `actor-isolation` mechanism, This means that if actor run outside its context it will give compile time error.
- Actors making sure that the methods are always will run in Single thread. *It protect the state by running the code in isolation context.*
- Actors make sure that the code are executed **serially** and sometimes **asynchronously**.

## Race Condition
Race Condition is type of Software bug. Where multiple threads making changes on the same resource which lead to inconsistency in the resource and unexpected behavior.