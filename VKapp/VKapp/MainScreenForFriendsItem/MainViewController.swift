//
//  MainViewController.swift
//  VKapp
//
//  Created by Ovanes on 23.02.2021.
//

import UIKit
import Alamofire
import Realm
import RealmSwift

class MainViewController: UIViewController{
    

    var notificationToken: NotificationToken?
 //   private lazy var friend: Results<Friends>? = try? Realm(configuration: RealmService.deleteIfMigration).objects(Friends.self)
    
    private let networkSession = NetworkService()
    private var friend: [Friends]?
    private let realm = try? Realm()

    
    
    @IBOutlet var tableView: UITableView!

    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userToken = Session.shared.token
       
        networkSession.loadFriendsID(token: userToken, completion: { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(friends):
                
                do {
                    
                    let newFriend = friends
                    
                    self.tableView.reloadData()
                    try self.realm?.write({
                        self.realm?.add(newFriend)
                    })
                } catch {
                    print(error)
                }
            }
        
//      networkSession.loadFriendsID(token: userToken, completion: { result in
//            switch result {
//            case let .failure(error):
//                print(error)
//            case let .success(friend):
//                try? RealmService.save(items: friend, update: .modified)
//
//
//                self.tableView.reloadData()
//            }
//        })
    })
       
        
        
        
        guard let realm = realm else { return }
         

        
        let friendObjects = realm.objects(Friends.self)
        
        try? realm.write({
            self.realm?.deleteAll()
        })
        
        notificationToken = friendObjects.observe { change in
        
            switch change {
        
        case .initial(_):
                self.friend = friendObjects.filter({ _ in true })   // пробрасываем все данные, которые пришли
                self.tableView.reloadData()
        
        case .update(_, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                self.tableView.beginUpdates()
                
                self.tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                
                self.tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
            
                self.tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
           
            self.friend = friendObjects.filter({ _ in true })
            self.tableView.endUpdates()
            
        case let .error(error):
                print(error)
            }
        }
        self.friend = friendObjects.filter({ _ in true })
       
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


