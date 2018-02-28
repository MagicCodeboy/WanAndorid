
//
//  TheHomeData.swift
//  WanAndorid
//
//  Created by lalala on 2018/2/27.
//  Copyright © 2018年 LSH. All rights reserved.
//

import UIKit
import HandyJSON
import SwiftyJSON

class TheHomeData: NSObject {
    
}

class HotData: HandyJSON {
    required init() {}
    
    var data: [HotListData]?
}

class HotListData: HandyJSON {
    required init() {}
    
    var icon: String?
    var id: Int?
    var link: String?
    var name: String?
    var order: Int?
    var visible: Int?
}

class Banner: HandyJSON {
    var data: [BannerData]?

    required init() {}
}

class BannerData: HandyJSON {
    required init() {}
    
    var desc: String?
//    var id: Int?
    var imagePath: String?
//    var isVisible: Int?
//    var order: Int?
    var title: String?
//    var type: Int?
    var url: String?
    
//    init(jsonData: JSON) {
//         desc = jsonData["desc"].stringValue
//        title = jsonData["title"].stringValue
//        url = jsonData["url"].stringValue
//        imagePath = jsonData["imagePath"].stringValue
//    }
}

class TheData: HandyJSON {
    var curPage: Int?
    var datas: [HomeData]?

    required init() {}
}

class HomeData: HandyJSON {
    var apkLink: String?
    var author: String?
    var chapterId: Int?
    var chapterName: String?
    var collect: Bool?
    var sourceId: Int?
    var desc: String?
    var envelopePic: String?
    var id: Int64?
    var link: String?
    var niceDate: String?
    var projectLink: String?
    var publishTime: Int64?
    var title: String?
    var zan: Int?
    var visible: Int?
    
    required init() {}
}
