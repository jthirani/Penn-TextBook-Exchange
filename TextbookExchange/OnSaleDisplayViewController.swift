//
//  OnSaleDisplayViewController.swift
//  TextbookExchange
//
//  Created by Jai Thirani on 12/8/17.
//  Copyright © 2017 Jai Thirani. All rights reserved.
//

import UIKit

class OnSaleDisplayViewController: UIViewController {

    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var courseText: UITextField!
    
    @IBOutlet weak var ISBNText: UITextField!
    
    @IBOutlet weak var conditionText: UITextField!
    
    @IBOutlet weak var priceText: UITextField!
    
    @IBAction func remove(_ sender: UIButton) {
        UserDataManager.removeBook(user: ViewController.userID, bookID: OnSaleTableViewController.bookID, course: OnSaleTableViewController.course)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleText.text = OnSaleTableViewController.title
        courseText.text = OnSaleTableViewController.course
        ISBNText.text = OnSaleTableViewController.isnb
        conditionText.text = OnSaleTableViewController.condition
        priceText.text = "$" + OnSaleTableViewController.price + ".00"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
