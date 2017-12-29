//
//  SearchViewController.swift
//  TextbookExchange
//
//  Created by Jai Thirani on 12/4/17.
//  Copyright © 2017 Jai Thirani. All rights reserved.
//

import UIKit
import FirebaseAuth

class SearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //static var course: String = ""
    var searchOption : String?

    let searchOptions = ["Title", "Class"]
    
    @IBOutlet weak var searchLabel: UILabel!
    
    @IBOutlet weak var searchOptionsPicker: UIPickerView!
    
    @IBOutlet weak var search: UITextField!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return searchOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return searchOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        searchOption = searchOptions[row]
        searchLabel.text = "Enter " + searchOption!.lowercased()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(_ sender: UIButton) {
        do {
            try Auth.auth().signOut()
        } catch {
            
        }
    }
    
    /*
    @IBAction func searchClicked(_ sender: UIButton) {
        SearchViewController.course = search.text!
        self.performSegue(withIdentifier: "search", sender: self)
    }
 */
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let d = segue.destination as? SearchTableViewController {
            d.course = search.text!
        }
    }
    

}
