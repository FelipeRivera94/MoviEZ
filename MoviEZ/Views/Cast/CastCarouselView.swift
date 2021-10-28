//
//  CastCarouselView.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 27/10/21.
//

import SwiftUI

//Cast card carousel
struct CastCarouselView: View {
    //cast
    let cast:[Cast]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.cast.prefix(15)) { artist in
                        CastCardView(cast: artist)
                            .frame(width: 125, height: 200)
                            .padding(.leading, artist.id == self.cast.first!.id ? 16 : 0)
                            .padding(.trailing, artist.id == self.cast.last!.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

struct CastCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CastCarouselView(cast: Cast.testCasts)
    }
}
