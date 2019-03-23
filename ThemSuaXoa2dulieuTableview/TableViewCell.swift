//
//  TableViewCell.swift
//  ThemSuaXoa2dulieuTableview
//
//  Created by Mac on 3/6/19.
//  Copyright © 2019 anh vu. All rights reserved.
//

import UIKit
var count = 0

class TableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        count += 1
        detailTextLabel?.text = ("\(count)")
        //             Initialization code
    }
    override func prepareForReuse() {
        //    sắp xếp theo thứ tư đúng 10 ô thì thay doi màu
        
        contentView.backgroundColor = UIColor.clear
        textLabel?.text = nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
