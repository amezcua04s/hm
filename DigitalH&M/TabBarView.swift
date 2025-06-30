//
//  TabBarView.swift
//  DigitalH&M
//
//  Created by Facultad de Contaduría y Administración on 30/06/25.
//

import SwiftUI

struct TabBarView: View {
    
    @State private var selectedTab = 2
    
    init () {
        UITabBar.appearance().barTintColor = .systemBackground
        UITabBar.appearance().backgroundColor = UIColor(Color(hex: "F5CC8F") ?? .black)
    }
    
    var body: some View {
        
        TabView(selection : $selectedTab) {
            
            HomeView().tabItem {
                Image(systemName: "house")
            }
            
            SearchView().tabItem {
                Image(systemName: "magnifyingglass")
            }
            
            MapView().tabItem {
                Image(systemName:"map")
            }
            
            CartView().tabItem {
                Image(systemName: "bag")
            }
            
            ProfileView().tabItem {
                Image(systemName: "person")
            }
        }
        .accentColor(.white)
    
    }
    
}
