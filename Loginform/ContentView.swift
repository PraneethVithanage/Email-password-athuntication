//
//  ContentView.swift
//  Loginform
//
//  Created by praneeth vithanage on 7/26/20.
//  Copyright © 2020 praneeth vithanage. All rights reserved.
//

import SwiftUI
import FirebaseAuth
import Firebase

struct ContentView: View {
    var body: some View {
        FirstPage()
    }
}



struct FirstPage : View{
    @State var email = ""
    @State var pass =  ""
    @State var shown =  false
    @State var msg =  ""
    
    var body : some View {
        
        VStack(spacing: 20) {
            Image("logo").resizable().frame(width :150 ,height:150)
            Text("Verify your account").font(.largeTitle).fontWeight(.heavy).foregroundColor(.gray)
            Text("Plase Enter Your password and Email").font(.body).foregroundColor(.gray)
            
            TextField("Email",text:$email).padding().background(Color("Color")).clipShape(RoundedRectangle(cornerRadius:10))
            
            TextField("Password",text:$pass).padding().background(Color("Color")).clipShape(RoundedRectangle(cornerRadius:10))
            
    
              VStack (spacing: 10){
            Button(action :{
                Auth.auth().signIn(withEmail:self.email, password: self.pass){(res,err) in
                    if err != nil{
                        print((err!.localizedDescription))
                        self.msg = err!.localizedDescription
                        self.shown.toggle()
                        return
                        
                    }
                    self.msg = "You have login sucessfully"
                    self.shown.toggle()
                }
            
            }){
            
            Text("Login").frame(width:UIScreen.main.bounds.width - 30, height: 50)
            
            }.foregroundColor(.white)
             .background(Color.green)
             .cornerRadius(10)
                
            Button(action :{
                Auth.auth().createUser(withEmail:self.email, password: self.pass){(res,err) in
                        if err != nil{
                            print((err!.localizedDescription))
                            self.msg = err!.localizedDescription
                            self.shown.toggle()
                            return
                            
                        }
                        self.msg = "You have regiserd sucessfully"
                        self.shown.toggle()
                    }
                
                }){
                
                Text("Register").frame(width:UIScreen.main.bounds.width - 30, height: 50)
                
                }.foregroundColor(.white)
                 .background(Color.green)
                 .cornerRadius(10)
                
                
              }.alert(isPresented:$shown){
                return Alert(title:Text(self.msg))
            }
            
    
        }.background(
           Image("background")
            .resizable()
            .edgesIgnoringSafeArea(.all)
            .frame(width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height )
        )
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
