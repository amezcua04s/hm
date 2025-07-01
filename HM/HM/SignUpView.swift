//  SignUpView.swift
//  HM
//
//  Created by Facultad de Contaduría y Administración on 01/07/25.
//

import SwiftUI

struct SignUpView: View {
    @Binding var isLoggedIn: Bool
    @State private var nombre     = ""
    @State private var email      = ""
    @State private var contrasena = ""
    @State private var ubicacion  = "CDMX"

    private let opcionesUbicacion = ["CDMX", "Yucatán", "Monterrey", "Veracruz", "Sinaloa"]

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.white, Color(hex: "DA071F") ?? .gray]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 20) {
                    Spacer()
                    // Logo
                    Image("img_logo")
                        .resizable()
                        .frame(width: 160, height: 128)

                    Divider()
                        .background(Color(hex: "3D0000") ?? .orange)
                        .padding(.vertical, 8)

                    // Título
                    Text("Registrarse")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    // Formulario
                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Nombre completo")
                                .foregroundColor(.white)
                            TextField("Nombre y apellido", text: $nombre)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Correo electrónico")
                                .foregroundColor(.white)
                            TextField("usuario@ejemplo.com", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Contraseña")
                                .foregroundColor(.white)
                            SecureField("••••••••", text: $contrasena)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Ubicación")
                                .foregroundColor(.white)
                            Picker("Selecciona tu ubicación", selection: $ubicacion) {
                                ForEach(opcionesUbicacion, id: \.self) { lugar in
                                    Text(lugar)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 5)
                            .background(Color.white)
                            .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal, 60)
                    .padding(.top, 20)

                    // Botón Continuar
                    Button(action: {
                        // Validaciones o llamada a API
                        isLoggedIn = true
                    }) {
                        Text("Continuar")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 50)
                            .background(Color(hex: "DA071F") ?? .black)
                            .cornerRadius(10)
                    }
                    .padding(.top, 30)

                    Spacer()

                    // Enlace a Iniciar sesión
                    HStack(spacing: 4) {
                        Text("¿Ya tienes una cuenta?")
                            .foregroundColor(.white)
                        NavigationLink("Iniciar sesión", destination: LogInView(isLoggedIn: $isLoggedIn))
                            .foregroundColor(Color(hex: "3D0000"))
                            .bold()
                    }
                    .padding(.bottom, 30)
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    struct Container: View {
        @State var logged = false
        var body: some View {
            SignUpView(isLoggedIn: $logged)
        }
    }
    static var previews: some View {
        Container()
    }
}
