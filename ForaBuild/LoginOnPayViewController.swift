//
//  LoginOnPayViewController.swift
//  ForaBuild
//
//  Created by Роман Давыдов on 30.07.2018.
//  Copyright © 2018 Админ. All rights reserved.
//

import UIKit

class LoginOnPayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var payNames = ["Моя Альфа", "Мобилка", "Ксюхин Сбер"]
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "payCell", for: indexPath)
        
        cell.textLabel?.text = payNames[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    }
    */

}
