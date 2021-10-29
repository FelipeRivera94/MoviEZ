//
//  MoviesView.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 25/10/21.
//

import SwiftUI

// Movies scene
struct MoviesView: View {
    
    //Observed objects properties
    @ObservedObject private var moviesState = MovieListPublisher()
    //state properties
    @State private var selectedCategory: MoviesCategory = .popular
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(placeholder: NSLocalizedString("searchIn_string", comment:""), text: $text).onChange(of: text) { newValue in
                    self.moviesState.loadMovies(with: selectedCategory)
                }
                Picker("", selection: $selectedCategory) {
                    ForEach(MoviesCategory.allCases, id:\.self) {
                        Text(MoviesCategory.getTitleFor(title: $0))
                    }
                }.pickerStyle(SegmentedPickerStyle())
                    .padding()
                    .onChange(of: selectedCategory) { newValue in
                        self.moviesState.loadMovies(with: selectedCategory)
                    }
                Spacer()
                if self.moviesState.movies != nil {
                    MoviePosterCarouselView(title: MoviesCategory.getTitleFor(title: selectedCategory), movies: moviesState.movies!, text: $text)
                        .animation(.easeIn(duration: 0.5))
                } else {
                    LoadingView(isLoading: moviesState.isLoading, error: moviesState.error) {
                        self.moviesState.loadMovies(with: selectedCategory)
                    }
                }
                Spacer()
            }
            .navigationTitle("menu_title").font(.headline)
        }.onAppear {
            self.moviesState.loadMovies(with: selectedCategory)
        }.navigationBarTitle("")
            .navigationBarHidden(true)
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}

