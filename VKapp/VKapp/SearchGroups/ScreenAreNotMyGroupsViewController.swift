//
//  ScreenAreNotMyGroupsViewController.swift
//  VKapp
//
//  Created by Ovanes on 27.02.2021.
//

import UIKit

class ScreenAreNotMyGroupsViewController: UITableViewController {
    
    
//    let groups = [
//        MyGroups(name: "Кино 2021", groupImage: UIImage(named: "ivi")),
//        MyGroups(name: "Музыка 90x", groupImage: UIImage(named: "nineteens")),
//        MyGroups(name: "Netflix", groupImage: UIImage(named: "netflix")),
//        MyGroups(name: "Футбол", groupImage: UIImage(named: "image_560708111244079913687"))
//    ]
    
    var groups: [MyGroups] = []
    
    private let networkSession = NetworkService()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
        //return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellGroups", for: indexPath) as? GroupCell else { return UITableViewCell() }

        // Configure the cell...
        cell.groupsLabel.text = groups[indexPath.row].name
      //  cell.groupImage.image = groups[indexPath.item].groupImage
        cell.configure(with: groups[indexPath.item])

        return cell
    }
}




private let userToken = Session.shared.token

extension ScreenAreNotMyGroupsViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
       
        
        networkSession.searchGroups(token: userToken, search: searchText, completion: { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(searchGroups):
                let search: [MyGroups] = searchGroups
                self.groups = search
                
                self.tableView.reloadData()
            }
        })
        
    }
}



