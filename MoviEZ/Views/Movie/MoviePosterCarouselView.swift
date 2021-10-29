//
//  PosterCarouselView.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import SwiftUI
//Movie Poster carousel view
struct MoviePosterCarouselView: View {
    //title
    let title: String
    //movie
    let movies: [Movie]
    // filter
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(NSLocalizedString(title, comment: ""))
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16){
                    ForEach(self.movies.filter({ movie in
                        self.text.isEmpty ? true : movie.title.contains(text)
                    })) { movie in
                        NavigationLink(destination: MovieDetailsView(movieId: movie.id)) {
                            MoviePosterView(movie: movie)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                        .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                }
            }
        }
    }
}


