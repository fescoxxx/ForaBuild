//
//  LoginOnTapeViewController.swift
//  ForaBuild
//
//  Created by Роман Давыдов on 26.07.2018.
//  Copyright © 2018 Админ. All rights reserved.
//

import UIKit

class LoginOnTapeViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    lazy var  VCArr: [UIViewController] = {
        return [self.VCInstance(name: "LoginOnTape1"),
                self.VCInstance(name: "LoginOnTape2"),
                self.VCInstance(name: "LoginOnOffers"),
                self.VCInstance(name: "LoginOnInfo"),
                self.VCInstance(name: "LoginOnSettings")]
    }()
    
    private func VCInstance (name: String) -> UIViewController{
        return UIStoryboard (name: "Main", bundle: nil).instantiateViewController(withIdentifier:name)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
        
        if let LoginOnTape1 = VCArr.first {
            setViewControllers([LoginOnTape1], direction: .forward, animated: false, completion: nil)
        }
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

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
     LoginOnTape1
    }
    */

}
