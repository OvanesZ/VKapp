//
//  NewsTableViewController.swift
//  VKapp
//
//  Created by Ованес Захарян on 10.02.2022.
//

import UIKit

class NewsTableViewController: UITableViewController {

    
    fileprivate let newsArray: [News?] = [News(name: "New Yourk Times", photoUserOrGroup: UIImage(named: "ivi"), textNews: "Some text", likeValue: "like 0", imageNews: UIImage(named: "ivi")),
                                         News (name: "Auto", photoUserOrGroup: UIImage(named: "netflix"), textNews: "TEST", likeValue: "like 5", imageNews: UIImage(named: "netflix")),
                                          News(name: "National Geographic", photoUserOrGroup: UIImage(named: "1"), textNews: "Animal", likeValue: "like 3", imageNews: UIImage(named: "5"))
    ]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return newsArray.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.item {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HedderCell", for: indexPath) as! HedderNewsTableViewCell
            guard let hedder = newsArray[indexPath.section] else { return UITableViewCell() }
            cell.configure(with: hedder)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! ImageNewsTableViewCell
            guard let image = newsArray[indexPath.section] else { return UITableViewCell() }
            cell.configure(with: image)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextNewsTableViewCell
            guard let text = newsArray[indexPath.section] else { return UITableViewCell() }
            cell.configure(with: text)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LikeCell", for: indexPath) as! LikeNewsTableViewCell
            guard let like = newsArray[indexPath.section] else { return UITableViewCell() }
            cell.configure(with: like)
            return cell
        default:
            return UITableViewCell()
        }
        
    
    }
    

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
