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
    private let networkSession = NetworkService()
   // private var friend: [Friends]?
    private let realm = try? Realm()
    var friend: Results<Friends>?
    
    
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
                    try self.realm?.write({
                        self.realm?.add(newFriend, update: Realm.UpdatePolicy.all)
                        print(self.realm?.configuration.fileURL ?? "")
                    })
                } catch {
                    print(error)
                }
            }
    })
       
        
        
        
        guard let realm = realm else { return }
         

        
    //    let friendObjects = realm.objects(Friends.self)
        friend = realm.objects(Friends.self)

        
        notificationToken = friend?.observe { change in
            guard let tableView = self.tableView else { return }
            switch change {
        
        case .initial(_):
            tableView.reloadData()
//                self.friend = friendObjects.filter({ _ in true })   // пробрасываем все данные, которые пришли
//                self.tableView.reloadData()
        
        case .update(_, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                tableView.beginUpdates()
                
                tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
                
                tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
            
                tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
           
//            self.friend = friendObjects.filter({ _ in true })
                tableView.endUpdates()
            
        case let .error(error):
                print(error)
            }
        }
//        self.friend = friendObjects.filter({ _ in true })
        tableView.reloadData()
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






//
//guard let realm = realm else { return }
//
//
//
////       let friendObjects = realm.objects(Friends.self)
//friend = realm.objects(Friends.self)
//
//
//notificationToken = friend?.observe { [weak self] change in
//    guard let tableView = self?.tableView else { return }
//    switch change {
//
//case .initial(_):
//    tableView.reloadData()
////                self.friend = friendObjects.filter({ _ in true })   // пробрасываем все данные, которые пришли
////                self.tableView.reloadData()
//
//case .update(_, deletions: let deletions, insertions: let insertions, modifications: let modifications):
//        tableView.beginUpdates()
//
//        tableView.insertRows(at: insertions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
//
//        tableView.deleteRows(at: deletions.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
//
//        tableView.reloadRows(at: modifications.map({ IndexPath(row: $0, section: 0)}), with: .automatic)
//
//  //  self.friend = friendObjects.filter({ _ in true })
//        tableView.endUpdates()
//
//case let .error(error):
//        print(error)
//    }
//}
////      self.friend = friendObjects.filter({ _ in true })
//tableView.reloadData()
//}
