//
//  Project.swift
//  tasklistapp
//
//  Created by maxwell on 04/01/2019.
//  Copyright © 2019 maxwell. All rights reserved.
//

import Foundation


final class Project:ResponseObjectSerializable,ResponseCollectionSerializable{
    var id:Int
    var title:String
    var todos:Array<Todo>
    init(id:Int,t:String){
        self.id=id
        self.title=t
        self.todos=[]
    }
    //implementation
    required init?(response:HTTPURLResponse,representation:Any){
        
            let representation=representation as? [String:Any]
            let id=representation?["id"] as? Int
            let title=representation?["title"] as? String
        
        self.id=id!
        self.title=title!
        self.todos=[]
    }
    
    static func collection(from response: HTTPURLResponse, withRepresentation representation: Any) -> [Project] {
        var collection: [Project] = []
        
        if let representation = representation as? [[String: Any]] {
            for itemRepresentation in representation {
                if let item = Project(response: response, representation: itemRepresentation) {
                    collection.append(item)
                }
            }
        }
        
        return collection
    }
    
}
final class Todo:ResponseObjectSerializable,ResponseCollectionSerializable{
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
    
    required init?(response:HTTPURLResponse,representation:Any){
        NSLog("Responsing Todo")
            let representation=representation as? [String:Any]
            let id=representation?["id"] as? Int
            let text=representation?["text"] as? String
            let project_id=representation?["project_id"] as? Int
            let is_completed=representation?["isCompleted"] as? Bool
        NSLog("ID:\(id)")
        NSLog("Text:\(text)")
        NSLog("Is completed:\(is_completed)")
        self.id=id!
        self.text=text!
        self.project_id=project_id!
        self.is_completed=is_completed!
    }
    static func collection(from response: HTTPURLResponse, withRepresentation representation: Any) -> [Todo] {
        var collection: [Todo] = []
        
        if let representation = representation as? [[String: Any]] {
            for itemRepresentation in representation {
                if let item = Todo(response: response, representation: itemRepresentation) {
                    collection.append(item)
                }
            }
        }
        
        return collection
    }}
