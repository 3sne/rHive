//
//  ViewController.swift
//  UploadItem
//
//  Created by Vinzy on 13/11/18.
//  Copyright © 2018 vinzy. All rights reserved.
//

import UIKit

class NewItemVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var listItem: UISwitch!
    @IBOutlet weak var rent: UITextField!
    @IBOutlet weak var productName: UITextField!
    var pickerData: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        pickerData = ["Electronics", "Car", "Motorbike", "Bicycle", "Furniture"]
        pickerData.sort()
        pickerData.append("Others")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func goToListing(_ sender: Any) {
        //check for switch on/off and fields
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}

