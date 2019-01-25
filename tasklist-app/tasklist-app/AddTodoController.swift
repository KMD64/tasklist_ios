//
//  AddTodoController.swift
//  tasklistapp
//
//  Created by maxwell on 04/01/2019.
//  Copyright © 2019 maxwell. All rights reserved.
//

import UIKit


class AddTodoController: UITableViewController{
    @IBOutlet var table_outlet: UITableView!
    var todo_delegate:TodoDelegate?
    var textcell:TodoTextCell?=nil
    var projectlist:[Project]=[]
    var index:Int = 0;//Default item
    override func viewDidLoad() {
        super.viewDidLoad()
        table_outlet.delegate=self
        table_outlet.dataSource=self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButton(_ sender: AnyObject) {
        dismiss(animated: true, completion:nil)
    }
    @IBAction func okButton(_ sender: AnyObject) {
        if(todo_delegate != nil){
            todo_delegate?.setValues(index, todo_text: textcell?.getText())
        }
        dismiss(animated: true, completion:nil)
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var cell:UITableViewCell? = nil
        if section==0 {
            cell=createCaptionView(s: "Задача")
        }
        else{
            cell=createCaptionView(s: "Категория")
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section==0{
            return 80
        }
        return 72
    }
    func createCaptionView(s:String)->UITableViewCell?{
        let cell=table_outlet.dequeueReusableCell(withIdentifier: "todo_label")
        cell?.textLabel?.text=s.uppercased()
        cell?.textLabel?.font=UIFont(name:"OpenSans-Semibold",size:14.0)
        
        
        return cell
    }
    override func tableView(_ _tableView:UITableView, numberOfRowsInSection section:Int)->Int{
        if section==0{
            return 1
        }
        else{
            return projectlist.count
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?=nil
        switch indexPath.section{
        case 0:
            textcell=table_outlet.dequeueReusableCell(withIdentifier:"todo_text_cell") as! TodoTextCell
            cell=textcell
            break
        case 1:
            cell=table_outlet.dequeueReusableCell(withIdentifier: "project2")
            cell?.textLabel?.text=projectlist[indexPath.row].title
            break
        default:
            break
        }

        return cell!
    }
    override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        if indexPath.section != 1 {return false}
        return true
    }
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
        index = indexPath.row
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
