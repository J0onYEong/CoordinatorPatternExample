import UIKit

class LoginCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    var delegate: LoginCoordinatorDelegate?
    
    var count: Int = 0
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
        
        let loginVC = LoginViewController()
        
        loginVC.delegate = self
        
        loginVC.countView.text = "\(count)"
        
        navigationController.pushViewController(loginVC, animated: true)
    }
    
    func dismiss() {
        
        if let topVC = navigationController.topViewController, type(of: topVC) == LoginViewController.self {
            
            navigationController.popViewController(animated: true)
        }
    }
}

extension LoginCoordinator: LoginViewControllerDelegate {
    
    func countUp(increase: Int) {
        
        self.count += increase
    }
    
    func onDoneBtnClicked() {
        
        delegate?.dismissLoginViewController(coordinator: self)
    }
}
