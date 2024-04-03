import Foundation

protocol Coordinator: class {
    
    var childCoordinators: [Coordinator] { get set }
    func start() -> Void
}

