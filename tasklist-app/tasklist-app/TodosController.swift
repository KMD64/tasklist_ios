//
//  ViewController.swift
//  tasklistapp
//
//  Created by maxwell on 03/01/2019.
//  Copyright © 2019 maxwell. All rights reserved.
//

import UIKit
import Alamofire
protocol TodoDelegate{
    func setValues(_ selected_index:Int,todo_text:String?)
}

class TodosController: UITableViewController,TodoDelegate {
    var projects_list:Array<Project>=[]
    func addTodo(_ position:Int, todotext:String?){
        var todotext_fix=""
        if(todotext != nil){todotext_fix=todotext!}
        //sending post create request
        Alamofire.request("https://maxwell-tasklist.herokuapp.com/create", method: .post, parameters:["project_id":projects_list[position].id,"text":todotext_fix], encoding: JSONEncoding.default, headers: nil).responseObject{(response:DataResponse<Todo>) in
            NSLog(response.debugDescription)
            if let todo = response.result.value {
                self.projects_list[position].todos.append(todo)
                self.tableView.reloadData()
            }
        }
    
        //send create request
        
        
        //refresh
        tableView.reloadData()
    }
    //TodoDelegate
    func setValues(_ selected_index:Int,todo_text:String?){
        NSLog("Received!")
        self.addTodo(selected_index, todotext: todo_text)
    }
    //tableviewdatasource implementation
    override func tableView(_ _tableView:UITableView, numberOfRowsInSection section:Int)->Int{
        return projects_list[section].todos.count
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView:UITableView,viewForHeaderInSection section:Int)->UIView?{
        let header=tableView.dequeueReusableCell(withIdentifier: "header")

        header?.textLabel?.text=projects_list[section].title.uppercased()
        
        header?.textLabel?.textColor=UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell") as? TodoCell
        cell?.setContent(projects_list[indexPath.section].todos[indexPath.row])
        NSLog("Cell at %i",indexPath.row)
        return cell!;
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return projects_list.count
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //index request
        Alamofire.request("https://maxwell-tasklist.herokuapp.com/").responseCollection{
            (request:DataResponse<[Project]>) in
            if let prj_list = request.result.value {
                NSLog(request.debugDescription)
                self.projects_list = prj_list
                
                self.tableView.reloadData()
                for var i in 0...self.projects_list.count-1 {
                    Alamofire.request("https://maxwell-tasklist.herokuapp.com/gettodolist?project_id=\(self.projects_list[i].id)").responseCollection{
                        (response:DataResponse<[Todo]>) in
                        if let todos=response.result.value{
                            self.projects_list[i].todos=todos
                            self.tableView.reloadData()
                        }
                    }
                    
                }
            }
            
        }
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = (segue.destination as! UINavigationController).viewControllers.first as? AddTodoController
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

