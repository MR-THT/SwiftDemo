//
//  Models.swift
//  SwiftDemo
//
//  Created by MR_THT on 16/5/26.
//  Copyright © 2016年 MR_THT. All rights reserved.
//

import Foundation
import UIKit

class indexModel:NSObject {
    var userid = ""
    var type :Int32 = 0
    var approve:Int32 = 0
    var nickname = ""
    var sex:Int32 = 0
    var level:Int32 = 0
    var levelShape:NSDictionary = [:]
    var money:Int32 = 0
    var headUrl = ""
    var province = ""
    var city = ""
    var title = ""
    var phton = ""

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        
    }
    
    
    
}
