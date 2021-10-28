//
//  MovieDetailsView.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import Foundation

import SwiftUI
//Movie Details view
struct MovieDetailsView: View {
    //movie id
    let movieId: Int
    //observed property
    @ObservedObject private var movieDetailState = MovieDetailsPublisher()
    
    var body: some View {
        ZStack {
            LoadingView(isLoading: movieDetailState.isLoading, error: movieDetailState.error) {
                self.movieDetailState.loadMovie(id: self.movieId)
            }
            if movieDetailState.movie != nil && movieDetailState.credits != nil && movieDetailState.trailers != nil {
                movieDetailListView(movie: self.movieDetailState.movie!, credits: self.movieDetailState.credits!, trailers: movieDetailState.trailers!)
            }
        }
        .navigationBarTitle("")
        .onAppear {
            self.movieDetailState.loadDetails(movieId: movieId)
        }
    }
}
//Movie details list
struct movieDetailListView: View {
    //movie
    let movie: Movie
    //Credits
    let credits: CreditsResponse
    //Trailers
    let trailers: VideoResponse
    @State private var selectedTrailer: Video?
    var body: some View {
        List {
            Text(movie.title)
                .fontWeight(.bold)
                .scaledToFill()
                .minimumScaleFactor(0.5)
                .lineLimit(1)
            MovieDetailImage(imageURL: self.movie.backdropURL)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            HStack {
                Text(movie.yearText)
                Text("•")
                Text(movie.durationText)
            }
            Text(movie.overview)
            HStack {
                if !movie.ratingText.isEmpty {
                    Text(movie.ratingText)
                }
                Text(movie.scoreText)
            }
            VStack(alignment: .leading, spacing: 4) {
                if credits.crew.count > 0 {
                    VStack(alignment: .leading, spacing: 4) {
                        if credits.directors != nil && credits.directors!.count > 0 {
                            Text("directors_string").font(.headline)
                            ForEach(self.credits.directors!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                        if credits.producers != nil && credits.producers!.count > 0 {
                            Text("producers_string").font(.headline)
                                .padding(.top)
                            ForEach(self.credits.producers!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                        if credits.screenWriters != nil && credits.screenWriters!.count > 0 {
                            Text("writers_string").font(.headline)
                                .padding(.top)
                            ForEach(self.credits.screenWriters!.prefix(2)) { crew in
                                Text(crew.name)
                            }
                        }
                    } .frame(minWidth: 0,  maxWidth: .infinity, alignment: .leading)
                }
                Spacer()
                if credits.cast.count > 0 {
                    Text("cast_string").fontWeight(.bold)
                        .font(.headline)
                    CastCarouselView(cast: self.credits.cast)               }
            }
            if trailers.youtubeTrailers != nil && trailers.youtubeTrailers!.count > 0 {
                Text("Trailers").font(.headline)
                ForEach(trailers.youtubeTrailers!) { trailer in
                    Button (action: {
                        self.selectedTrailer = trailer
                    }) {
                        HStack {
                            Text(trailer.name)
                            Spacer()
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(Color(UIColor.red))
                        }
                    }
                }
            }
        }
        .sheet(item: self.$selectedTrailer) { trailer in
            SafariView(url: trailer.youtubeURL!)
        }
    }
}

struct MovieDetailImage: View {
    
    @ObservedObject private var imageLoader = ImageLoader()
    let imageURL: URL
    
    var body: some View {
        ZStack {
            Rectangle().fill(Color.gray.opacity(0.3))
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
            }
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear {
            self.imageLoader.loadImage(with: self.imageURL)
        }
    }
}
struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailsView(movieId: Movie.testMovie.id)
        }
    }
}
