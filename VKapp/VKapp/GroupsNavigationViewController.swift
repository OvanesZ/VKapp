//
//  GroupsNavigationViewController.swift
//  VKapp
//
//  Created by Ovanes on 18.02.2021.
//

import UIKit

class GroupsNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func searchGroupsButton(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "searchGroups", sender: self)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
