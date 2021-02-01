//
//  Drawer.swift
//  UI-116
//
//  Created by にゃんにゃん丸 on 2021/02/01.
//

import SwiftUI
let gra = LinearGradient(gradient: .init(colors: [.red,.blue]), startPoint: .leading, endPoint: .trailing)



struct Drawer: View {
    @EnvironmentObject var model : VariousViewModel
    var animation : Namespace.ID
    var body: some View {
        VStack{
            
            HStack{
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
               
                
                Spacer()
                
                if model.showDrawer{
                    DrawerButton(animation: animation)
                }
                
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 15, content: {
                Text("Hello")
                    .font(.title)
                    .fontWeight(.bold)
                    
                
                Text("Risa")
                    .font(.caption)
                    .fontWeight(.semibold)
                
                
                
            })
            
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.top,5)
            
            VStack(spacing:8){
                
                MenuButton(name: "Catalogue", image: "envelope.fill", selected: $model.selected, animation: animation)
                
                MenuButton(name: "Youre Cart", image: "bag.fill", selected: $model.selected, animation: animation)
                
                MenuButton(name: "Favorites", image: "suit.heart.fill", selected: $model.selected, animation: animation)
                
                MenuButton(name: "Settinge", image: "list.triangle", selected: $model.selected, animation: animation)
                
                
            }
            .padding(.leading)
            .frame(width: 250, alignment: .leading)
            .padding(.top,30)
            
            Divider()
                .background(Color.black)
                .padding(.horizontal,25)
                .padding(.top,25)
            
            Spacer()
            
            MenuButton(name: "Your Order", image: "rectangle.righthalf.inset.fill.arrow.right", selected: .constant(""), animation: animation)
                .padding(.bottom,25)
           
        }
        .frame(width: 250)
        .background(gra.ignoresSafeArea(.all, edges: .vertical))
    }
}

struct Drawer_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
struct DrawerButton : View {
    @EnvironmentObject var  model : VariousViewModel
    var animation : Namespace.ID
    var body: some View{
        
        Button(action: {
            
            withAnimation(.easeOut){
                
                model.showDrawer.toggle()
            }
            
        }, label: {
            VStack{
                
                Capsule()
                    .fill(model.showDrawer ? Color.white : Color.primary)
                    .frame(width: 35, height: 3)
                    .rotationEffect(.init(degrees: model.showDrawer ? -50 : 0))
                    .offset(x: model.showDrawer ? 4 : 0, y: model.showDrawer ? 9 : 0)
                   
                    
                
                VStack{
                    
                    Capsule()
                        .fill(model.showDrawer ? Color.white : Color.primary)
                        .frame(width: 35, height: 2)
                    
                    Capsule()
                        .fill(model.showDrawer ? Color.white : Color.primary)
                        .frame(width: 35, height: 2)
                        .offset(y: model.showDrawer ? -8 : 0)
                    
                    
                    
                }
                .rotationEffect(.init(degrees: model.showDrawer ? 50 : 0))
               
            }
        })
        .scaleEffect(0.8)
        .matchedGeometryEffect(id: "Menu_Button", in: animation)
        
    }
}
