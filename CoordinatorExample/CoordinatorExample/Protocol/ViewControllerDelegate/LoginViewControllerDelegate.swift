import Foundation

protocol LoginViewControllerDelegate {
    
    func onDoneBtnClicked() -> Void
    
    func countUp(increase: Int) -> Void
}
