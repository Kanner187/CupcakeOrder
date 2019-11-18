//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Levit Kanner on 18/11/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var username = ""
    @State var password = ""
    var disableForm: Bool {
        username.isEmpty || password.isEmpty
    }
    
    var body: some View {
        Form{
            Section(header: Text("Username")){
                TextField("Enter username", text: $username)
            }
            Section(header: Text("Password")){
                TextField("Enter password", text: $password)
            }
            Section{
                Button(action:{
                    print("Creating Account....")
                }){
                    Text("Create Account")
                }
            }
            .disabled(self.disableForm)
        }
        
    }
    
 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
