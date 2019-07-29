import UIKit

class DDYTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addChild(self.myNavigation("ViewController", "ceshi", "ddyTest"))
        self.addChild(self.myNavigation("ViewController", "ceshi", "ddyTest"))
        self.addChild(self.myNavigation("ViewController", "ceshi", "ddyTest"))
        self.addChild(self.myNavigation("ViewController", "ceshi", "ddyTest"))
    }

    private func myNavigation(_ classKey:String,_ titleKey:String,_ imgKey:String) -> DDYNavigationController {
        let projectName = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let className = projectName + "." + classKey
        let cls = NSClassFromString(className) as? UIViewController.Type
        let vc = cls?.init()
        vc?.title = titleKey
        vc?.tabBarItem.image = UIImage.init(named: imgKey)
        vc?.tabBarItem.selectedImage = UIImage(named: imgKey)
        return DDYNavigationController.init(rootViewController: vc ?? UIViewController())
    }

}
