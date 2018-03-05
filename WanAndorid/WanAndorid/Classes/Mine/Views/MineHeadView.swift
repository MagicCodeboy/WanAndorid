
//
//  MineHeadView.swift
//  WanAndorid
//
//  Created by lalala on 2018/2/27.
//  Copyright © 2018年 LSH. All rights reserved.
//

import UIKit
import SnapKit

class MineHeadView: UIView {
    
    let userImage = UIImageView()
    let userName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //设置背景颜色
        self.backgroundColor = .gray
        
        setupUI()
    }
    //设置UI界面
    private func setupUI() {
        userImage.image = UIImage.init(named: "1")
        userImage.isUserInteractionEnabled = true
        self.addSubview(userImage)
        userImage.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
            make.height.width.equalTo(50)
        }
        userName.text = "用户姓名"
        self.addSubview(userName)
        userName.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(userImage.snp.bottom).offset(10)
        }
    }
    override func draw(_ rect: CGRect) {
         super.draw(rect)
        
        userImage.layer.cornerRadius = 25
        userImage.layer.masksToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
