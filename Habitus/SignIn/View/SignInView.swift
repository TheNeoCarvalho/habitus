import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var email = ""
    @State var password = ""
    @State var action: Int? = 0
    
    var body: some View {
        
        NavigationView{
            ZStack {
                Color("darkPurple").ignoresSafeArea()
                Circle().scale(1.7).foregroundColor(Color("myPurple")).offset(x: -100)
                Circle().scale(1.4).foregroundColor(.white).offset(x: -40)
                
                VStack {
                    
                    VStack(alignment: .center) {
                        Image("habitus")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 120, maxHeight: 120)
                            .padding(.horizontal, 48)
                        Text("Login")
                            .foregroundColor(Color("myPurple"))
                            .font(.system(.title).bold())
                            .font(.custom("Avenir Black", size:  22))
                            .padding(.bottom, 8)
                    }
                    
                    userField
                    passField
                    enterButton
                    signUp
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 20)
                .navigationBarTitle("Login", displayMode: .inline)
                .navigationBarHidden(true)
            }
        }
    }
}

extension SignInView{
    
    var userField: some View {
        HStack{
            TextField("Usuário", text: $email)
                .frame(width: 280, height: 30)
                .disableAutocorrection(true)
                .padding(.all, 10)
                .border(Color(UIColor.separator))
        }
    }
    
    var passField: some View {
        HStack{
            SecureField("Senha", text: $password)
                .frame(width: 280, height: 30)
                .disableAutocorrection(true)
                .padding(.all, 10)
                .border(Color(UIColor.separator))
        }
    }
    
    var enterButton: some View {
        HStack{
            Button{}label: {
                Text("Entrar")
                    .frame(width: 300, height: 50)
                    .font(.custom("Avenir Black", size:  22))
                    .foregroundColor(.white)
                    .background(Color("myPurple"))
            }
            
            
        }
    }
    
    var signUp: some View {
        VStack {
            Text("Não possui cadastro?")
                .foregroundColor(.gray)
                .font(.custom("Avenir Book", size:  16))
                .padding(.top, 12)
            
            ZStack {
                NavigationLink(
                    destination: Text("Tela de cadastro"),
                    tag: 1,
                    selection: $action,
                    label: { EmptyView()})
                
                Button{
                    self.action = 1
                    print("action")
                }label: {
                    Text("cadastre-se")
                        .font(.custom("Avenir Book", size:  16))
                        .bold()
                        .foregroundColor(Color("myPurple"))
                }
            }
        }
    }
}

