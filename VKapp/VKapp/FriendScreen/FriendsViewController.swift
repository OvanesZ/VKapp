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
    var photoFriend: [Photo] = []
    
    private let networkSession = NetworkService()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userToken = Session.shared.token
        
        let ownerID = displayedFriend!.friendID
  
        
        networkSession.loadPhoto(token: userToken, owner: ownerID, completion: { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(photo):
                let photoFriendNew: [Photo] = photo
                self.photoFriend = photoFriendNew
                
                
                self.collectionView.reloadData()
            }
        })
        title = "\(displayedFriend!.firstName) \(displayedFriend!.lastName)"
    }



    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
       // return displayedFriend?.photosArray.count ?? 0
        return photoFriend.count

    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendViewCell", for: indexPath) as? FriendsViewCell else { return UICollectionViewCell() }
        
        
        
       cell.configure(with: photoFriend[indexPath.item])
        
           
    

     
        
      
        return cell
    }

}
