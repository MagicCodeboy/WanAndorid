//
//  MineViewController.swift
//  WanAndorid
//
//  Created by lalala on 2018/2/26.
//  Copyright © 2018年 LSH. All rights reserved.
//

import UIKit

class MineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var mineTableView:UITableView?
    let headView = MineHeadView()
    let titleArray = ["我的收藏","我的书签","设置"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置界面不自动下移
//        self.navigationController?.navigationBar.isTranslucent = true
//        self.automaticallyAdjustsScrollViewInsets = false
        
        automaticallyAdjustsScrollViewInsets = false
        extendedLayoutIncludesOpaqueBars = true
        edgesForExtendedLayout = .top
        
        setupUI()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MineViewController {
    private func setupUI() {
        headView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 200)
        
        mineTableView = UITableView.init(frame: CGRect.init(x: 0, y: -20, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - CGFloat(topSpace)), style: .plain)
        mineTableView?.delegate = self
        mineTableView?.dataSource = self
        mineTableView?.separatorStyle = .none
        mineTableView?.rowHeight = 50
        mineTableView?.register(UINib.init(nibName: "MineTableViewCell", bundle: nil), forCellReuseIdentifier: "MineTableViewCell")
        mineTableView?.register(UINib.init(nibName: "ExitLogCell", bundle: nil), forCellReuseIdentifier: "ExitLogCell")
        
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(self.tapClick))
        headView.userImage.addGestureRecognizer(tapGesture)
        
        mineTableView?.tableHeaderView = headView
        self.view.addSubview(mineTableView!)
    }
    
    @objc func tapClick() {
        let loginVc = LoginViewController()
        let nav = UINavigationController.init(rootViewController: loginVc)
        present(nav, animated: true, completion: nil)
    }
}

extension MineViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let cell: ExitLogCell = tableView.dequeueReusableCell(withIdentifier: "ExitLogCell") as! ExitLogCell
            return cell
        } else {
            let cell: MineTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MineTableViewCell") as! MineTableViewCell
            cell.theMineTitlelabel.text = titleArray[indexPath.row]
            return cell
        }
    }

}













