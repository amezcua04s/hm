
 /*
 import SwiftUI

 struct ContentView: View {
     @State private var isLoggedIn = false

     var body: some View {
         Group {
             if isLoggedIn {

                 TabBarView()
             } else {
                 // Si no está logueado, arranca en LogInView
                 LogInView(isLoggedIn: $isLoggedIn)
             }
         }
     }
 }

 struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         ContentView()
     }
 }
 */
 import SwiftUI
 
 struct ContentView: View {
 @State private var isLoggedIn = false
 
 var body: some View {
 Group {
 if isLoggedIn {
 TabBarView()
 } else {
 NavigationStack {
 ZStack {
 LinearGradient(
 gradient: Gradient(colors: [.white, .red]),
 startPoint: .top,
 endPoint: .bottom
 )
 .ignoresSafeArea()
 
 VStack {
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
 
 NavigationLink {
 LogInView(isLoggedIn: $isLoggedIn)
 } label: {
 Text("Iniciar sesión")
 .fontWeight(.bold)
 .foregroundColor(.white)
 .padding()
 .frame(width: 200, height: 50)
 .background(Color(hex: "C5071D") ?? .black)
 .cornerRadius(10)
 }
 .padding()
 
 NavigationLink {
 SignUpView(isLoggedIn: $isLoggedIn)
 } label: {
 Text("Registrarse")
 .fontWeight(.bold)
 .foregroundColor(.white)
 .padding()
 .frame(width: 200, height: 50)
 .background(Color(hex: "C5071D") ?? .black)
 .cornerRadius(10)
 }
 .padding()
 
 Spacer()
 }
 }
 }
 }
 }
 }
 }
 
 struct ContentView_Previews: PreviewProvider {
 static var previews: some View {
 ContentView()
 }
 }
 
