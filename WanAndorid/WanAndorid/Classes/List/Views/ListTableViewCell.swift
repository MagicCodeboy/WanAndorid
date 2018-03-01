//
//  ListTableViewCell.swift
//  WanAndorid
//
//  Created by lalala on 2018/2/26.
//  Copyright © 2018年 LSH. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var listTitleLable: UILabel!
    @IBOutlet weak var theOneLabel: UILabel!
    @IBOutlet weak var theTwolabel: UILabel!
    @IBOutlet weak var theThreeLabel: UILabel!
    @IBOutlet weak var theFourLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
