//
//  TodoCell.swift
//  tasklistapp
//
//  Created by maxwell on 04/01/2019.
//  Copyright © 2019 maxwell. All rights reserved.
//
import UIKit
import Alamofire
class TodoCell: UITableViewCell, M13CheckboxDelegate{
    
    var id=0
    @IBOutlet weak var label_outlet: UILabel!
    @IBOutlet weak var checkbox_outlet: M13Checkbox!
    override func awakeFromNib() {
        super.awakeFromNib()
        checkbox_outlet.delegate=self
        // Initialization code
        
    }
    func m13CheckboxStateChange(to state: M13CheckboxState) {
            NSLog("Click!")
        NSLog(Alamofire.request("https://maxwell-tasklist.herokuapp.com/update", method:.post, parameters: ["todo_id":id], encoding: JSONEncoding.default, headers: nil).response.debugDescription)
        
    }
    func setContent(_ todo:Todo){
        id=todo.id
        label_outlet.text=todo.text
        if todo.is_completed {
        checkbox_outlet.checkState = M13CheckboxStateChecked
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
