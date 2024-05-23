


import SwiftUI

struct LocationDeniedView: View {
    var body: some View {
        ContentUnavailableView(label: {
            Label("Konum Bilgilendirme", image: "launchScreen")
        },
                               description: {
            Text("""
1. Aşağıdaki düğmeye dokunun ve "Gizlilik ve Güvenlik"e gidin.
2. "Konum Servisleri"ne dokunun.
3. "MyTrips" uygulamasını bulun ve üzerine dokunun.
4. Ayarı "Uygulamayı Kullanırken" olarak değiştirin.
""")
            .multilineTextAlignment(.leading)
        },
                               actions: {
            Button(action: {
                UIApplication.shared.open(
                    URL(string: UIApplication.openSettingsURLString)!,
                    options: [:],
                    completionHandler: nil
                )
            }) {
                Text("Ayarları Açın")
            }
            .buttonStyle(.borderedProminent)
        })
    }
}

#Preview {
    LocationDeniedView()
}
