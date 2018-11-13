//
//  FeedTableViewController.swift
//  rHive
//
//  Created by Mahima Borah on 01/11/18.
//  Copyright © 2018 M2V. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var thisUser: User = User(u: "adam", fn: "Adam", ln: "Grant", ps: "asdf", em: "adambest@gmail.com", pn: "8888888888", ad: "Manipal")!
    
    var items = [ Item(name:"Bicycle", category:"Vehicles"),
                  Item(name:"iPad", category:"Electronics"),
                  Item(name:"Play Station 4", category:"Electronics"),
                  Item(name:"Blue Formal Shirt", category:"Clothes"),
                  Item(name:"Dining Table", category:"Furniture"),]
    var images=["Bicycle":"bicycle.jpg", "iPad":"ipad.jpg", "Play Station 4":"ps4.jpg", "Blue Formal Shirt":"shirt.jpeg", "Dining Table":"table.jpeg"]
    
    let searchController = UISearchController(searchResultsController: nil)
    
    var filteredItems = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 205
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "What are you looking for?"
        tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }

    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredItems = items.filter({( item : Item) -> Bool in
            return item.name.lowercased().contains(searchText.lowercased())
        })
        
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if isFiltering() {
            return filteredItems.count
        }
        
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedTableViewCell
        
        //below code used for putting data into the table view
        var itemName = ""
        if isFiltering() {
            itemName = filteredItems[indexPath.row].name
        } else {
            itemName = items[indexPath.row].name
        }
        let image = UIImage(named: images[itemName]!)
        cell.itemImageView.image = image
        cell.descriptionLabel.text = itemName
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ItemViewController,
            let indexPath = tableView.indexPathForSelectedRow {
            destination.selectedItem = items[indexPath.row]
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
