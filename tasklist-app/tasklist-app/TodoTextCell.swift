//
//  TodoTextCell.swift
//  tasklist-app
//
//  Created by maxwell on 12/01/2019.
//  Copyright © 2019 maxwell. All rights reserved.
//

import UIKit

class TodoTextCell: UITableViewCell {

    @IBOutlet weak var text_field: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    func getText()->String?{
        return text_field.text
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(false, animated: animated)
        //is not selectable
        // Configure the view for the selected state
    }

}
