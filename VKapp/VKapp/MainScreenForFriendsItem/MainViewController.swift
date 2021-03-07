//
//  MainViewController.swift
//  VKapp
//
//  Created by Ovanes on 23.02.2021.
//

import UIKit

class MainViewController: UIViewController{
    
//    fileprivate let friends = [
//        Friends(name: "Захарян Виктория"),
//        Friends(name: "Шагаев Андрей"),
//        Friends(name: "Ахмадеев Александр"),
//        Friends(name: "Землякова Мария"),
//        Friends(name: "Земляков Денис"),
//        Friends(name: "Кусов Дмитрий"),
//        Friends(name: "Кусова Елена"),
//        Friends(name: "Зорин Андрей"),
//        Friends(name: "Калиненко Константин"),
//        Friends(name: "Якименко Сергей")
//    ]
    
    fileprivate let friends = [
        Friends(name: "Захарян Виктория", friendImage: UIImage(named: "image_560708111244079913687")),
        Friends(name: "Шагаев Андрей", friendImage: UIImage(named: "image_560708111244079913687")),
        Friends(name: "Ахмадеев Александр", friendImage: UIImage(named: "image_560708111244079913687")),
        Friends(name: "Землякова Мария", friendImage: UIImage(named: "image_560708111244079913687")),
        Friends(name: "Земляков Денис", friendImage: UIImage(named: "image_560708111244079913687")),
        Friends(name: "Кусов Дмитрий", friendImage: UIImage(named: "image_560708111244079913687")),
        Friends(name: "Кусова Елена", friendImage: UIImage(named: "image_560708111244079913687")),
        Friends(name: "Зорин Андрей", friendImage: UIImage(named: "image_560708111244079913687")),
        Friends(name: "Калиненко Константин", friendImage: UIImage(named: "image_560708111244079913687")),
        Friends(name: "Якименко Сергей", friendImage: UIImage(named: "image_560708111244079913687"))
    ]
    
    
    
    
    
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFriendsSegue",
           let senderCell = sender as? FriendCell,
           let cellIndexPath = tableView.indexPath(for: senderCell),
           let friendViewController = segue.destination as? FriendsViewController {
            
            let selectedFriend = friends[cellIndexPath.row]
            friendViewController.displayedFriend = selectedFriend
            
            
        }
    }
}




extension MainViewController: UITableViewDataSource {
    // numberOfRowsInSection - Количество строк в секции
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    //  cellForRowAt indexPath - создание ячейки
    //  IndexPath - номер ячейки, состоит из двух элементов (секция и строка)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as? FriendCell else { return UITableViewCell() }
        
        
//        cell.friendLabel.text = friends[indexPath.row].name
//        cell.friendImage.image = friends[indexPath.item].friendImage
        cell.configure(with: friends[indexPath.item])
        
        return cell
        
    }
    
    
}
