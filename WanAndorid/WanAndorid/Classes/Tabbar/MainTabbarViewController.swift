//
//  MainTabbarViewController.swift
//  WanAndorid
//
//  Created by lalala on 2018/2/26.
//  Copyright © 2018年 LSH. All rights reserved.
//

import UIKit

class MainTabbarViewController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let homeVc = HomeViewController()
        let homeItem = UITabBarItem.init(title: "首页", image: UIImage.init(named: "sudu_shouye_f"), selectedImage: UIImage.init(named: "sudu_shouye_z"))
        let homeNa = UINavigationController.init(rootViewController: homeVc)
        
        let listVc = ListViewController()
        let listItem = UITabBarItem.init(title: "知识体系", image: UIImage.init(named: "sudu_shuja_f"), selectedImage: UIImage.init(named: "sudu_shuja_z"))
        let listNa = UINavigationController.init(rootViewController: listVc)
        
        let mineVc = MineViewController()
        let mineItem = UITabBarItem.init(title: "我的", image: UIImage.init(named: "sudu_wo_f"), selectedImage: UIImage.init(named: "sudu_wo_z"))
        
        homeVc.tabBarItem = homeItem
        listVc.tabBarItem = listItem
        mineVc.tabBarItem = mineItem
        
        self.viewControllers = [homeNa,listNa,mineVc]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
