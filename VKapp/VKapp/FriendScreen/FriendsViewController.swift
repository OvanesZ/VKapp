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
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendViewCell", for: indexPath) as! FriendsViewCell
    
        // Configure the cell
        
    
        return cell
    }

}
