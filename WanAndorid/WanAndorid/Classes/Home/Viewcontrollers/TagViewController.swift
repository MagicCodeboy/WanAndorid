//
//  TagViewController.swift
//  WanAndorid
//
//  Created by lalala on 2018/2/28.
//  Copyright © 2018年 LSH. All rights reserved.
//

import UIKit
import ACTagView
import JSQWebViewController

class TagViewController: UIViewController {

//    fileprivate let tagsStrList = ["我喜欢", "胸大", "腿长", "瓜子脸", "黑长直", "身材高挑", "会卖萌", "会发嗲", "会做饭", "会洗衣", "的", "男生"]
    
    var tagsStrList = [HotListData]()
    
     private var theTagView = ACTagView(frame: CGRect(x: 0, y: CGFloat(topSpace), width: SCREEN_WIDTH, height: SCREEN_HEIGHT - CGFloat(topSpace)), layoutType: .autoLineFeed)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        self.title = "热门博客"
        
        setTagConfig()
        
        loadTheData()
        
    }
    private func setTagConfig() {
        theTagView.tagDataSource = self
        theTagView.tagDelegate = self
        theTagView.allowsMultipleSelection = false //是否支持多选
        print(theTagView.estimatedSize) //打印预估高度
        view.addSubview(theTagView)
    }
    
    private func loadTheData() {
        NetworkRequest.sharedInstance.getRequest(urlString: "http://www.wanandroid.com/friend/json", params: [:] as [String : Any], success: { (result) in
            if let model = HotData.deserialize(from: result) {
                self.tagsStrList = model.data!
            }
            self.theTagView.reloadData()
        }) { (error) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension TagViewController: ACTagViewDataSource {
    func numberOfTags(in tagView: ACTagView) -> Int {
        return tagsStrList.count
    }
    
    func tagView(_ tagView: ACTagView, tagAttributeForIndexAt index: Int) -> ACTagAttribute {
        let hotModel = self.tagsStrList[index]
        let tag = ACTagAttribute.init(text: hotModel.name!)
        return tag
    }
}

extension TagViewController: ACTagViewDelegate {
    func tagView(_ tagView: ACTagView, didSelectTagAt index: Int) {
        print(index)
        print("selectedTagsList-----------", tagView.indexsForSelectedTags)
        let hotModel = self.tagsStrList[index]
        let webViewVc = WebViewController.init(url: URL.init(string: hotModel.link!)!)
        let nav = UINavigationController.init(rootViewController: webViewVc)
        present(nav, animated: true, completion: nil)
    }
    
    func tagView(_ tagView: ACTagView, didDeselectTagAt index: Int) {
        print("deselected------------",index)
    }
}



