//
//  ContentView.swift
//  instragram_clone_app
//
//  Created by praneeth vithanage on 7/5/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                Home().navigationBarTitle("Instagram")
                .navigationBarItems(leading:Button(
                    action:{ },label:{
                        Image("cam").resizable().frame(width:40,height:40)
                        
                }), trailing:
                    HStack{
                        Button(action:{
                }){
                    
                     Image("IGTV").resizable().frame(width:30,height:30)
                            }
                        
                    Button(action:{
                             }){
                                 
                     Image("send").resizable().frame(width:30,height:30)
                                         }
                        
                         }
                )
            
            
            
            }.tabItem {
                  Image("home")
                
            }
            
            Text("Search").tabItem {
                  Image("find")
                
            }
            Text("Upload").tabItem {
                  Image("cam")
                
            }
            Text("Like").tabItem {
                  Image("heart1")
                
            }
            Text("Profile").tabItem {
                  Image("person")
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}







   

