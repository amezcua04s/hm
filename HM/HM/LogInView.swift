//  LogInView.swift
//  HM
//
//  Created by Facultad de Contaduría y Administración on 30/06/25.
//

import SwiftUI

// Estilo de checkbox personalizado
struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: { configuration.isOn.toggle() }) {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        }
        .foregroundColor(.black)
    }
}

struct LogInView: View {
    @Binding var isLoggedIn: Bool
    @State private var usuario    = ""
    @State private var contrasena  = ""
    @State private var recuerdame  = false

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.white, Color(hex: "DA071F") ?? .gray]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack {
                    Spacer()
                    // Logo
                    Image("img_logo")
                        .resizable()
                        .frame(width: 160, height: 128)

                    Divider()
                        .background(Color(hex: "3D0000") ?? .orange)
                        .padding(.vertical, 8)

                    // Título
                    Text("Iniciar sesión")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    // Campos
                    VStack(spacing: 16) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Correo electrónico")
                                .foregroundColor(.white)
                            TextField("usuario@ejemplo.com", text: $usuario)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Contraseña")
                                .foregroundColor(.white)
                            SecureField("••••••••", text: $contrasena)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                    }
                    .padding(.horizontal, 60)
                    .padding(.top, 20)

                    // Recordar y olvidar
                    HStack {
                        Toggle(isOn: $recuerdame) {
                            Text("Recuérdame")
                                .font(.footnote)
                                .foregroundColor(.white)
                        }
                        .toggleStyle(iOSCheckboxToggleStyle())

                        Spacer()

                        Button("¿Olvidaste tu contraseña?") {
                            // Acción de recuperación
                        }
                        .font(.footnote)
                        .foregroundColor(Color(hex: "3D0000"))
                        .bold()
                    }
                    .padding(.horizontal, 60)
                    .padding(.top, 10)

                    // Botón Continuar
                    Button(action: {
                        // Aquí podrías validar los campos o llamar a tu API
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

                    // Enlace a Registro
                    HStack(spacing: 4) {
                        Text("¿No tienes una cuenta?")
                            .foregroundColor(.white)
                        NavigationLink("Registrarse", destination: SignUpView(isLoggedIn: $isLoggedIn))
                            .foregroundColor(Color(hex: "3D0000"))
                            .bold()
                    }
                    .padding(.bottom, 30)
                }
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    struct Container: View {
        @State var logged = false
        var body: some View {
            LogInView(isLoggedIn: $logged)
        }
    }
    static var previews: some View {
        Container()
    }
}
