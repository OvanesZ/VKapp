//
//  MainScreenForGroupTableViewController.swift
//  VKapp
//
//  Created by Ovanes on 26.02.2021.
//

import UIKit
import Alamofire
import Realm
import RealmSwift

class MainScreenForGroupTableViewController: UITableViewController {
    

    var notificationToken: NotificationToken?
    private var myGroups: [MyGroups]?
    private var group: [MyGroups]?
    private let networkSession = NetworkService()
    private let realm = try? Realm()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func searchGroupsButton(_ sender: UIBarButtonItem) {
        
        performSegue(withIdentifier: "searchGroups", sender: self)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userToken = Session.shared.token
        

        networkSession.loadGroup(token: userToken, completion: { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(groups):
                
                do {
                    let newGroup = groups
                    self.tableView.reloadData()
                    try self.realm?.write({
                        self.realm?.add(newGroup, update: Realm.UpdatePolicy.all)
                        print(self.realm?.configuration.fileURL ?? "")
                    })
                } catch {
                    print(error)
                }
        }
    })
        
        guard let realm = realm else { return }
         

        
        let groupObjects = realm.objects(MyGroups.self)
        
//        try? realm.write({
//            self.realm?.deleteAll()
//        })
        
        notificationToken = groupObjects.observe { change in
        
            switch change {
        
        case .initial(_):
                self.group = groupObjects.filter({ _ in true })   // пробрасываем все данные, которые пришли
                self.tableView.reloadData()
        
        case .update(_, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                self.tableView.beginUpdates()
                
                self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                
                self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
            
                self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
           
            self.group = groupObjects.filter({ _ in true })
            self.tableView.endUpdates()
            
        case let .error(error):
                print(error)
            }
        }
        self.group = groupObjects.filter({ _ in true })
       
        
}

    
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
   
    


