# Command Design Pattern
Command is a **behavioral design pattern** that turns a request into a stand-alone object that contains all information about the request. This transformation lets you pass requests as a method arguments, delay or queue a request’s execution, and support undoable operations.

### Problems It Solves
The Command Pattern solves the following problems:
- Decoupling senders and receivers: It decouples the sender of a request from the receiver, allowing clients to send requests to receivers without needing to know the receiver’s class.
- Parameterization of requests: It allows you to parameterize requests, making it easy to configure and customize the behavior of commands.
- Queueing and managing requests: It provides a structure for queuing and managing requests, enabling features like undo and redo functionality.

### Components of the Command Design Pattern:
### 1. Command Interface
The Command Interface is blueprint that all command classes follow. It declares a common method `execute()` ensuring that every concrete command knows how to perform its specific action.
```swift
protocol Command {
    func execute()
}
```

### 2. Concrete Command Classes
Concrete Command Classes are the specific commands, like setup *Localization*, *Firebase* and *Analytics* configurations. Each class encapsulates the details of a particular action. These classes act as executable instructions that the remote control can trigger without worrying about the small details.
```swift
// MARK: - Localization
class LocalizationManager {
    func setupLocalization() {
        // Setup..
    }
}

extension LocalizationManager: Command {
    func execute() {
        setup()
    }
}

// MARK: - Analytics
struct AnalyticsManager {
    func setup() {
        // Setup..
    }
}

extension AnalyticsManager: Command {
    func execute() {
        setup()
    }
}

// MARK: - Firebase
struct FirebaseCommand: Command {
    func execute() {
        Firebase.configure()
    }
}

// MARK: - GoogleMaps
struct GoogleMapsCommand: Command {
    func execute() {
        GoogleMaps.setupConfiguration()
    }
}
```

### 3. Invoker
The Invoker, often a remote control, is the one responsible for initiating command execution. It holds a reference to a command but doesn’t delve into the specifics of how each command works. It’s like a button that, when pressed, makes things happen.
```swift
// invoker 
struct AppDelegateCommandBuilder {
    func build() -> [Command] {
        [
            LocalizationManager(),
            AnalyticsManager(),
            FirebaseCommand(),
            GoogleMapsCommand()
        ]
    }
}
```

### 4. Receiver or Client
```swift
class AppDelegate: UIResponder, UIApplicationDelegate {
    let command = AppDelegateCommandBuilder()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        command.build().forEach({ $0.execute() })
        return true
    }
}
```
