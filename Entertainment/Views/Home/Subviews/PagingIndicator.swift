import SwiftUI

//From Kav Soft

struct PagingIndicator: View {
    
    var activeTint: Color = .primary
    var inActiveTint: Color = .primary.opacity(0.15)
    //var opacityEffect: Bool = false
    var clipEdges: Bool = false
    var body: some View {
        GeometryReader{
            
            let width = $0.size.width
            if let scrollViewWidth = $0.bounds(of: .scrollView(axis: .horizontal))?.width,
               scrollViewWidth > 0{
                
                let minX = $0.frame(in: .scrollView(axis: .horizontal)).minX
                let totalPages = Int(width / scrollViewWidth)
                
                let freeProgress = -minX / scrollViewWidth
                let clippedProgress = min(max(freeProgress, 0.0), CGFloat(totalPages - 1))
                
                let progress = clipEdges ? clippedProgress : freeProgress
                
                let activeIndex = Int(progress)
                let nextIndex = Int(progress.rounded(.awayFromZero))
                
                let indicatorProgress = progress - CGFloat(activeIndex)
                
                let currentPageWidth = 18 - (indicatorProgress * 18)
                let nextPageWidth = indicatorProgress * 18
                
                HStack(spacing: 10){
                    ForEach(0..<totalPages, id: \.self){ index in
                        Circle()
                            .fill(inActiveTint)
                            .frame(width: 8 + (activeIndex == index ? currentPageWidth : nextIndex == index ? nextPageWidth : 0), height: 8)
                            .overlay{
                                ZStack{
                                    Capsule()
                                        .fill(activeTint)
                                    
                                }
                            }
                    }
                    
                }
                .frame(width: scrollViewWidth)
                .offset(x: -minX)
            }
        }
        .frame(height: 30)
    }
}

#Preview {
    
    let preview = PreviewContainerEntertainment()
    preview.addExamples(Entertainment.examples)
    
    return TrendingView(images: Entertainment.examples)
        .modelContainer(preview.container)
        .previewLayout(.sizeThatFits)
        
}
