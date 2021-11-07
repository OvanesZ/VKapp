//
//  MainViewController.swift
//  VKapp
//
//  Created by Ovanes on 23.02.2021.
//

import UIKit
import Alamofire
import RealmSwift

class MainViewController: UIViewController{
    

    
    
    var friends: [Friends] = []
    
    private lazy var friend: Results<Friends>? = try? Realm(configuration: RealmService.deleteIfMigration).objects(Friends.self)
    
    private let networkSession = NetworkService()
    
    
    
    @IBOutlet var tableView: UITableView!

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userToken = Session.shared.token
       
        
        networkSession.loadFriendsID(token: userToken, completion: { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(friend):
                try? RealmService.save(items: friend, update: .modified)
                
             
                
                self.tableView.reloadData()
            }
        })
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

        tableView.dataSource = self
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFriendsSegue",
           let senderCell = sender as? FriendCell,
           let cellIndexPath = tableView.indexPath(for: senderCell),
           let friendViewController = segue.destination as? FriendsViewController {
            
            let selectedFriend = friend?[cellIndexPath.row]
            friendViewController.displayedFriend = selectedFriend
            
            
        }
    }
}












extension MainViewController: UITableViewDataSource {
    // numberOfRowsInSection - Количество строк в секции
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friend?.count ?? 0
    }
    
    //  cellForRowAt indexPath - создание ячейки
    //  IndexPath - номер ячейки, состоит из двух элементов (секция и строка)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? FriendCell,
              let friends = friend?[indexPath.item] else { return UITableViewCell() }
        
        cell.configure(with: friends)
        
        
        
        
        
        
//        cell.friendLabel.text = friends[indexPath.row].name
//        cell.friendImage.image = friends[indexPath.item].friendImage
//        cell.configure(with: friends[indexPath.item])
//        cell.selectionStyle = .none
        
        return cell
        
    }
    
    
}


