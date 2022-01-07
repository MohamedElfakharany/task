//
//  filterViewController.swift
//  task
//
//  Created by Mohamed Alfakharany on 06/01/2022.
//

import UIKit

class filterViewController: UIViewController {

    @IBOutlet weak var tagTextFiled: UITextField!
    @IBOutlet weak var minTextFiled: UITextField!
    
    var delegate: getFilter?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func filterButton(_ sender: Any) {
        delegate?.getFilterData(min: minTextFiled.text ?? "5", tag: tagTextFiled.text ?? "swift")
        dismiss(animated: true, completion: nil)
    }
    
}

protocol getFilter {
    func getFilterData(min: String,tag: String)
}
