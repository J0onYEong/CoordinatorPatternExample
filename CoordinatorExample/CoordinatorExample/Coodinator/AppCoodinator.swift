import UIKit

class AppCoodinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        
        self.navigationController = navigationController
    }
    
    func start() {
        
        showMainViewController()
    }
    
    func showMainViewController() {
        
        let coordinator = MainCoordinator(navigationController: navigationController)
        
        coordinator.delegate = self
        
        coordinator.start()
        
        childCoordinators = [coordinator]
    }
    
    func showLoginViewController() {

        let coordinator: LoginCoordinator = (
            childCoordinators.first(where: {
                type(of: $0) == LoginCoordinator.self }) as? LoginCoordinator) ?? LoginCoordinator(navigationController: navigationController)
        
        coordinator.delegate = self
        
        coordinator.start()
        
        // 기존의 Coordinator는 삭제
        childCoordinators = childCoordinators.filter({ type(of: $0) != LoginCoordinator.self })
        
        childCoordinators.append(coordinator)
    }
}

/// Main ViewController
extension AppCoodinator: MainCoordinatorDelegate {
    
    func onLoginBtnClicked() {
        
        showLoginViewController()
    }
}

/// Login ViewController
extension AppCoodinator: LoginCoordinatorDelegate {
    
    func dismissLoginViewController(coordinator: Coordinator) {
        
        guard let loginCoordinator = coordinator as? LoginCoordinator else { return }
        
        // VC는 사라지지만 Coodinator는 계속존재
        loginCoordinator.dismiss()
    }
}
