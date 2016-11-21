//
//  ViewController.swift
//  StretchyHeaderAnimation
//
//  Created by Larry Natalicio on 4/21/16.
//  Copyright © 2016 Larry Natalicio. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    // MARK: - Properties
    
    let tableHeaderHeight: CGFloat = 300.0
    var headerView: UIView!
    
    let places = [
        Place(place: "Neuschwanstein Castle"),
        Place(place: "Yosemite National Park"),
        Place(place: "Times Square"),
        Place(place: "Tokyo"),
        Place(place: "Hawaii"),
        Place(place: "Eiffel Tower"),
        Place(place: "Rio de Janeiro"),
        Place(place: "Turkey"),
        Place(place: "Golden Gate Bridge"),
        Place(place: "Caribbean Islands")
    ]
    
    // MARK: - View Life Cycle

      override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = tableView.tableHeaderView
        headerView.layer.borderColor = UIColor.redColor().CGColor
        headerView.layer.borderWidth = 2.0
        tableView.tableHeaderView = nil
        
//        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets(top: tableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -tableHeaderHeight)
        updateHeaderView()
     
    }

    // MARK: - UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let place = places[indexPath.row]
        cell.textLabel?.text = place.placeTitle
        
        return cell
    }
    
    // MARK: - UIScrollViewDelegate
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    // MARK: - Convenience
    
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -tableHeaderHeight, width: tableView.bounds.width, height: tableHeaderHeight)
        if tableView.contentOffset.y < -tableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        
        headerView.frame = headerRect
        
        // 这里需要理解,tableview的坐标系下面的坐标点怎么算.对于tableview来说,它的00点就是左上角的点,这个左上角,如果没有headerView,就是第一个cell的左上角,如果有headerView的话,那就是headerView的左上角.这个效果,headerView跟随者tableview滚动,没有办法实现.所以,手动的调整这个我们自定义的headerview的大小和位置.
    }
    
    // MARK: - Satus Bar
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}
