//
//  SplashView.swift
//  ChairOrdering
//
//  Created by Shyamala's MacBook Pro on 08/07/21.
//

import SwiftUI

struct SplashView<Content: View,Title : View , Logo : View>: View {
    
    var content : Content
    var title : Title
    var logo : Logo
    var imageSize : CGSize
    
    //Animation Property
    @State var textAnimation = false
    @State var imageAnimation = false
    @State var endanimation = false
    
    @Namespace var animation
    
    init(imageSize : CGSize,@ViewBuilder content : @escaping () -> Content,@ViewBuilder title : @escaping () -> Title,@ViewBuilder logo : @escaping () -> Logo){
        self.content = content()
        self.title  = title()
        self.logo = logo()
        self.imageSize = imageSize
    }
    
    var body: some View {
        VStack(spacing:0){
            ZStack(){
                Color(Colors.primary.rawValue)
                    .background(Color(Colors.primary.rawValue))
               
                title
                    .offset(y: self.textAnimation ? 0 : 120)
                    .offset(y : self.endanimation ? 20 : 0)
                    
                
                if !endanimation{
                    logo
                        .matchedGeometryEffect(id: "LOGO", in: animation)
                        .frame(width: self.imageSize.width, height: self.imageSize.height)
                    
                }
                
                HStack{
                    
                    Spacer()
                    
                    if endanimation{
                        logo
                            .matchedGeometryEffect(id: "LOGO", in: animation)
                            .frame(width: 50, height: 50)
                            .offset(y:20)
                            .padding(.trailing)
                    }
                }
                
            }
            .frame( height: endanimation ? 110 : nil,alignment: .bottom)
            .zIndex(1)
            
            
            content
                .padding(.top,30)
                .frame(height: endanimation ? nil : 0)
                .zIndex(0)
        }
        .frame(maxHeight : .infinity,alignment: .top)
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now()+0.8) {
                withAnimation(.spring()) {
                    self.textAnimation.toggle()
                    
                }
                withAnimation(Animation.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)) {
                    self.endanimation.toggle()
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
