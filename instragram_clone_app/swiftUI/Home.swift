//
//  Home.swift
//  instragram_clone_app
//
//  Created by praneeth vithanage on 7/8/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct Home:View {
 
    @ObservedObject var observed = observer()
    @ObservedObject var postsobserver = Postobserver()
    @State var show = false
    @State var user = ""
    @State var url = ""
    
    var body : some View {
        ScrollView(.vertical,showsIndicators: false){
            VStack{
                ScrollView(.horizontal,showsIndicators:false){
                    HStack{
                        ForEach(observed.status){i in
                            StatusCard(imName:i.image, show:self.$show, user1: self.$user, url: self.$url).padding(.leading,10)
                            
                        }
                    }
                }
                if postsobserver.posts.isEmpty {
                    Text("No Posts").fontWeight(.heavy)
                }else{
                    ForEach(postsobserver.posts){i in
                        postCard(user: i.name, image: i.image, id: i.id, likes: i.likes, comments: i.comments)
                                       
                                   }
                }
                
               
            }
        }.sheet(isPresented: $show) {
            statusView(url: self.url, name: self.user)
        }
    }
}


