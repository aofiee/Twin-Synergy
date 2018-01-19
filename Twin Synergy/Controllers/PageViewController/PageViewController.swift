//
//  PageViewController.swift
//  Twin Synergy
//
//  Created by SkullTree on 16/1/2561 BE.
//  Copyright © 2561 SkullTree. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    var currentPageIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        initNotificationCenter()
        self.dataSource = self
        self.delegate = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }

    }
    func initNotificationCenter(){
        NotificationCenter.default.addObserver(self, selector: #selector(changeButtonColor(notification:)), name: .all, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeButtonColor(notification:)), name: .web, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(changeButtonColor(notification:)), name: .mobile, object: nil)
    }
    @objc func changeButtonColor(notification: NSNotification) {
        if notification.name == .all {
            self.setViewControllers([self.orderedViewControllers[0]], direction: .forward, animated: true, completion: nil)
        }
        if notification.name == .web {
            self.setViewControllers([self.orderedViewControllers[1]], direction: .forward, animated: true, completion: nil)
        }
        if notification.name == .mobile {
            self.setViewControllers([self.orderedViewControllers[2]], direction: .forward, animated: true, completion: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [
            self.newColoredViewController(viewName: "HomeViewController"),
            self.newColoredViewController(viewName: "WebSiteViewController"),
            self.newColoredViewController(viewName: "MobileViewController")
        ]
    }()
    private func newColoredViewController(viewName: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: viewName)
    }
}

extension PageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return orderedViewControllers.last
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            return orderedViewControllers.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }

        
        return orderedViewControllers[nextIndex]
    }
    
    func goToNextPage(){
        
        guard let currentViewController = self.viewControllers?.first else { return }
        
        guard let nextViewController = dataSource?.pageViewController( self, viewControllerAfter: currentViewController ) else { return }
        
        setViewControllers([nextViewController], direction: .forward, animated: false, completion: nil)
        
    }
    
    
    func goToPreviousPage(){
        
        guard let currentViewController = self.viewControllers?.first else { return }
        
        guard let previousViewController = dataSource?.pageViewController( self, viewControllerBefore: currentViewController ) else { return }
        
        setViewControllers([previousViewController], direction: .reverse, animated: false, completion: nil)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        currentPageIndex = pageViewController.viewControllers!.first!.view.tag
        NotificationCenter.default.post(name: .switchBtn, object: currentPageIndex)
    }
    
}

extension Notification.Name {
    static let switchBtn = Notification.Name("switchBtn")
}
