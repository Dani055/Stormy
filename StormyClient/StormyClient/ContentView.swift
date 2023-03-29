
import SwiftUI

struct ContentView: View {
    @State private var showOnboarding = false;

    
    var body: some View {
        NavigationView(){
            NavBar()
        }.fullScreenCover(isPresented: $showOnboarding) {
            OnboardingView(showOnboarding: $showOnboarding)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

