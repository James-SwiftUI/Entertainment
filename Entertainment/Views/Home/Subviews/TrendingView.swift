import SwiftUI



struct TrendingView: View {
    
    let images: [Entertainment]
    
    @State private var opacityEffect: Bool = false
    @State private var clipEdges: Bool = false
    
    var body: some View {
        Section {
            ScrollView(.horizontal){
                LazyHStack(spacing: 0){
                    ForEach(images){ image in
                        Image(image.thumbnail)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(.rect(cornerRadius: 25))
                            .containerRelativeFrame(.horizontal)
                    }
                }
                .scrollTargetLayout()
                .overlay(alignment: .bottom){
                    //Kavsoft
                    PagingIndicator(activeTint: .white,
                                    inActiveTint: .black.opacity(0.25),
                                    clipEdges: clipEdges)
                }
            }
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
            
            .frame(height: 200)
            .safeAreaPadding(.vertical, 15)
        .safeAreaPadding(.horizontal, 25)
        }header: {
            HStack{
                Text("Trending")
                    .font(.system(size: 20, design: .monospaced).bold())
                Spacer()
            }
            .padding(.horizontal, 30)
            
        }
    }
}

#Preview {
    TrendingView(images: [])
       
}
