import SwiftUI

// NOTE! Package is a separate module. All elements are internal by default. To make package's content avaiable - need to set it as public !
public struct CTRating2: View {
    var maxRating: Int
    @Binding var currentRating: Int
    var width: Int
    var color: UIColor
    var openSFSymbol:String = "star"
    var fillSFSymbol:String = "star.fill"
    
    // to make init available in other modules - where package is imported, it need to be public
    /// Only two required parameters are maxRating and the bidning to currentRating
    /// - Parameters:
    ///   - maxRating: max rating on the scale
    ///   - currentRating: binding to current rating variable
    ///   - width: width of the image used
    ///   - color: color of the image 
    public init(maxRating: Int, currentRating: Binding<Int>,
                width: Int = 20, color: UIColor = .systemYellow) {
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.color = color
    }
    public var body: some View {
        HStack {
            ForEach(0..<maxRating) { rating in
                Image(systemName: rating < self.currentRating ? self.fillSFSymbol : self.openSFSymbol)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(self.color))
                    .onTapGesture {
                        self.currentRating = rating+1
                }
            }
        }.frame(width: CGFloat(maxRating * width))
    }
}


struct CTRating_Previews: PreviewProvider {
    static var previews: some View {
            CTRating2(maxRating: 5, currentRating: .constant(3))
                .environment(\.colorScheme, .light)
                .previewLayout(.sizeThatFits)
                .padding(10)
    }
}
