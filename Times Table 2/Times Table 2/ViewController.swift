//
//  ViewController.swift
//  Times Table 2
//
//  Created by Thiago Garcia on 01/11/17.
//  Copyright © 2017 iGarcia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var countSlider: UISlider!
    
    @IBOutlet var countTable: UITableView!
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 15
        
    }
    
    

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let countCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "CellCount")
        
        countCell.textLabel?.text = String(Int(countSlider.value)) + " x " + String(indexPath.row + 1) + " = " + String((Int(countSlider.value)) * (indexPath.row + 1))
        
        return countCell
        
    }
    
    
    
    @IBAction func countSliderChanged(_ sender: UISlider) {
    
        countTable.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

