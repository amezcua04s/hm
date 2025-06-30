//
//  LogInView.swift
//  DigitalH&M
//
//  Created by Facultad de Contaduría y Administración on 30/06/25.
//
//FB8996

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                configuration.label
            }
        })
        .foregroundColor(.black)
    }
}

struct LogInView: View {
    
    @Binding var isLoggedIn : Bool
    
    @State private var usuario = ""
    @State private var contrasena = ""
    @State private var recuerdame = false
    
    
    var body: some View {
        NavigationStack{
            
            ZStack{
                
                LinearGradient(
                    gradient: Gradient(colors: [.white,
                                                Color(hex: "F83A50") ?? .gray ]),
                    
                    startPoint: .top,
                    endPoint: .bottom
                ).ignoresSafeArea()
                
                VStack{
                    VStack{
                        Text("Cafetería")
                            .font(.custom("SnellRoundhand-Bold", size: 40))
                        
                        Text("Pasteles y café recién hecho")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Image("ic_cafe")
                            .resizable()
                            .frame(width: 128, height: 128)
                        
                    }.padding(.vertical, 3)
                    
                    HStack{
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color(hex: "3D0000" ) ?? .orange)
                    }.padding(.horizontal)
                    
                    Text("Iniciar sesión")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 15)
                    
                    Group{
                        VStack{
                            VStack{
                                Text("Ingrese su email:")
                                    .foregroundColor(.white)
                                TextField("Usuario", text: $usuario)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                            VStack{
                                Text("Ingrese su contraseña:")
                                    .foregroundColor(.white)
                                SecureField("Contraseña", text: $contrasena)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                            }
                            
                            
                        }
                    }
                    .padding(.horizontal, 60)
                    
                    HStack{
                        Toggle(isOn: $recuerdame) {
                            Text("Recuérdame")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        .toggleStyle(iOSCheckboxToggleStyle())
                        
                        Button(action: {
                            
                        }) {
                            Text("¿Olvidaste tu contraseña?")
                                .font(.footnote)
                                .foregroundColor(Color(hex: "3D0000"))
                                .fontWeight(.bold)
                        }.padding(.vertical)
                        
                    }
                    .padding(.horizontal,20)
                    
                    Button(action: {
                        isLoggedIn = true
                    }) {
                        Text("Continuar")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200, height: 50)
                            .background(Color(hex: "D0712D") ?? .black)
                            .cornerRadius(10)
                    }.padding(.vertical,15)
                        .fullScreenCover(isPresented: $isLoggedIn){
                            HomeView()
                        }
                    
                    VStack{
                        
                        HStack{
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color(hex: "3D0000" ) ?? .orange)
                            
                            Text("Inicia sesión con:")
                                .font(.footnote)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color(hex: "3D0000" ) ?? .orange)
                        }.padding(.horizontal,10)
                        
                        
                        HStack{
                            
                            HStack{
                                Button(action:{
                                    
                                }){
                                    Image("ic_facebook")
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                }
                                Text("Facebook")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(hex: "6F5D4F"))
                                    .padding(.vertical,1)
                                
                            }.padding(.horizontal, 12)
                                .background(Color(hex: "F7EFDA"))
                                .cornerRadius(24)
                            
                            
                            HStack{
                                
                                Button(action:{
                                    
                                }){
                                    Image("ic_google")
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                    
                                }
                                Text("Google")
                                    .font(.footnote)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(hex: "6F5D4F"))
                                    .padding(.vertical,1)
                                
                            }.padding(.horizontal, 12)
                                .background(Color(hex: "F7EFDA"))
                                .cornerRadius(24)
                            
                        }
                        
                        HStack{
                            
                            Text("¿No tienes una cuenta?")
                                .foregroundColor(.white)
                            NavigationLink(destination: SignUpView(
                                //isLoggedIn: $isLoggedIn
                            ),
                                
                                label: {
                                Text("Registrarse")
                                    .foregroundColor(Color(hex: "3D0000"))
                                    .bold()
                                    .padding()
                                
                            })
                            .padding()
        
                        }
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    LogInView(isLoggedIn: .constant(false))
}
