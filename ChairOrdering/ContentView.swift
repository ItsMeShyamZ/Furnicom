//
//  ContentView.swift
//  ChairOrdering
//
//  Created by Shyamala's MacBook Pro on 08/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashView (imageSize: CGSize(width: 130, height: 130)){
            
            LoginView()
            
            
        } title: {
            
            Text("FURNICOM")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                
            
        } logo: {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                
                .clipShape(Circle())
                .shadow(color: .gray, radius: 10, x: 2, y: 2)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
