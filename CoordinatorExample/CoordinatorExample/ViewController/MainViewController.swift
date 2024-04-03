import UIKit

class MainViewController: UIViewController {
    
    let labelView: UILabel = {
        
        let view = UILabel()
        
        view.text = "메인화면"
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        view.addSubview(labelView)
        
        NSLayoutConstraint.activate([
            labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        let item = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(whenButtonIsTapped))
        
        self.navigationItem.rightBarButtonItem = item
    }
    
    deinit {
        
        print("deinit: \(String(describing: Self.self))")
    }
    
    @objc
    func whenButtonIsTapped() {
        
        delegate?.onLoginBtnClicked()
    }
}
