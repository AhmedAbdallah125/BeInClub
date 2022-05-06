//
//  LeaguesViewController.swift
//  BeInClub
//
//  Created by Mohamed Hosam on 01/05/2022.
//

import UIKit
import SDWebImage

class LeaguesViewController: UITableViewController {

    var items = [League]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkService.getAllLeagues { [weak self] (result) in
            
            self?.items = result!
                        
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LeaguesTableViewCell
        
        cell.leagueName.text = items[indexPath.row].strLeague
        
        
        cell.leagueImage.sd_setImage(with: URL(string: items[indexPath.row].strBadge!), placeholderImage: UIImage(named: "placeholder.png"))
        
        // youtube icon
        if(!items[indexPath.row].strYoutube!.isEmpty) {
            cell.leagueYoutube.image = UIImage.init(named: "youtube")
            
            // click to youtube icon
            let tapGestureRecognizer = CustomTapGestureRecognizer(target: self, action: #selector(imageTapped(gestureRecognizer:)))
            tapGestureRecognizer.youtubeLink = items[indexPath.row].strYoutube
            
            cell.leagueYoutube.isUserInteractionEnabled = true
            cell.leagueYoutube.addGestureRecognizer(tapGestureRecognizer)
            
        } else {
            cell.leagueYoutube.image = UIImage.init(named: "youtube_trans")
        }
        
        
        return cell
    }
    
    @objc func imageTapped(gestureRecognizer: CustomTapGestureRecognizer)
    {
        guard let url = URL(string: "https://\(gestureRecognizer.youtubeLink!)") else { return }
        
        UIApplication.shared.open(url, completionHandler: { success in
                if success {
                    print("opened")
                } else {
                    print("failed")
                }
            })

    }
    
    class CustomTapGestureRecognizer: UITapGestureRecognizer {
        var youtubeLink: String?
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // goto league details
        
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
