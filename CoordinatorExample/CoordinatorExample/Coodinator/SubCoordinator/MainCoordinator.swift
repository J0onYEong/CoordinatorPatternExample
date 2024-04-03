import UIKit

class MainCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    var delegate: MainCoordinatorDelegate?
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
        
        let mainVC = MainViewController()
        
        mainVC.delegate = self
        
        navigationController.viewControllers = [mainVC]
    }
}

extension MainCoordinator: MainViewControllerDelegate {
    
    func onLoginBtnClicked() {
        
        delegate?.onLoginBtnClicked()
    }
}
