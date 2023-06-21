import SwiftUI

struct SplashView: View {
    
    @ObservedObject var viewModel: SplashViewModel
    
    var body: some View {
        Group {
            switch viewModel.uiState {
                    case .loading:
                        LoadingView()
                    case .goToSignInScreen:
                        viewModel.signInView()
                    case .goToHomeScreen:
                        Text("Home")
                    case .error(let msg):
                        LoadingView(error: msg)
                }
        }.onAppear(perform: {
            viewModel.onAppear()
        })
    }
}

extension SplashView {
    func LoadingView(error: String? = nil) -> some View {
        GeometryReader { view in
            ZStack {
                Image("habitus")
                    .resizable()
                    .frame(maxWidth: 120, maxHeight: 120, alignment: .center)
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: view.size.width, height: view.size.height)
            .background(Color("myPurple"))
            
            if let error = error {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("Habitus"), message: Text(error), dismissButton: .default(Text("OK")){
                            //Ação aqui
                        })
                    }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = SplashViewModel()
        SplashView(viewModel: viewModel)
    }
}
