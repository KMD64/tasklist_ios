//
//  TodoCell.swift
//  tasklistapp
//
//  Created by maxwell on 04/01/2019.
//  Copyright © 2019 maxwell. All rights reserved.
//
import UIKit
class TodoCell: UITableViewCell, M13CheckboxDelegate{
    
    var id=0
    @IBOutlet weak var label_outlet: UILabel!
    @IBOutlet weak var checkbox_outlet: M13Checkbox!
    override func awakeFromNib() {
        super.awakeFromNib()
        checkbox_outlet.delegate=self
        // Initialization code
        
    }
    func m13CheckboxStateChangeTo(state: M13CheckboxState) {
            NSLog("Click!")
    }
    func setContent(todo:Todo){
        label_outlet.text=todo.text
        
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
