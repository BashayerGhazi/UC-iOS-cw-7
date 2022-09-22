//
//  ContentView.swift
//  major
//
//  Created by Shahad on 22/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var tap: Bool = true
    @State var majors = ["Computer Engineering","Computer Science ","other"]
 
    @State var ma = ""
    var body: some View {
        VStack {
            Spacer()
            HStack{
                
                Text("choose your major!").font(.largeTitle).padding()
                Image(systemName: tap ? "plus.circle" : "minus.circle").resizable().frame(width: 40, height: 40).foregroundColor(tap == true ? .green: .red).onTapGesture {
                    withAnimation(.easeIn(duration: 0.8)){
                        tap.toggle()
                    }
                }
                
            }
            Spacer()
            if tap == false {
                ForEach(majors, id: \.self ) { major in
                    Text(major).font(.system(size: 24)) .padding().frame(width: 300, height: 50).background( ma == major ? .red: .blue).cornerRadius(10).onTapGesture {
                         ma = major
                        
                        
                    }
                    
                    
                }
                Spacer()
                Text("Your major is :").font(.largeTitle)
                Text(" \(ma)").font(.largeTitle)
                Spacer()
               
            }
            
            Spacer()
            
                
                }
        .padding()
            }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
