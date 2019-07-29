import UIKit

class DDYNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated);
    }
}
