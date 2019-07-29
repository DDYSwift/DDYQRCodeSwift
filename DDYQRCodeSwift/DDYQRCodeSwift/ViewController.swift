import UIKit

class ViewController: UIViewController {

    lazy var clickButton: UIButton = {
        let button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(pushQRCodeVC), for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 100, width: UIScreen.main.bounds.width-200, height: 30)
        button.setTitle("点击", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.backgroundColor = UIColor.lightGray
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(clickButton)
    }

    @objc func pushQRCodeVC() {
        self.navigationController?.pushViewController(QRCodeVC(), animated: true)
    }
}

