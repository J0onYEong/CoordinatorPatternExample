import UIKit

@objc
protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    func start() -> Void
    @objc optional func dismiss() -> Void
}
