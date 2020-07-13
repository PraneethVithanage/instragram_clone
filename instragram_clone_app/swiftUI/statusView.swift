//
//  statusView.swift
//  instragram_clone_app
//
//  Created by praneeth vithanage on 7/7/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
 struct statusView:View {
        var url = ""
        var name = ""
        var body : some View{
            ZStack{
                AnimatedImage(url:URL(string:url)).resizable().edgesIgnoringSafeArea(.all)
                VStack{
                    HStack{
                        Text(name).font(.headline).fontWeight(.heavy).padding()
                        Spacer()
                    }
                    Spacer()
                }
            }
           
    }
}



