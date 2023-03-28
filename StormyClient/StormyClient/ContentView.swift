//
 
import SwiftUI

struct ContentView: View {
    @State private var showOnboarding = true;
    init() {
       UIPageControl.appearance().currentPageIndicatorTintColor = UIColor(Color("PrimaryColor"))
       UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
       }
    
    var body: some View {
        NavigationView(){
            VStack{
                Text("Hello world")
            }
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

