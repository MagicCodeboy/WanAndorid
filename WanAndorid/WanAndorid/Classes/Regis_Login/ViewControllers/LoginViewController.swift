//
//  LoginViewController.swift
//  WanAndorid
//
//  Created by lalala on 2018/3/1.
//  Copyright © 2018年 LSH. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginUsername: UITextField!
    @IBOutlet weak var loginpassword: UITextField!
    
    @IBOutlet weak var loginusernameStatus: UILabel!
    @IBOutlet weak var loginPasswordStatus: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "登录"
        
        let button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 20, height: 20))
        button.setTitle("返回", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(self.backAction), for: .touchUpInside)
        let barButton = UIBarButtonItem.init(customView: button)
        self.navigationItem.leftBarButtonItem = barButton
        
        loginButton.addTarget(self, action: #selector(self.login), for: .touchUpInside)
        
    }
    @objc func backAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func login() {
        print("点击了登录的按钮")
        self.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
