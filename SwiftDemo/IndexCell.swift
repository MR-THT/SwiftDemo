//
//  IndexCell.swift
//  SwiftDemo
//
//  Created by MR_THT on 16/5/26.
//  Copyright © 2016年 MR_THT. All rights reserved.
//

import UIKit

class IndexCell: UITableViewCell {

    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var nickname: UILabel!
    
    
    var model : indexModel? = nil {
        didSet{
            self.title.text = model?.title
            self.nickname.text = model?.nickname
            
            self.imageview.sd_setImageWithURL(NSURL(fileURLWithPath:(model?.phton)!), placeholderImage: nil)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(model:indexModel){
        self.title.text = model.title
        self.nickname.text = model.nickname
        
        self.imageview.sd_setImageWithURL(NSURL(string:(model.phton)), placeholderImage: nil)
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
