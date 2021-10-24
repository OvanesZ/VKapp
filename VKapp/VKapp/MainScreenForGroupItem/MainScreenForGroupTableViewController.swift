//
//  MainScreenForGroupTableViewController.swift
//  VKapp
//
//  Created by Ovanes on 26.02.2021.
//

import UIKit
//import Alamofire
import RealmSwift

class MainScreenForGroupTableViewController: UITableViewController {
    

    
    var myGroups: [MyGroups] = []
  
    private lazy var group: Results<MyGroups>? = try? Realm(configuration: RealmService.deleteIfMigration).objects(MyGroups.self)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func searchGroupsButton(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "searchGroups", sender: self)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userToken = Session.shared.token
        
       loadGroup(token: userToken, completion: { result in
                        switch result {
                        case let .failure(error):
                            print(error)
                        case let .success(group):
                            try? RealmService.save(items: group, configuration: RealmService.deleteIfMigration)
                          
                            let newMyGroups: [MyGroups] = group
                            self.myGroups = newMyGroups
                              self.tableView.reloadData()
                        }
                    })
        
    }

    // MARK: - Table view data source
    
    
//    @IBAction func addGroup(segue: UIStoryboardSegue) {
//
//        if let groupViewController = segue.source as? ScreenAreNotMyGroupsViewController,
//           let selectedIndexPath = groupViewController.tableView.indexPathForSelectedRow {
//            let selectedGroup = groupViewController.groups[selectedIndexPath.row]
//
//            if !myGroups.contains(selectedGroup) {
//                myGroups.append(selectedGroup)
//                tableView.reloadData()
//            }
//        }
//    }
//
//
//
//
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return group?.count ?? 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellGroups", for: indexPath) as? GroupCell,
        let groups = group?[indexPath.item] else { return UITableViewCell() }
       

        cell.configure(with: groups)
        // Configure the cell...
//        cell.groupsLabel.text = group?[indexPath.row].name
//        cell.configure(with: myGroups[indexPath.item])

    
        
        return cell
    }
    }
    
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            //tableView.deleteRows(at: [indexPath], with: .fade)
//            myGroups.remove(at: indexPath.row)
//            //tableView.reloadData()
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//        }
//
   
    


