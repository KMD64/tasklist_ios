//
//  Project.swift
//  tasklistapp
//
//  Created by maxwell on 04/01/2019.
//  Copyright © 2019 maxwell. All rights reserved.
//

import Foundation
class Project{
    var id:Int
    var title:String
    var todos:Array<Todo>
    init(id:Int,t:String){
        self.id=id
        self.title=t
        self.todos=[]
  		  }
}
class Todo{
    var text:String
    var id:Int
    var project_id:Int
    var is_completed:Bool
    init(id:Int,project_id:Int,t:String,is_completed:Bool){
        self.id=id
        self.project_id=project_id
        self.text=t
        self.is_completed=is_completed
    }
}