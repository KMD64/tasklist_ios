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
        checkbox_outlet.flat=true
        checkbox_outlet.tintColor=Colors.main_color
        checkbox_outlet.checkColor=Colors.background_color
        checkbox_outlet.strokeColor=Colors.stroke_color
        checkbox_outlet.radius=0
        
        // Initialization code
        
    }
    func m13CheckboxStateChange(to state: M13CheckboxState) {
        let s = label_outlet.attributedText as! NSMutableAttributedString
        label_outlet.attributedText=nil
        if(state==M13CheckboxStateChecked){
            s.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, s.length))
            
        }
        else{
            s.removeAttribute(NSStrikethroughStyleAttributeName,range: NSMakeRange(0,s.length))
    
        }
        label_outlet.attributedText=s
        NSLog(Alamofire.request("https://maxwell-tasklist.herokuapp.com/update", method:.post, parameters: ["todo_id":id], encoding: JSONEncoding.default, headers: nil).response.debugDescription)
        
        
    }
    func setContent(_ todo:Todo){
        id=todo.id
        //needs for strikethrough
        let s = NSMutableAttributedString(string:todo.text)
        s.addAttribute(NSStrikethroughColorAttributeName, value: UIColor.black, range: NSMakeRange(0,s.length))
        if todo.is_completed {
            checkbox_outlet.checkState = M13CheckboxStateChecked
            s.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0,s.length))
        }
        label_outlet.attributedText=s

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
