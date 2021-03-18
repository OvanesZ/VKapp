//
//  FriendsViewController.swift
//  VKapp
//
//  Created by Ovanes on 25.02.2021.
//

import UIKit

//private let reuseIdentifier = "Cell"

class FriendsViewController: UICollectionViewController {
    
    
    var displayedFriend: Friends?
   
    
    fileprivate let friends = [
        Friends(name: "Захарян Виктория", friendImage: UIImage(named: "Vika")),
        Friends(name: "Шагаев Андрей", friendImage: UIImage(named: "3")),
        Friends(name: "Ахмадеев Александр", friendImage: UIImage(named: "1")),
        Friends(name: "Землякова Мария", friendImage: UIImage(named: "Машка")),
        Friends(name: "Земляков Денис", friendImage: UIImage(named: "2")),
        Friends(name: "Кусов Дмитрий", friendImage: UIImage(named: "3")),
        Friends(name: "Кусова Елена", friendImage: UIImage(named: "4")),
        Friends(name: "Зорин Андрей", friendImage: UIImage(named: "5")),
        Friends(name: "Калиненко Константин", friendImage: UIImage(named: "6")),
        Friends(name: "Якименко Сергей", friendImage: UIImage(named: "image_560708111244079913687"))
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()


        title = displayedFriend?.name
        
    }



    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return friends.count

    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendViewCell", for: indexPath) as? FriendsViewCell else { return UICollectionViewCell() }
    
        // Configure the cell
        cell.icon.image = friends[indexPath.item].friendImage
//            cell.configure(with: friends[indexPath.item])
      
        return cell
    }

}
