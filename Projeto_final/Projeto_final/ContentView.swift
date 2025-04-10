//
//  ContentView.swift
//  Projeto final
//
//  Created by Turma02-25 on 04/04/25.
//

import SwiftUI
import UIKit

struct ContentView: View {
    init() {
        UITabBar.appearance().unselectedItemTintColor = .gray
    }
    var body: some View {
        NavigationStack{
            TabView{
                    
                HomePage()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                OverallPage()
                    .tabItem {
                        Image(systemName: "chart.bar.xaxis.ascending")
                        Text("Overall")
                    }
                
                NewWorkoutPage()
                    .tabItem {
                        Image(systemName: "book.pages.fill")
                        Text("Training")
                        
                    }
                
                UserPage()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("User")
                    }
                
            }   
            
            
            .accentColor(.secondaryPreset)
            
            .onAppear(){
                UITabBar.appearance().backgroundColor = .navBar}
            
            
        }

    }
}

#Preview {
    ContentView()
}
