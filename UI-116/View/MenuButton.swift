//
//  MenuButton.swift
//  UI-116
//
//  Created by にゃんにゃん丸 on 2021/02/01.
//

import SwiftUI

struct MenuButton: View {
    var name : String
    var image : String
    @Binding var selected : String
    var animation : Namespace.ID
    var body: some View {
        Button(action: {
            
            withAnimation(.spring()){
                
                selected  = name
                
            }
            
            
        }, label: {
            
            HStack(spacing:10){
                
                Image(systemName: image)
                    .font(.title2)
                    .foregroundColor(selected == name ? .black : .white)
                
                Text(name)
                    .font(.callout)
                    .foregroundColor(selected == name ? .black : .white)
                
            }
            .padding(.horizontal)
            .padding(.vertical,12)
            .frame(width: 200,alignment: .leading)
            .background(
            
                ZStack{
                    
                    if selected == name{
                        
                        Color.white
                        .cornerRadius(10)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                        
                    }
                    else{
                        
                        Color.clear
                    }
                }
            
            )
            
        })
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


