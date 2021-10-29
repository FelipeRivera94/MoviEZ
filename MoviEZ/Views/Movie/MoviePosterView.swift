//
//  MoviePosterView.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import Foundation

import SwiftUI

struct MoviePosterView: View {
    //movie
    let movie: Movie
    // Observed property for image loader
    @ObservedObject var imageLoader = ImageLoader()
    var body: some View {
        ZStack {
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(30)
                    .shadow(radius: 4)
            } else {
                Rectangle()
                    .fill(Color.clear)
                    .cornerRadius(30)
                    .shadow(radius: 4)
            }
        }
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.posterURL)
        }
    }
}

struct MoviePosterCard_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterView(movie: Movie.testMovie)
    }
}
