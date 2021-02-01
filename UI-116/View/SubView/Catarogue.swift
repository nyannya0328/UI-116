//
//  Catarogue.swift
//  UI-116
//
//  Created by にゃんにゃん丸 on 2021/02/01.
//

import SwiftUI

struct Catarogue: View {
    @Environment(\.colorScheme) var scheme
    @EnvironmentObject var model : VariousViewModel
    var body: some View {
        NavigationView{
            
            ScrollView{
                
                VStack(alignment: .leading, spacing: 15){
                    
                    Image("p2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .cornerRadius(30)
                        .offset(x: -20, y: -10)
                       
                    
                    Text("Great Hot Pod Beautifull")
                        .font(.title2)
                        .foregroundColor(.gray)
                    
                   Text("Red Pod")
                    .font(.title3)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    
                    
                    
                    
                    
                }
                .padding()
                .padding(.bottom,45)
                .padding(.leading,8)
                .frame(maxWidth: .infinity,alignment: .leading)
                .background(Color.primary.opacity(0.06)
                                .padding(.top,70)
                )
                .cornerRadius(10)
                .offset(x: 70)
                .overlay(
                    
                    Button(action: {}, label: {
                        Image(systemName: "bag.fill")
                            .font(.title)
                            .foregroundColor(scheme == .dark ? .black : .white)
                            .padding()
                            .background(Color.primary)
                            .cornerRadius(15)
                        
                    })
                    .offset(x: -30, y: 10)
                    ,alignment: .bottomTrailing
                
                
                
                )
                .padding(.vertical,25)
                
                Card(title: "Google!", image: "g", selectedimage: $model.selectedimage)
                
                Card(title: "Amazon", image: "a", selectedimage: $model.selectedimage)
                
                
                
            }
            
          
            .navigationTitle("Catalogue")
        }
    }
}

struct Catarogue_Previews: PreviewProvider {
    static var previews: some View {
        Catarogue()
    }
}

struct Card : View {
    
    var title : String
    var image : String
    @Binding var selectedimage : String
    var body: some View{
        
        HStack{
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .onTapGesture {
                    withAnimation(Animation.linear){
                        
                        selectedimage = image
                        
                    }
                }
                .background(Circle().stroke(Color.purple.opacity(selectedimage == image ? 1 : 0),lineWidth: 5))
                .padding(7)
            
            
            VStack(alignment:.leading,spacing:8){
                
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Text("Greate item　is Incredible")
                    .font(.caption2)
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
                
                
            }
            
        }
        .padding(.horizontal)
        .padding(.top,15)
        .frame(maxWidth: .infinity, alignment: .leading)
        
        
    }
}
