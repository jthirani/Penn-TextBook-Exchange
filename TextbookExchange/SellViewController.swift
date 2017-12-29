//
//  SellViewController.swift
//  TextbookExchange
//
//  Created by Jai Thirani on 12/5/17.
//  Copyright © 2017 Jai Thirani. All rights reserved.
//
import UIKit

class SellViewController: UIViewController, UIImagePickerControllerDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var courseTextField: UITextField!
    @IBOutlet weak var ISBNTextField: UITextField!
    @IBOutlet weak var conditionTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sellBbook(_ sender: UIButton) {
        let bookToSell: Book = Book(bookID: ISBNTextField.text! + NSDate().description, course: courseTextField.text!.lowercased(), title: titleTextField.text!.lowercased(), price: priceTextField.text!, ISBN: ISBNTextField.text!, condition: conditionTextField.text!, userID: ViewController.email/*, imageURL: ""*/)
        UserDataManager.postBook(book: bookToSell/*, image: CameraViewController.imageUploaded!*/)
        UserDataManager.postBookByCourse(book: bookToSell)
        titleTextField.text = ""
        courseTextField.text = ""
        ISBNTextField.text = ""
        conditionTextField.text = ""
        priceTextField.text = ""
        
        let alert = UIAlertController(title: "Now on sale!", message: "Hopefully you find a buyer quickly!", preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)

        
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
