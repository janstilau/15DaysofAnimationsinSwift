//
//  ViewController.swift
//  tableHeader_6
//
//  Created by jansti on 16/10/28.
//  Copyright © 2016年 jansti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    // MARK: - Properties
    
    let tableHeaderHeight:CGFloat = 300.0
    var headerView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var places = [
        Place(place: "Neuschwanstein Castle"),
        Place(place: "Yosemite National Park"),
        Place(place: "Times Square"),
        Place(place: "Tokyo"),
        Place(place: "Hawaii"),
        Place(place: "Eiffel Tower"),
        Place(place: "Rio de Janeiro"),
        Place(place: "Turkey"),
        Place(place: "Golden Gate   ßPlace(place: Caribbean Islands")]{
        
        didSet(newValue){
            print(places)
        }
        // 这里,didSet在places在重新赋值之后,打印整个places的值,而这个赋值,是在appendElement就会发生.也就符合Struct的定义,修改了Struct的里面的一个值,其实是赋值,修改,重新赋值给属性,这样的一个过程.
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.rowHeight = 100
        
        tableView.addSubview(headerView)
        
        tableView.contentInset = UIEdgeInsets.init(top: tableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0,y: -tableHeaderHeight)
        updateHeaderView()
    }
    
    
    // MARK: - TableViewDatasource,delegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        let place = places[indexPath.row]
        cell.textLabel?.text = place.placeTitle
        
        return cell
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
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
    }// 如果把headerView简简单单的设置成为tableView的tableviewHeaderView的话,那么这个headerView其实会跟着tableview滚动的.这里,在tableview的头部是自己添加的tableview的一个子view,然后检测tablview的位置,将这个子view的frame,设置成为,原点在屏幕的左上角,长宽是屏幕宽度和tableview顶部空白区域的高度,至于图片的放大,则是靠view的contentMode为aspectFill实现的.
    // 这里比较奇怪的事情是,如果设置了tableivew的contentInset{100,0,0,0},那么添加一个frame为0,0,100,100的子view的话,其实是添加到了0,100,0,0的位置,也就是移动了contentInsettop那么多的y值,但是,tablview的frame还是0,0,375,667.也就是说,设置完tableviewContentInset,字view的添加被影响了,但是,tablview的frame没有变化.

    @IBAction func headerBtnAction(sender: UIButton) {
        
        let newRedView = UIView.init(frame: CGRectMake(0, 0, 100, 100))
        newRedView.backgroundColor = UIColor.redColor()
        tableView.addSubview(newRedView)
        
    }
    
    
    // MARK: - Status bar
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

