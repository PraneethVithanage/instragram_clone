//
//  postCard.swift
//  instragram_clone_app
//
//  Created by praneeth vithanage on 7/7/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase


struct postCard:View {

    var user = ""
    var image = ""
    var id = ""
    var likes =  ""
    var comments=""
    var body : some View{
        VStack(alignment: .leading, content:{
            HStack{
                AnimatedImage(url: URL(string: image)).resizable().frame(width: 30, height:30).clipShape(Circle())
                Text(user)
                Spacer()
                Button(action:{
                    
                }){
                    Image("menu").resizable().frame(width: 15, height: 15)
                  }
            }
            
            AnimatedImage(url: URL(string: image)).resizable().frame(height:350)
            HStack{
                
                Button(action:{
                                   
                               }){
                                   Image("comment").resizable().frame(width: 30, height: 30)
                                
                                 }
                
                Button(action:{

                         let db = Firestore.firestore()
                         let like = Int.init(self.likes)!
                    db.collection("posts").document(self.id).updateData(["likes":"\(like + 1 )"]){(err) in
                         if err != nil{
                                print((err))
                                return
                                    }
                                print("updated.......")
                              }
                              }){
                                   Image("heart").resizable().frame(width: 30, height: 30)
                                               }
                Spacer()
                
                Button(action:{
                                   
                }){
                     Image("saved").resizable().frame(width: 30, height: 30)
                                 }
                
            }.padding(.top,8)
            Text("\(likes)Likes").padding(.top, 8)
            Text("View all\(comments) comments")
        }).padding(8)
    }
}
