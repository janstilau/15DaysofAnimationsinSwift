//
//  ViewController.swift
//  NAVBarAniSelf
//
//  Created by jansti on 16/10/25.
//  Copyright © 2016年 jansti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let images = ["one", "two", "three", "four", "five", "six"]
    
    // MARK: - Properties
    
    @IBOutlet weak var tableView: UITableView!
    var entries = [
        Entry(title: "First Entry", image: UIImage(named: "one")!),
        Entry(title: "Exploring", image: UIImage(named: "two")!),
        Entry(title: "Traveling Abroad", image: UIImage(named: "three")!),
        Entry(title: "Scuba Diving", image: UIImage(named: "four")!),
        Entry(title: "Trip Together", image: UIImage(named: "five")!),
        Entry(title: "The Unknown", image: UIImage(named: "six")!)
    ]
    
    // MARK: - Lift Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        navigationController?.hidesBarsOnTap = true
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! EntryCell
        let entry = entries[indexPath.row]
        cell.entryTitleLbel.text = entry.title
        cell.entryImageView.image = entry.image
        return cell
    }


}

