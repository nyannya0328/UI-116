//
//  Order.swift
//  UI-116
//
//  Created by にゃんにゃん丸 on 2021/02/01.
//

import SwiftUI

struct Order: View {
    @EnvironmentObject var model : VariousViewModel
    @Environment(\.colorScheme) var scheme
    
    @State var current_time = Time(min: 0, sec: 0, hour: 0)
    @State var reciver = Timer.publish(every: 1,on: .current, in: .default).autoconnect()
    var body: some View {
        NavigationView{
            
            
            VStack{
                
                HStack{
                    
                    Text("Analog Clock")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(model.isdark ? .red : .primary)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        model.isdark.toggle()
                    }) {
                        Image(systemName: model.isdark ? "moon.zzz.fill" : "sun.min.fill")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(scheme == .dark ? .black : .white)
                            .background(Color.primary)
                            .cornerRadius(10)
                            .padding(10)
                            
                    }
                    
                    
                        
                    
                }
                
                
                ZStack{
                    
                    Circle()
                        .fill(gra)
                    
                    ForEach(0..<60,id:\.self){index in
                        
                        Rectangle()
                            .fill(Color.primary)
                            .frame(width: 2, height: (index % 5) == 0 ? 15 : 5)
                            .offset(y: (model.with - 110) / 2)
                            .rotationEffect(.init(degrees: Double(index) * 6))
                            
                            
                        
                        
                        
                        
                    }
                    Rectangle().fill(Color.primary).frame(width: 2, height: (model.with - 180) / 2)
                        .offset(y: -(model.with - 180) / 4)
                        .rotationEffect(.init(degrees: Double(current_time.sec) * 6))
                    
                    Rectangle().fill(Color.primary).frame(width: 4, height: (model.with - 240) / 2)
                        .offset(y: -(model.with - 200) / 4)
                        .rotationEffect(.init(degrees: Double(current_time.min) * 6))
                    
                    
                    Rectangle().fill(Color.primary).frame(width: 4.5, height: (model.with - 240) / 2)
                        .offset(y: -(model.with - 240) / 4)
                        .rotationEffect(.init(degrees: Double(current_time.hour) + (Double(current_time.min) / 60)) * 30)
                    
                    Circle()
                        .fill(Color.primary)
                        .frame(width: 15, height: 15)
                    
                    
                        
                }
                .frame(width: model.with - 80, height: model.with - 80)
                
                
               
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
               
                    
                    
                    
                
                Text(model.getTime())
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    
                
                
                
                
                .onReceive(reciver) { (_) in
                    let carender = Calendar.current
                    let min = carender.component(.minute, from: Date())
                    let sec = carender.component(.second, from: Date())
                    let hour = carender.component(.hour, from: Date())
                    withAnimation(.linear(duration: 0.2)){
                        
                        self.current_time = Time(min: min, sec: sec, hour: hour)
                        
                    }
                }
                .onAppear(perform: {
                    
                    let carender = Calendar.current
                    let min = carender.component(.minute, from: Date())
                    let hour = carender.component(.hour, from: Date())
                    withAnimation(.linear(duration: 0.2)){
                        
                        self.current_time = Time(min: min, sec: hour, hour: hour)
                        
                    }
                    
                    
                    
                    
                    
                })
                
                
              
                Spacer()
            }
            
           
              
        }
        .navigationBarHidden(true)
        
        .preferredColorScheme(model.isdark ? .dark : .light)
       
    }
}

struct Order_Previews: PreviewProvider {
    static var previews: some View {
        Order()
    }
}

struct Time {
    var min : Int
    var sec : Int
    var hour : Int
}
