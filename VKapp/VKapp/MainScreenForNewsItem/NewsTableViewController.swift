//
//  NewsTableViewController.swift
//  VKapp
//
//  Created by Ованес Захарян on 10.02.2022.
//

import UIKit
import Alamofire

class NewsTableViewController: UITableViewController {

    private let networkSession = NetworkService()
    let userToken = Session.shared.token
    private var newsfeed: [News?] = []
    
    
  
    
    
    
    
  
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
                networkSession.loadNews(token: userToken, completionHandler: { result in
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(newsfeed):
                        self.newsfeed = newsfeed
                        self.tableView.reloadData()
                        }
                    })
    
        
        self.tableView.estimatedRowHeight = 44.0
        
       
      
        
        
}
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return newsfeed.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.item {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HedderCell", for: indexPath) as! HedderNewsTableViewCell
            guard let hedder = newsfeed[indexPath.section] else { return UITableViewCell() }
            cell.configure(with: hedder)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageNewsTableViewCell
            guard let image = newsfeed[indexPath.section] else { return UITableViewCell() }
            cell.configure(with: image)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextNewsTableViewCell
            guard let text = newsfeed[indexPath.section] else { return UITableViewCell() }
            cell.configure(with: text)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LikeCell", for: indexPath) as! LikeNewsTableViewCell
            guard let like = newsfeed[indexPath.section] else { return UITableViewCell() }
            cell.configure(with: like)
            return cell
        default:
            return UITableViewCell()
        }
    }

}
