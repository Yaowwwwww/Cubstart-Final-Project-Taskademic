import SwiftUI

struct ContentView: View {
    var body: some View {
        LandingPageView().environmentObject(TaskManager())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LandingPageView().environmentObject(TaskManager())
    }
}
