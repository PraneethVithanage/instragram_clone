//
//  Observers.swift
//  instragram_clone_app
//
//  Created by praneeth vithanage on 7/8/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import Firebase

class observer : ObservableObject{
    @Published var status = [datatype]()
    init(){
        let db = Firestore.firestore()
        db.collection("status").addSnapshotListener{(snap,err)in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges{
                if i.type == .added {
                    let id = i.document.documentID
                    let name = i.document.get("name") as! String
                    let image = i.document.get("image")as! String
                    
                    self.status.append(datatype(id:id,name:name,image:image))
                }
                if i.type == .removed {
                    let id = i.document.documentID
                    for j in  0 ..< self.status.count{
                        if self.status[j].id == id{
                            self.status.remove(at: j)
                            return
                            
                        }
                        
                        if i.type == .removed{
                            let id = i.document.documentID
                            for j in 0..<self.status.count{
                                if self.status[j].id == id{
                                    self.status.remove(at: j)
                                    return
                                }
                            }
                        }
                        
                       
                    }
                }
            }
       }
    }
}

    
    class Postobserver : ObservableObject{
        @Published var posts = [datatype1]()
        init(){
            let db = Firestore.firestore()
            db.collection("posts").addSnapshotListener{(snap,err)in
                if err != nil{
                    print((err?.localizedDescription)!)
                    return
                }
                for i in snap!.documentChanges{
                    if i.type == .added {
                        let id = i.document.documentID
                        let name = i.document.get("name") as! String
                        let image = i.document.get("image")as! String
                        let comment = i.document.get("comments")as! String
                        let likes = i.document.get("likes")as! String
                        
                        self.posts.append(datatype1(id: id, name: name, image: image, comments: comment, likes: likes))
                    }
                    if i.type == .removed {
                        let id = i.document.documentID
                        for j in  0 ..< self.posts.count{
                            if self.posts[j].id == id{
                                self.posts.remove(at: j)
                                return
                                
                            }
                            
                            if i.type == .removed{
                                let id = i.document.documentID
                                for j in 0..<self.posts.count{
                                    if self.posts[j].id == id{
                                        self.posts.remove(at: j)
                                        return
                                    }
                                }
                            }
                            
                            if i.type == .modified{
                            let id = i.document.documentID
                            let likes = i.document.get("likes")as!String
                            if i.type == .removed{
                                    let id = i.document.documentID
                                    for j in 0..<self.posts.count{
                                    if self.posts[j].id == id{
                                        self.posts[j].likes = likes
                                        
                                    return
                                                }
                                        }
                                  }
                                                       
                             }
                        }
                    }
                }
           }
        }
    }
