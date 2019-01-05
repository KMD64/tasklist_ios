//
//  AddTodoController.swift
//  tasklistapp
//
//  Created by maxwell on 04/01/2019.
//  Copyright © 2019 maxwell. All rights reserved.
//

import UIKit


class AddTodoController: UITableViewController{
    @IBOutlet weak var text_todo: UITextField!
    @IBOutlet var table_outlet: UITableView!
    var todo_delegate:TodoDelegate?
    var projectlist:[Project]=[]
    var index:Int = 0;//Default item
    var status=0;//canceled
    override func viewDidLoad() {
        super.viewDidLoad()
        table_outlet.delegate=self
        table_outlet.dataSource=self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion:nil)
    }
    @IBAction func okButton(sender: AnyObject) {
        if(todo_delegate != nil){
            todo_delegate?.setValues(index, todo_text: text_todo.text)
        }
        dismissViewControllerAnimated(true, completion:nil)
        
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectlist.count
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=table_outlet.dequeueReusableCellWithIdentifier("project2")
            cell?.textLabel?.text=projectlist[indexPath.row].title
        return cell!
    }
    override func tableView(tableView: UITableView, didHighlightRowAtIndexPath indexPath: NSIndexPath) {
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
