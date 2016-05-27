//
//  Controllers.swift
//  SwiftDemo
//
//  Created by MR_THT on 16/5/26.
//  Copyright © 2016年 MR_THT. All rights reserved.
//

import Foundation
import UIKit

class indexController: UIViewController ,UITableViewDataSource , UITableViewDelegate{
    
    
    
    let taleview:UITableView = UITableView.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height), style: UITableViewStyle.Plain)
    var datasource:NSMutableArray = []
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        self.taleview.delegate = self;
        self.taleview.dataSource = self;
       self.view.addSubview(self.taleview)
        self.taleview.registerNib(UINib(nibName:"IndexCell", bundle: nil), forCellReuseIdentifier: "indexcell")
        self.taleview.showsVerticalScrollIndicator = false
        self.taleview.separatorStyle = UITableViewCellSeparatorStyle.None
        self.taleview.backgroundColor = UIColor.clearColor()
        self.requestdata()
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 217
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    let cell = self.taleview.dequeueReusableCellWithIdentifier("indexcell", forIndexPath:indexPath) as! IndexCell
        let model:indexModel = self.datasource[indexPath.row] as! indexModel
        cell.configureCell(model)
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count;
    }
    
    func requestdata(){
        let sesson = NSURLSession.sharedSession()
        let url:NSURL = NSURL(string:"http://m.mdl.com/api/index/group/experiences/1?")!
        let request = NSURLRequest.init(URL: url)
        let task = sesson.dataTaskWithRequest(request) { (data, res, err) -> Void in
            let dic = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
            let array = dic["obj"]!["listData"] as! NSArray
            for minidic in array{
                let modeldic:NSDictionary = minidic as! NSDictionary
                let model: indexModel = indexModel()
                model.title = modeldic["title"] as! String
                model.phton = modeldic["photoes"]![0]["url"] as! String
                model.nickname = minidic["user"]!!["nickname"] as! String
                self.datasource.addObject(model)
            }
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                self.taleview.reloadData()
            })
            
        }
        task.resume()
    }
}



