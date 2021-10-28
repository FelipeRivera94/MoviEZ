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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(NSLocalizedString(title, comment: ""))
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16){
                    ForEach(self.movies) { movie in
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

struct MoviePosterCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCarouselView(title: "test", movies:Movie.testMovies)
    }
}
