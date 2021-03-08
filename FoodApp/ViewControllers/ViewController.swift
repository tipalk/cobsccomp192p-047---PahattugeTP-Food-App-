//
//  ViewController.swift
//  FoodApp
//
//  Created by Tiny Pahattuge on 2021-03-03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    var name = ["Chili Burger", "veggle Burgers", "Bison Burgers", "Wild Salomon Burger", "Black Bean Burgers"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //TableView.delegate = self
        //TableView.dataSource = self
        
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellTableView
        
        cell?.lbl.text = name[indexPath.row]
        cell?.img.image = UIImage(named: name[indexPath.row])
        
        return cell!
    }
    
    //func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    let vc = storyboard?.instantiateViewController(identifier: "DetailViewController")as? DetailViewController
   //     vc?.image = UIImage(named: name[indexPath.row])!
   //     vc?.name = name[indexPath.row]
   //     self.navigationController?.pushViewController(vc!, animated: true)
  //  }
    
}


    




