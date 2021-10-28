//
//  CastCardView.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 27/10/21.
//

import SwiftUI

// Cast card view
struct CastCardView: View {
    // cast
    let cast: Cast
    // Observed property for image loader
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                        .resizable()
                }
            }.frame(width: 100, height: 160)
                .scaledToFill()
                .cornerRadius(30)
            let asString = NSLocalizedString("cast_as", comment: "")
            Text("\(cast.name) \(asString)")
                .scaledToFit()
                .minimumScaleFactor(0.5)
            Text("\(cast.character)").fontWeight(.bold)
                .scaledToFit()
                .minimumScaleFactor(0.5)
        }.lineLimit(1)
        .onAppear {
            self.imageLoader.loadImage(with: self.cast.profileURL)
        }
    }
}
struct CastCardView_Previews: PreviewProvider {
    static var previews: some View {
        CastCardView(cast: Cast.testCast)
    }
}
