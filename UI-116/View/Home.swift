//
//  Home.swift
//  UI-116
//
//  Created by にゃんにゃん丸 on 2021/02/01.
//

import SwiftUI

struct Home: View {
    init() {
        UITabBar.appearance().isHidden = true
    }
    @EnvironmentObject var model : VariousViewModel
    @Namespace var animation
    var body: some View {
        HStack(spacing:0){
            
          
                
                Drawer(animation: animation)
                
            TabView(selection:$model.selected){
                    
                    Catarogue()
                        .tag("Catalogue")
                    
                    Order()
                        .tag("Youre Cart")
                    
                    Favorite()
                        .tag("Favorites")
                    
                    Cart()
                        .tag("Settinge")
            }
                    
                    
                    
                
                .frame(width: UIScreen.main.bounds.width)
                
                
               
         
        }
        .frame(width: UIScreen.main.bounds.width)
        .offset(x: model.showDrawer ? 125 : -125)
        .overlay(
            ZStack{
                
                if !model.showDrawer{
                    
                    DrawerButton(animation: animation)
                        .padding()
                }
                
                
                
            }
            ,alignment: .topLeading
        )
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
