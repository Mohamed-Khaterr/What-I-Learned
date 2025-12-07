# Decorator Design Pattern
The Decorator Design Pattern is a software design pattern that allows you to add new functionality to an object dynamically without modifying its original implementation. It is one of the structural design patterns defined by the Gang of Four (GoF) in their book “Design Patterns: Elements of Reusable Object-Oriented Software.”

# Retry Strategy
A retry mechanism is a way to automatically re-attempt an operation that might fail due to transient issues, such as network interruptions or temporary server unavailability. 

### Problem
When communicating with external APIs, you often face intermittent failures caused by network instability, timeouts, or server-side issues.

### Solution
To make your app resilient, implementing an HTTP retry mechanism is a common strategy to ensure reliability.

- Create a protocol that defines the behavior of an API service.
```swift
protocol APIServiceContract {
    func perform(request: URLRequest) async throws -> Data
}
```

- Implement the basic API service, which simply makes the network request.
```swift
struct APIService: APIServiceContract {
    func perform(request: URLRequest) async throws -> Data {
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
```

- Create the retry mechanism by decorating the APIClient implementation.
```swift
struct RetryAPIServiceDecorator: APIServiceContract {
    private let wrapped: APIServiceContract
    private let maxRetries: Int
    
    init(wrapped: APIServiceContract, maxRetries: Int) {
        self.wrapped = wrapped
        self.maxRetries = maxRetries
    }
    
    func perform(request: URLRequest) async throws -> Data {
        try await performRequestWithRetry(request, retriesLeft: maxRetries)
    }
    
    func performRequestWithRetry(_ request: URLRequest, retriesLeft: Int) async throws -> Data {
        do {
            let data = try await perform(request: request)
            return data // Success, pass the result to the caller
        } catch {
            if retriesLeft > 0 {
                // Decrement the retriesLeft
                return try await performRequestWithRetry(request, retriesLeft: retriesLeft - 1)
            } else {
                throw error // No retries left, pass the failure to the caller
            }
        }
    }
}
```

# Reference
- [Title: Implementing HTTP Retry Strategy in Swift Using the Decorator Pattern](https://medium.com/@tushar.sharma0214/title-implementing-http-retry-strategy-in-swift-using-the-decorator-pattern-9f5ec4facf00)
- [Decorator Design pattern -swift- Examples](https://shrawan25-sharma.medium.com/decorator-design-pattern-swift-examples-1234f89e8834)