//
//  CustomerCellView.swift
//  NeverSitUpTest
//
//  Created by Nawin Phunsawat on 28/3/2563 BE.
//  Copyright © 2563 Nawin Phunsawat. All rights reserved.
//

import UIKit

class CustomerCellView: UITableViewCell {

    @IBOutlet weak var customerLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
