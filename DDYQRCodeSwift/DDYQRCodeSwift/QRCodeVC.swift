import UIKit

class QRCodeVC: UIViewController {

    lazy var barCodeImageView: UIImageView = {
        let barCodeImageView = UIImageView()
        barCodeImageView.frame = CGRect(x: 20, y: 70, width: 300, height: 100)
        return barCodeImageView
    }()

    lazy var qrCodeImageView: UIImageView = {
        let qrCodeImageView = UIImageView()
        qrCodeImageView.frame = CGRect(x: 20, y: 180, width: 200, height: 200)
        return qrCodeImageView
    }()

    lazy var logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.frame = CGRect(x: 20, y: 390, width: 200, height: 200)
        return logoImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupQRCodeImage()
    }

    private func setupViews() {
        view.backgroundColor = UIColor.white
        view.addSubview(barCodeImageView)
        view.addSubview(qrCodeImageView)
        view.addSubview(logoImageView)
    }

    private func setupQRCodeImage() {
        weak var weakSelf = self
        
        DDYQRCodeCreator.ddyBarCode("987654321123456789", DDYQRCodeConfig()) { (image, code, message) in
            if image == nil {
                print("nil \(code) \(message)")
            } else {
                print("image")
                weakSelf?.barCodeImageView.image = image
            }
        }
        DDYQRCodeCreator.ddyQRCode("www.google.com", DDYQRCodeConfig()) { (image, code, message) in
            if image == nil {
                print("nil \(code) \(message)")
            } else {
                print("image")
                weakSelf?.qrCodeImageView.image = image
            }
        }
        var config = DDYQRCodeConfig()
        config.logo = UIImage(named: "ddyTest")
        config.color = UIColor.red
        config.bgColor = UIColor.green
        DDYQRCodeCreator.ddyQRCode("www.google.com", config) { (image, code, message) in
            if image == nil {
                print("nil \(code) \(message)")
            } else {
                print("image")
                weakSelf?.logoImageView.image = image
            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let vc = DDYQRCodeScanVC()
        vc.scanResult = { (str:String) -> Void in
            print("二维码扫描结果\(str)")
        }
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
}
