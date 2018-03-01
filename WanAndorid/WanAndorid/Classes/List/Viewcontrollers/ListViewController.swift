//
//  ListViewController.swift
//  WanAndorid
//
//  Created by lalala on 2018/2/26.
//  Copyright © 2018年 LSH. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var myTableView: UITableView?
    var listDataArray = [ListFirstChildModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "知识体系"
        setupUI()
        loadListData()
        
    }
    func setupUI( ) {
         myTableView = UITableView.init(frame: CGRect.init(x: 0, y: CGFloat(topSpace), width: SCREEN_WIDTH, height: SCREEN_HEIGHT - CGFloat(topSpace)), style: .plain)
        myTableView?.backgroundColor = .white
        myTableView?.separatorStyle = .none
        myTableView?.rowHeight = 120
        myTableView?.delegate = self
        myTableView?.dataSource = self
        myTableView?.register(UINib.init(nibName: "ListTableViewCell", bundle: nil), forCellReuseIdentifier: "ListTableViewCell")
        view.addSubview(myTableView!)
    }
    
    func loadListData() {
        NetworkRequest.sharedInstance.getRequest(urlString: "http://www.wanandroid.com/tree/json", params: [:] as [String : Any] , success: { (result) in
            if let resultData = ListModel.deserialize(from: result) {
                self.listDataArray = resultData.data!
            }
            self.myTableView?.reloadData()
        }) { (error) in
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
extension ListViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listDataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell") as! ListTableViewCell
        let listData = self.listDataArray[indexPath.row]
        cell.listTitleLable.text = listData.name
        cell.theOneLabel.text = listData.children?[0].name
//        cell.theTwolabel.text = listData.children?[1].name
//        cell.theThreeLabel.text = listData.children?[2].name
//        cell.theFourLabel.text = listData.children?[3].name
        return cell
        
    }
    
    
}

