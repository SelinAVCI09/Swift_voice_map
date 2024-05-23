
import SwiftUI

struct StartTab: View {

    var body: some View {
        TabView {
            Group {
                TripMapView()
                    .tabItem {
                    Label("Voice Map", systemImage: "map")
                }
               
            }
            .toolbarBackground(.appBlue.opacity(0.8), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}


#Preview {
    StartTab()
        .modelContainer(Destination.preview)
        .environment(LocationManager())
}
