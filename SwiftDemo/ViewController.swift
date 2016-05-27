//
//  ViewController.swift
//  SwiftDemo
//
//  Created by MR_THT on 16/5/26.
//  Copyright © 2016年 MR_THT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let button:UIButton = UIButton.init(type: UIButtonType.System)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.button.frame = CGRectMake(100, 300, 100, 30)
        self.button.setTitle("跳转", forState: UIControlState.Normal)
        
        self.button.addTarget(self, action:Selector("buttonAction"), forControlEvents: UIControlEvents.TouchUpInside)
        
        self.view.addSubview(self.button)
        
        
        
    }
    
    func buttonAction(){
        let indexVC = indexController()
        self.navigationController!.pushViewController(indexVC, animated:true)
//        self.presentViewController(indexVC, animated: true, completion:nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

