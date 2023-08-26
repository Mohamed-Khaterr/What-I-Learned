/*

REFERENCE: https://www.youtube.com/watch?v=KK6ryBmTKHg&pp=ygUNY29tYmluZSBzd2lmdA%3D%3D

There are two types of built-in subjects with Combine: CurrentValueSubject and PassthroughSubject, Both will provide updated values to any subscribers when .send() is invoked.
CurrentValueSubject: requires initial state (value)
PassthroughSubject: doesn't need initial state (value)


.eraseToAnyPublisher()
if we have a Publisher that looks like this: Publishers.FlatMap<Publishers.Map<Publishers.Catch<Future<String, Error>, Just<String>>, String>, PassthroughSubject<String, Never>>
So we don't want any one to see all of these nested Publishers we just use .eraseToAnyPublisher()
*/
import UIKit
import Combine


// MARK: - Service
protocol QuoteServiceType {
  func getRandomQuote() -> AnyPublisher<Quote, Error>
}

class QuoteService: QuoteServiceType {
  
  func getRandomQuote() -> AnyPublisher<Quote, Error> {
    let url = URL(string: "https://api.quotable.io/random")!
    return URLSession.shared.dataTaskPublisher(for: url)
      .catch { error in
        return Fail(error: error).eraseToAnyPublisher()
      }.map({ $0.data })
      .decode(type: Quote.self, decoder: JSONDecoder())
      .eraseToAnyPublisher()
  }
}



// MARK: - Model
struct Quote: Decodable {
  let content: String
  let author: String
}



// MARK: - ViewModel
class QuoteViewModel {
  
  enum Input {
    case viewDidAppear
    case refreshButtonDidTap
  }
  
  enum Output {
    case fetchQuoteDidFail(error: Error)
    case fetchQuoteDidSucceed(quote: Quote)
    case toggleButton(isEnabled: Bool)
  }
  
  private let quoteServiceType: QuoteServiceType

  // Subject | only Subject has .send(_:) method
  private let outputPublisher: PassthroughSubject<Output, Never> = .init() // PassthroughSubject doesn't need initial state

  // For Subscribers
  private var cancellables = Set<AnyCancellable>()
  
  init(quoteServiceType: QuoteServiceType = QuoteService()) {
    self.quoteServiceType = quoteServiceType
  }
  
  func transform(input: AnyPublisher<Input, Never>) -> AnyPublisher<Output, Never> {
    input.sink { [weak self] event in
      switch event {
      case .viewDidAppear, .refreshButtonDidTap:
        self?.handleGetRandomQuote()
      }
    }.store(in: &cancellables)
    return outputPublisher.eraseToAnyPublisher()
  }
  
  private func handleGetRandomQuote() {
    outputPublisher.send(.toggleButton(isEnabled: false))
    quoteServiceType.getRandomQuote().sink { [weak self] completion in
      self?.outputPublisher.send(.toggleButton(isEnabled: true))
      if case .failure(let error) = completion {
        self?.outputPublisher.send(.fetchQuoteDidFail(error: error))
      }
    } receiveValue: { [weak self] quote in
      self?.outputPublisher.send(.fetchQuoteDidSucceed(quote: quote))
    }.store(in: &cancellables)
  }
}



// MARK: - View
class QuoteViewController: UIViewController {

  @IBOutlet weak var quoteLabel: UILabel!
  @IBOutlet weak var refreshButton: UIButton!
  
  private let vm = QuoteViewModel()
  private let input: PassthroughSubject<QuoteViewModel.Input, Never> = .init()
  private var cancellables = Set<AnyCancellable>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    bind()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    input.send(.viewDidAppear)
  }
  
  private func bind() {
    let output = vm.transform(input: input.eraseToAnyPublisher())
    output
      .receive(on: DispatchQueue.main)
      .sink { [weak self] event in
      switch event {
      case .fetchQuoteDidSucceed(let quote):
        self?.quoteLabel.text = quote.content
      case .fetchQuoteDidFail(let error):
        self?.quoteLabel.text = error.localizedDescription
      case .toggleButton(let isEnabled):
        self?.refreshButton.isEnabled = isEnabled
      }
    }.store(in: &cancellables)
    
  }

  @IBAction func refreshButtonTapped(_ sender: Any) {
    input.send(.refreshButtonDidTap)
  }
}