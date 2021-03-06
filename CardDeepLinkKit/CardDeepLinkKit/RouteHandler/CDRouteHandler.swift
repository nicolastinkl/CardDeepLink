//
//  CDRegularHandler.swift
//
// Copyright (c) 2016 AsiaInfo
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import Foundation

/**
 * Implement this method on conforming view controllers to configure it with data provided by the passed deep link.
  @note Depending on your view controller implementation, its views may not be instantiated when this method gets called. In that case, you might store the relevantdata and configure its views in '-[UIViewController ViewDidLoad]'.
 */
public protocol CDTargetViewController: class{
    func configureWithDeepLink(deepLink: CDDeepLink)
}

public class CDViewController: UIViewController,CDTargetViewController{
    public func configureWithDeepLink(deepLink: CDDeepLink) {
        
    }
}

/**
 A base class for handling routes.
 */
public class CDRouteHandler: NSObject{
     
    required public override init() {
        super.init()
    }
    
    /**
     Indicates whether the deep link should be handled.
     */
    public func shouldHandleDeepLink(deeplink: CDDeepLink) -> Bool{
        return true
    }
    
    
    public func preferModalPresentation() -> Bool{
        return false
    }
    
    public func targetViewController() -> CDViewController?{
        return nil
    }
    
    public func viewControllerForPresentingDeepLink(deepLink: CDDeepLink) -> UIViewController?{
         return UIApplication.sharedApplication().keyWindow?.rootViewController
    }
    
    public func presentTargetViewController(targetViewController: CDViewController,presentingViewController:UIViewController){
        if preferModalPresentation() || !presentingViewController.isKindOfClass(UINavigationController.self)  {
            presentingViewController.presentViewController(targetViewController, animated: false, completion: nil)
        }else if presentingViewController.isKindOfClass(UINavigationController.self)  {
            placeTargetViewController(targetViewController, navigationController: presentingViewController as? UINavigationController)
        }
    }
    
    
    private func placeTargetViewController(targetViewController: UIViewController,navigationController: UINavigationController?){
        if let navigationController = navigationController {
            if navigationController.viewControllers.contains(targetViewController) {
                navigationController.popToViewController(targetViewController, animated: false)
            }else{
                for controller in navigationController.viewControllers{
                    navigationController.popToViewController(controller, animated: false)
                    navigationController.popViewControllerAnimated(false)
                    
                    if controller.isEqual(navigationController.topViewController) {
                        navigationController.setViewControllers([targetViewController], animated: false)
                    }
                    break
                }
                
                if ((navigationController.topViewController?.isEqual(targetViewController)) != true) {
                    navigationController.pushViewController(targetViewController, animated: false)
                }
                
            }
        }
        
    }
    
}