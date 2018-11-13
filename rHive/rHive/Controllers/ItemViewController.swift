//
//  ViewController.swift
//  rHive
//
//  Created by Mahima Borah on 01/11/18.
//  Copyright © 2018 M2V. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var itemCat: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    @IBOutlet weak var itemDesc: UITextView!
    @IBOutlet weak var itemImg: UIImageView!
    var images=["Bicycle":"bicycle.jpg", "iPad":"ipad.jpg", "Play Station 4":"ps4.jpg", "Blue Formal Shirt":"shirt.jpeg", "Dining Table":"table.jpeg"]
    
    var name: String = ""
    var category: String = ""
    var desc: String = ""
    
    var selectedItem: Item?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedItem = selectedItem {
            itemCat.text = selectedItem.category
            itemPrice.text = selectedItem.price
            itemDesc.text = selectedItem.description
            
            let image = UIImage(named: images[selectedItem.name]!)
            itemImg.image = image
            
            self.navigationItem.title = selectedItem.name
        }
    }
    
    
    
}



























//    func loadData(){
//        if let x = selectedItem{
//            itemNameLabel.text = x.name
//            itemCategoryLabel.text = x.category
//        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    @IBAction func contactBuyer(_ sender: Any) {
//
//    }
//
