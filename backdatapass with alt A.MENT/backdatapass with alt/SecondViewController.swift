//
//  SecondViewController.swift
//  backdatapass with alt
//
//  Created by Mac on 17/04/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    //MARK : Textfield Outlets
    @IBOutlet weak var nameTF:UITextField!
    @IBOutlet weak var addressTF:UITextField!
    @IBOutlet weak var perTF:UITextField!
    @IBOutlet weak var cityTF:UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "secondVC"
        self.navigationItem.hidesBackButton = true
        
        
        }
    //MARK: Linking Protocol With VC2
    weak var delegateSVC:SecondVCDataPassing?
    
    @IBAction func saveButton() {
        guard let delegate = delegateSVC
        else{
            print ("no delegate object on storyboard")
            return
        }
        
        let data1 = nameTF.text
        let data2 = addressTF.text
        let data3 = perTF.text
        let data4 = cityTF.text
        
        delegateSVC?.datapass(name: data1, address: data2, per: data3, city: data4)
        self.navigationController?.popViewController(animated: true)
        
        
        //MARK : Alerts
        
        if(nameTF.text == "") && (addressTF.text == "") && (perTF.text == "") && (cityTF.text == ""){
            
        
            let Alert = UIAlertController(title: "Succeeded", message: " Data Save Successfully...", preferredStyle: .alert)
            Alert.addAction(UIAlertAction(title: "Ok", style:UIAlertAction.Style.cancel, handler: {action in }))
            self.present(Alert, animated: true, completion: nil)
            
        }else{
            let Alert = UIAlertController(title: "Cancelled", message: "Fill the data ", preferredStyle: .alert)
            Alert.addAction(UIAlertAction(title: "Ok", style:UIAlertAction.Style.cancel, handler: nil ))
            self.present(Alert, animated: true, completion: nil)
            
        }
    }
}






    
    
    



