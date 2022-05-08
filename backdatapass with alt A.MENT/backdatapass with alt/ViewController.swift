//
//  ViewController.swift
//  backdatapass with alt
//
//  Created by Mac on 16/04/22.
//

import UIKit

class ViewController: UIViewController,SecondVCDataPassing {
    
    @IBOutlet weak var bitcodeStudentList:UITableView!
    
    var nameArray: [String] = []
    var addressArray: [String] = []
    var perArray: [String] = []
    var cityArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "FirstVC"
        
        bitcodeStudentList.dataSource = self
        bitcodeStudentList.delegate = self
        
    }
    @IBAction func rightbarButtonAction(){
        
        if let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")as?SecondViewController{
            secondVC.delegateSVC = self
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    
    //MARK DataPassing From VC2 to VC1
    func datapass(name: String?, address: String?, per: String?, city: String?) {
        nameArray.append(name ?? "Anjali")
        addressArray.append(address ?? "Shirur")
        perArray.append(per ?? "70")
        cityArray.append(city ?? "Pune")
        bitcodeStudentList.reloadData()
        }
}

extension ViewController: UITableViewDataSource{
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if nameArray.count > 0 {
        self.bitcodeStudentList.backgroundView = nil
        return nameArray.count
    }
    let rect = CGRect(x: 0, y: 0, width:self.bitcodeStudentList.bounds.size.width , height: self.bitcodeStudentList.bounds.size.height)
    let noDataLabel:UILabel = UILabel(frame:rect)
    noDataLabel.text = "No Data Available"
    noDataLabel.textColor = UIColor.black
    noDataLabel.textAlignment = NSTextAlignment.center
    self.bitcodeStudentList.backgroundView = noDataLabel
    self.bitcodeStudentList.separatorStyle = .none
    
    return nameArray.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = self.bitcodeStudentList.dequeueReusableCell(withIdentifier:"customTableViewCell" )as?customTableViewCell else{
        return UITableViewCell()
    }
    cell.name.text = nameArray[indexPath.row]
    cell.address.text = addressArray[indexPath.row]
    cell.per.text = perArray[indexPath.row]
    cell.city.text = cityArray[indexPath.row]
    return cell
}
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return.delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            bitcodeStudentList.beginUpdates()
            nameArray.remove(at: indexPath.row)
            bitcodeStudentList.deleteRows(at: [indexPath], with: .fade)
            bitcodeStudentList.endUpdates()
       }
    }
}
    extension ViewController:UITableViewDelegate{
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
              150
        }
}
