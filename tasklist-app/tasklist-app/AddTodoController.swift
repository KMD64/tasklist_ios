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
    
    @IBAction func cancelButton(_ sender: AnyObject) {
        
        dismiss(animated: true, completion:nil)
    }
    @IBAction func okButton(_ sender: AnyObject) {
        if(todo_delegate != nil){
            todo_delegate?.setValues(index, todo_text: text_todo.text)
        }
        dismiss(animated: true, completion:nil)
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectlist.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=table_outlet.dequeueReusableCell(withIdentifier: "project2")
            cell?.textLabel?.text=projectlist[indexPath.row].title
        return cell!
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
