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
    private var newsfeed: [Newsfeed?] = []
    
    
  
    
    
    
    
  
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
                networkSession.loadNewsfeed(token: userToken, completionHandler: { result in
                    switch result {
                    case let .failure(error):
                        print(error)
                    case let .success(newsfeed):
                        self.newsfeed = newsfeed
                        self.tableView.reloadData()
                        }
                    })
    
//        for _ in 0...newsfeed.count {
//            if Newsfeed.shared.text == "" {
//                self.tableView.estimatedRowHeight = 0
//        } else {
//            self.tableView.estimatedRowHeight = 44.0
//        }
//                }
       
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
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//        }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
