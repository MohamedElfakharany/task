//
//  ViewController.swift
//  task
//
//  Created by Mohamed Alfakharany on 06/01/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stakTableView: UITableView!
    var stakData = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getStakData()
        
    }
    
    func getStakData() {
        stackData.getStackData { (error, success, stakData) in
            if let stakData = stakData {
                self.stakData = stakData.items ?? []
                print(stakData)
            }
        }
    }


}

