//
//  HomeTabalCell.swift
//  WanAndorid
//
//  Created by lalala on 2018/2/26.
//  Copyright © 2018年 LSH. All rights reserved.
//

import UIKit
import Kingfisher

class HomeTabalCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
        addShadowColor(theView: homeBottomView)
        authorImageView.layer.cornerRadius = 25
        authorImageView.layer.masksToBounds = true
        
    }
    
    func addShadowColor(theView: UIView) {
        theView.layer.masksToBounds = false
        theView.layer.contentsScale = UIScreen.main.scale
        theView.layer.shadowOpacity = 0.3
        theView.layer.shadowRadius = 2.0
        theView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        theView.layer.shadowPath = UIBezierPath.init(roundedRect: theView.bounds, cornerRadius: 5).cgPath
        theView.layer.shouldRasterize = true
        theView.layer.rasterizationScale = UIScreen.main.scale
    }

    @IBOutlet weak var homeBottomView: UIView!
    @IBOutlet weak var authorImageView: UIImageView!
    @IBOutlet weak var autorTitleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var articleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var clickLikeButton: UIButton!
    
    
    func setCellData(homeData: HomeData) {
        authorImageView.kf.setImage(with: ImageResource.init(downloadURL: NSURL.init(string: homeData.envelopePic!)! as URL))
        autorTitleLabel.text = homeData.author
        timeLabel.text = homeData.niceDate
        articleLabel.text = homeData.title
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
