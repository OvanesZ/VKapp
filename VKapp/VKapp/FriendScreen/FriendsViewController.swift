//
//  FriendsViewController.swift
//  VKapp
//
//  Created by Ovanes on 25.02.2021.
//

import UIKit
import Alamofire
import Realm
import RealmSwift



class FriendsViewController: UICollectionViewController {
    
    var notificationToken: NotificationToken?
    var displayedFriend: Friends?
    private var photoFriend: [Photo] = []
    
    private let networkSession = NetworkService()
    private let realm = try? Realm()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "\(displayedFriend!.firstName) \(displayedFriend!.lastName)"
    }


    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userToken = Session.shared.token
        let ownerID = displayedFriend!.friendID
  
        
        networkSession.loadPhoto(token: userToken, owner: ownerID, completion: { result in
            switch result {
            case let .failure(error):
                print(error)
            case let .success(photo):
                
            do {
                let photoFriendNew = photo
                
                self.collectionView.reloadData()
                try self.realm?.write({
                    self.realm?.add(photoFriendNew, update: Realm.UpdatePolicy.all)
                print(self.realm?.configuration.fileURL ?? "")
                })
            } catch {
                print(error)
            }
        }
    })
        
        guard let realm = realm else { return }
        
        let photoObject = realm.objects(Photo.self)
        
        notificationToken = photoObject.observe { (changes: RealmCollectionChange) in
            switch changes {
            
            case .initial:
                self.photoFriend = photoObject.filter({ _ in true })   // пробрасываем все данные, которые пришли
                self.collectionView.reloadData()
            
          
            case .update(_, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                
                self.collectionView.performBatchUpdates({self.collectionView.insertItems(at: insertions.map({IndexPath(row: $0, section: 0) }))
                    
                self.collectionView.deleteItems(at: deletions.map({ IndexPath(row: $0, section: 0)}))
                    
                self.collectionView.reloadItems(at: modifications.map({IndexPath(row: $0, section: 0)}))
                }, completion: nil)
                
            case .error(let error):
                fatalError("\(error)")
            }
        }
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
