import SwiftUI

struct EntertainmentView: View {
    var body: some View {
        NavigationStack {
            List{
                Text("Films")
                Text("Or")
                Text("TV Shows")
            }
            .navigationTitle("Entertainment")
        }
    }
}

#Preview {
    EntertainmentView()
}
