//
//  SusesViewController.swift
//  ForaBuild
//
//  Created by Роман Давыдов on 28.08.2018.
//  Copyright © 2018 Админ. All rights reserved.
//

import UIKit

class SusesViewController: UIViewController {

    @IBOutlet weak var rotateOval: UIImageView!
    @IBOutlet weak var rotateHren: UIImageView!
    @IBOutlet weak var rotateOk: UIImageView!
    
    var dagree = CGFloat(M_PI / 30)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rotateImg(targetView: rotateOval)
        bigImg(targetView: rotateHren)
        bigImg(targetView: rotateOk)

    }

    func rotateImg (targetView: UIView, duration: Double = 1.0) {

        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: self.dagree)
        }){
            finished in
            self.rotateImg(targetView: targetView, duration: duration)
        }
    }
    
    func bigImg(targetView: UIView)  {
        UIView.animate(withDuration: 1.5, animations: {
            targetView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2);
        }, completion: {
            finished -> Void in
            targetView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
