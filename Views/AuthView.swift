import SwiftUI

struct AuthView: View {
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isLoginMode = true
    @State private var isAuthenticated = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text(isLoginMode ? "Login" : "Create Account")
                .font(.largeTitle)
                .bold()
            
            if !isLoginMode {
                TextField("Name", text: $name)
                    .textFieldStyle(.roundedBorder)
            }
            
            TextField("Email", text: $email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
            
            SecureField("Password", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button(isLoginMode ? "Login" : "Register") {
                if isLoginMode {
                    FirebaseService.shared.login(email: email, password: password) { success in
                        isAuthenticated = success
                    }
                } else {
                    FirebaseService.shared.register(name: name, email: email, password: password) { success in
                        isAuthenticated = success
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
            
            Button(isLoginMode ? "Need an account? Register" : "Already have an account? Login") {
                isLoginMode.toggle()
            }
            
            NavigationLink("", destination: DashboardView(), isActive: $isAuthenticated)
        }
        .padding()
    }
}