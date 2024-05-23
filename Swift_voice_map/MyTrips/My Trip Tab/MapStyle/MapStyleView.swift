


import SwiftUI

struct MapStyleView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var mapStyleConfig: MapStyleConfig
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                LabeledContent(" Stil") {
                    Picker("Base Style", selection: $mapStyleConfig.baseStyle) {
                        ForEach(MapStyleConfig.BaseMapStyle.allCases, id: \.self) { type in
                            Text(type.label)
                        }
                    }
                }
                LabeledContent("Yükseltici") {
                    Picker("Elevation", selection: $mapStyleConfig.elevation) {
                        Text("Düz").tag(MapStyleConfig.MapElevation.flat)
                        Text("Gerçekçi").tag(MapStyleConfig.MapElevation.realistic)
                    }
                }
                if mapStyleConfig.baseStyle != .imagery {
                    LabeledContent("İlgi Çekici Noktalar") {
                        Picker("Points of Interest", selection: $mapStyleConfig.pointsOfInterest) {
                            Text(" Gösterme").tag(MapStyleConfig.MapPOI.excludingAll)
                            Text("Göster").tag(MapStyleConfig.MapPOI.all)
                        }
                    }
                    Toggle("Trafiği Göster", isOn: $mapStyleConfig.showTraffic)
                }
                Button("Tamam") {
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
            }
            .padding()
            .navigationTitle("Map Stili")
            .navigationBarTitleDisplayMode(.inline)
            Spacer()
        }
    }
}


#Preview {
    MapStyleView(mapStyleConfig: .constant(MapStyleConfig.init()))
}
