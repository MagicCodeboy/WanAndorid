

//
//  ListData.swift
//  WanAndorid
//
//  Created by lalala on 2018/3/1.
//  Copyright © 2018年 LSH. All rights reserved.
//

import UIKit
import HandyJSON

class ListData: NSObject {

}

class ListModel: HandyJSON {
    var data: [ListFirstChildModel]?
    
    required init() {}
}

class ListFirstChildModel: HandyJSON {
    var children: [ChildRenModel]?
    var courseId: Int?
    var id: Int?
    var name: String?
    var order: Int?
    var parentChapterId: Int?
    var visible: Int?
 
    required init() {}
}

class ChildRenModel: HandyJSON {
    var courseId: Int?
    var id: Int?
    var name: String?
    var order: Int?
    var parentChapterId: Int?
    var visible: Int?
    
    required init() {}
}
