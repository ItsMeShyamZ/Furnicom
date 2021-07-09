//
//  LoginView.swift
//  ChairOrdering
//
//  Created by Shyamala's MacBook Pro on 08/07/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var email : String = ""
    @State var password : String = ""
    @State private var isToggle : Bool = false
    
    var body: some View {
        GeometryReader{ geo in
            VStack(spacing:0){
                VStack(alignment : .leading){
                    
                HStack{
                    VStack(alignment : .leading,spacing : 5){
                        Text("Welcome back!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                           
                        
                        Text("Log back into your account")
                            .font(.callout)
                            .foregroundColor(.gray)
                        
                    }
                    
                    Spacer()
                   
                    Button(action: {
                        print("Signup")
                    }, label: {
                        Text("Signup")
                            .foregroundColor(.black)
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(30)
                    })
                    .background(Color(Colors.primary.rawValue))
                    .scaledToFill()
                    .clipShape(Capsule())
                    .frame(height: 38, alignment: .leading)
                    .clipShape(Capsule())
                    .offset(x:10)
                }.padding(.top,20)
                .padding(.leading,15)
                    
                    VStack(spacing : 20){
                        TextField("Your Email", text: $email)
                            .padding(12)
                            .foregroundColor(.black)
                            .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.black, lineWidth: 1)
                                    )
                            
                        TextField("Password", text: $password)
                            .padding(12)
                            .foregroundColor(.black)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(Color.black,lineWidth: 1)
                                )
                        
                        HStack(alignment: .firstTextBaseline, spacing: 10){
                            HStack{
                                Toggle("Remember", isOn: $isToggle)
                                    .toggleStyle(CheckToggleStyle())
                                    .padding(.leading,5)
                            }
                            Spacer()
                            Button(action: {
                                
                            }, label: {
                                Text("Forgot ?")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.trailing,10)
                                    
                            })
                        }.padding(.top,-3)
                        GeometryReader{ geobtn in
                        Button(action: {
                            print("Login")
                        }, label: {
                            Text("Log In")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding(10)
                                .foregroundColor(.black)
                                .frame(width: geobtn.size.width,height: 45, alignment: .center)
                                .background(Color(Colors.primary.rawValue))
                            
                        })
                        .clipShape(Capsule())
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black,lineWidth: 1)
                        )
                        
                        } .padding(.top,30)
                    }.padding(.all,30)
                    .padding(.top,10)
                    
                
                    Spacer()
                    
                }.frame(width: geo.size.width, height: geo.size.height/1.8)
            
            Image("teapoy")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: geo.size.width, height: geo.size.height/2.2)
                .offset(y:-10)
            
        }
        
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CheckToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            Label {
                configuration.label
            } icon: {
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(configuration.isOn ? Color(Colors.primary.rawValue) : .secondary)
                    .accessibility(label: Text(configuration.isOn ? "Checked" : "Unchecked"))
                    .imageScale(.large)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
