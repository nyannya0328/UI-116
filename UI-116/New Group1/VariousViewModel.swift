//
//  VariousViewModel.swift
//  UI-116
//
//  Created by にゃんにゃん丸 on 2021/02/01.
//

import SwiftUI

class VariousViewModel: ObservableObject {
    
    @Published var selected = "Youre Cart"
    @Published var showDrawer = false
    @Published var selectedimage = "Google!"
    
    @Published var isdark = false
    
    @Published var with = UIScreen.main.bounds.width
    
    func getTime() -> String{
        
        let format = DateFormatter()
        format.dateFormat = "yyyy:HH:mm:ssa "
        format.dateStyle = .full
    //format.doesRelativeDateFormatting = true
//        format.calendar = Calendar.init(identifier: .japanese)
//        format.locale = Locale(identifier: "jp")
        return format.string(from: Date())
    
        
        
        
    }
    
    
   
   
}
