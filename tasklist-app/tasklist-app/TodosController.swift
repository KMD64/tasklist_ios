//
//  ViewController.swift
//  tasklistapp
//
//  Created by maxwell on 03/01/2019.
//  Copyright © 2019 maxwell. All rights reserved.
//

import UIKit

protocol TodoDelegate{
    func setValues(selected_index:Int,todo_text:String?)
}

class TodosController: UITableViewController,TodoDelegate {
    var projects_list:Array<Project>=[]
    func addTodo(position:Int, todotext:String?){
        var todotext_fix=""
        if(todotext != nil){todotext_fix=todotext!}
        projects_list[position].todos.append(Todo(id:0,project_id:projects_list[position].id,t:todotext_fix,is_completed:false))
        //send create request
        
        
        //refresh
        tableView.reloadData()
    }
    
    //TodoDelegate
    func setValues(selected_index:Int,todo_text:String?){
        NSLog("Received!")
        self.addTodo(selected_index, todotext: todo_text)
    }
    //tableviewdatasource implementation
    override func tableView(_tableView:UITableView, numberOfRowsInSection section:Int)->Int{
        return projects_list[section].todos.count
    }
    override func tableView(tableView:UITableView,viewForHeaderInSection section:Int)->UIView?{
        let header=tableView.dequeueReusableCellWithIdentifier("header")
        header?.textLabel?.text=projects_list[section].title
        header?.textLabel?.textColor=UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        return header
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCellWithIdentifier("cell") as? TodoCell
        cell?.setContent(projects_list[indexPath.section].todos[indexPath.row])
        NSLog("Cell at %i",indexPath.row)
        return cell!;
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return projects_list.count
    }
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for(var i=0;i<4;++i){
            projects_list.append(Project(id:i,t:"Project#"))
            addTodo(i,todotext:"Todo")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let controller = (segue.destinationViewController as! UINavigationController).viewControllers.first as? AddTodoController
        if(controller != nil){
            controller!.todo_delegate=self
            controller!.projectlist=projects_list
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

