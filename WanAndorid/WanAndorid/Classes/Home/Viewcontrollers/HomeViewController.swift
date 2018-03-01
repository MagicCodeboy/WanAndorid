//
//  HomeViewController.swift
//  WanAndorid
//
//  Created by lalala on 2018/2/26.
//  Copyright © 2018年 LSH. All rights reserved.
//

import UIKit
import FSPagerView
import Kingfisher
import SwiftyJSON
import JSQWebViewController

class HomeViewController: UIViewController,FSPagerViewDelegate,FSPagerViewDataSource,UITableViewDelegate,UITableViewDataSource {
    
    let topScrollPic = ["1","2","3"]
    var myTableView:UITableView?
    var articles = [HomeData]()
    var banners = [BannerData]()
    var pagerView: FSPagerView?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "首页"
        
        let button1 = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 30, height: 30))
        button1.setTitle("热门", for: .normal)
        button1.setTitleColor(.black, for: .normal)
        button1.addTarget(self, action: #selector(self.leftACtionClick), for: .touchUpInside)
        let barButton1 = UIBarButtonItem.init(customView: button1)
        self.navigationItem.leftBarButtonItem = barButton1
        
        
        setupUI()
        
        pagerView = FSPagerView(frame:CGRect.init(x: 0, y: topSpace, width: Int(SCREEN_WIDTH), height: 200))
        pagerView?.layer.masksToBounds = true
        pagerView?.automaticSlidingInterval = 3
        pagerView?.isInfinite = true
        pagerView?.dataSource = self
        pagerView?.delegate = self
        pagerView?.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        pagerView?.transformer = FSPagerViewTransformer.init(type: .zoomOut)
//        self.view.addSubview(pagerView)
        
        let pageControl = FSPageControl.init(frame: CGRect.init(x: 0, y: 180, width: Int(SCREEN_WIDTH), height: 20))
        pageControl.numberOfPages = topScrollPic.count
        pageControl.currentPage = 1
        pageControl.contentHorizontalAlignment = .right
        pageControl.setStrokeColor(.green, for: .normal)
        pageControl.setStrokeColor(.yellow, for: .selected)
        pageControl.itemSpacing = 10
        pagerView?.addSubview(pageControl)
        
        myTableView?.tableHeaderView = pagerView
        
        loadHomeBannerData()
        loadTableViewData()
    }
    @objc func leftACtionClick() {
        let tagViewVc = TagViewController()
        self.navigationController?.pushViewController(tagViewVc, animated: false)
        self.tabBarController?.hidesBottomBarWhenPushed = true
    }
    
    func loadTableViewData() {
        NetworkRequest.sharedInstance.getRequest(urlString: "http://www.wanandroid.com/article/list/0/json", params: [:] as [String : Any] , success: { (result) in
//            print("result\(result)")
            if let thedata = TheData.deserialize(from: result["data"] as? NSDictionary){
//                print("theData\(thedata)")
                self.articles = thedata.datas!
            }
//            print("articles\(self.articles)")
            self.myTableView?.reloadData()
        }) { (error) in
            print("error\(error)")
        }
    }
    
    func loadHomeBannerData() {
        NetworkRequest.sharedInstance.getRequest(urlString: "http://www.wanandroid.com/banner/json", params: [:] as [String : Any], success: { (result) in
            
            if let model = Banner.deserialize(from: result){
//                print("\(String(describing: model.data))")
                self.banners = model.data!
            }
           self.pagerView?.reloadData()
        }) { (error) in
            print("error\(error)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension HomeViewController {
    
   private func setupUI() {
        myTableView = UITableView.init(frame: CGRect.init(x: 0, y: CGFloat(topSpace), width: SCREEN_WIDTH, height: SCREEN_HEIGHT - CGFloat(topSpace)), style: .plain)
        myTableView?.delegate = self
        myTableView?.dataSource = self
        myTableView?.rowHeight = 150
        myTableView?.separatorStyle = .none
        myTableView?.register(UINib.init(nibName: "HomeTabalCell", bundle: nil), forCellReuseIdentifier: "homeCell")
        self.view.addSubview(myTableView!)
    }
}

extension HomeViewController {
    
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        print(self.banners.count)
        return self.banners.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let bannerData = self.banners[index]
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.kf.setImage(with: ImageResource.init(downloadURL: NSURL.init(string: bannerData.imagePath!)! as URL))
        cell.textLabel?.text = bannerData.desc
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        let bannerData = self.banners[index]
        let webController = WebViewController.init(url: URL.init(string: bannerData.url!)!)
        let nav = UINavigationController.init(rootViewController: webController)
        self.present(nav, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:HomeTabalCell = tableView.dequeueReusableCell(withIdentifier: "homeCell") as! HomeTabalCell
        let homedata = self.articles[indexPath.row]
        cell.setCellData(homeData: homedata)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let homeData = self.articles[indexPath.row]
        let webViewVc = WebViewController.init(url: URL.init(string: homeData.link!)!)
        let nav = UINavigationController.init(rootViewController: webViewVc)
        self.present(nav, animated: true, completion: nil)
    }
}
