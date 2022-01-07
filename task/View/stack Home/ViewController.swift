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
        getStakData(tagged: "swift", min: "5")
        self.stakTableView.register(UINib.init(nibName: "stakCell", bundle: nil), forCellReuseIdentifier: "cell")
        stakTableView.dataSource = self
        stakTableView.delegate = self
        
    }
    override  func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if (segue.identifier == "filter") {
            let vc = segue.destination as! filterViewController
            vc.delegate = self
            
        }
    }
    func getStakData(tagged: String,min: String) {
        stackData.getStackData(tagged: tagged, min: min) { (error, success, stakData) in
            if let stakData = stakData {
                self.stakData = stakData.items ?? []
                self.stakTableView.reloadData()
                print(stakData)
            }
        }
    }
    
    
    @IBAction func filterButten(_ sender: Any) {
       performSegue(withIdentifier: "filter", sender: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stakData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = stakTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? stakCell {
            cell.setItemLable(tile: stakData[indexPath.row])
            return cell
        }else {
            return stakCell()
        }
    }
}

extension ViewController: getFilter {
    func getFilterData(min: String, tag: String) {
        getStakData(tagged: tag, min: min)
    }
    
    
}
