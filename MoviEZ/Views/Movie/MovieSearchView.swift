//
//  SearchView.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import SwiftUI
//Movie search view
struct MovieSearchView: View {
    //Observed Property
    @ObservedObject var movieSearchState = MovieSearchPublisher()
    
    var body: some View {
        NavigationView {
            List {
                SearchBarView(placeholder:NSLocalizedString("search_placeholder", comment:""), text: self.$movieSearchState.query)
                    .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                
                LoadingView(isLoading: self.movieSearchState.isLoading, error: self.movieSearchState.error) {
                    self.movieSearchState.search(query: self.movieSearchState.query)
                }
                
                if self.movieSearchState.movies != nil {
                    ForEach(self.movieSearchState.movies!) { movie in
                        NavigationLink(destination: MovieDetailsView(movieId: movie.id)) {
                            VStack(alignment: .leading) {
                                Text(movie.title)
                                Text(movie.yearText)
                            }
                        }
                    }
                }
                
            }
            .onAppear {
                self.movieSearchState.startObserve()
            }
            .navigationBarTitle("search_string")
        }
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}

