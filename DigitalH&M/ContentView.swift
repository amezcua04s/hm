//
//  ContentView.swift
//  MiPrimerApp
//
//  Created by Facultad de Contaduría y Administración on 16/06/25.
//


/*
 4B649C
 5B73AF
 D3E5FB
 919CAE
 757A8D
 */

import SwiftUI

struct ContentView: View {
        
        @State private var isLoggedIn = false
        
        var body: some View {
            
            if isLoggedIn {
                
                //MainTabView()
                
            } else {
                
            NavigationStack{
                
                ZStack{
                    LinearGradient(
                        gradient: Gradient( colors: [
                            .white,
                            .red
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .ignoresSafeArea()
                    
                    VStack{
                        Spacer()
                        VStack(spacing: 12) {
                          Image("img_logo")
                            .resizable()
                            .frame(width: 240, height: 200)


                          Text("Moda a tu alcance")
                            .font(.custom("MarkerFelt-Wide", size: 22))
                            .foregroundColor(.black.opacity(0.7))
                        }

                        Spacer()
                        
                        NavigationLink{
                            //LogInView(isLoggedIn : $isLoggedIn)
                        } label : {
                            Text("Iniciar sesión")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 200, height: 50)
                                .background(Color(hex: "C5071D") ?? .black)
                                .cornerRadius(10)
                        }.padding()
                        
                        NavigationLink{
                            //SignUpView(isLoggedIn : $isLoggedIn)
                        } label: {
                            Text("Registrarse")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .frame(width: 200, height: 50)
                                .background(Color(hex: "C5071D") ?? .black)
                                .cornerRadius(10)
                        }.padding()
                        Spacer()
                    }
                    
                }
    
            }
        }
    }
}

#Preview {
    ContentView()
}
