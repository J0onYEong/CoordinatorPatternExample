import UIKit

class LoginViewController: UIViewController {
    
    let labelView: UILabel = {
        
        let view = UILabel()
        
        view.text = "로그인 화면"
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let countView: UILabel = {
       
        let view = UILabel()
        
        view.text = ""
        view.textColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .red
        view.addSubview(labelView)
        view.addSubview(countView)
        
        NSLayoutConstraint.activate([
            labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            countView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            countView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 30)
        ])
        
        let item = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(whenButtonIsTapped))
        
        self.navigationItem.rightBarButtonItem = item
    }
    
    deinit {
        
        print("deinit: \(String(describing: Self.self))")
    }

    @objc
    func whenButtonIsTapped() {
        
        // 화면을 이탈할 떄마다 카운트 증가(Coordinator가 관리하는 데이터)
        delegate?.countUp(increase: 1)
        
        delegate?.onDoneBtnClicked()
    }
}

