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
        return displayedFriend?.photosArray.count ?? 0

    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendViewCell", for: indexPath) as? FriendsViewCell,
              let photos = displayedFriend?.photosArray[indexPath.item] else { return UICollectionViewCell() }
    

        cell.icon.image = photos
        
      
        return cell
    }

}
