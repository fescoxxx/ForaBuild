//
//  CoutntListViewController.swift
//  ForaBuild
//
//  Created by Роман Давыдов on 05.08.2018.
//  Copyright © 2018 Админ. All rights reserved.
//

import UIKit

class CoutntListViewController: UIPageViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {

    lazy var  VCArr: [UIViewController] = {
        return [self.VCInstance(name: "countDeposite1"),
                self.VCInstance(name: "countDeposite2"),
                self.VCInstance(name: "countDeposite3")]
    }()
    
    private func VCInstance (name: String) -> UIViewController{
        return UIStoryboard (name: "Main", bundle: nil).instantiateViewController(withIdentifier:name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        
        if let countDeposite1 = VCArr.first {
            setViewControllers([countDeposite1], direction: .forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArr.index(of: viewController) else{
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return VCArr.last
        }
        guard VCArr.count > previousIndex else {
            return nil
        }
        return VCArr[previousIndex]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = VCArr.index(of: viewController) else{
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < VCArr.count else {
            return VCArr.first
        }
        guard VCArr.count > nextIndex else {
            return nil
        }
        return VCArr[nextIndex]
    }
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return VCArr.count
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first, let firstViewControllerIndex = VCArr.index(of: firstViewController) else {
            return 0
        }
        return firstViewControllerIndex
    }

}
