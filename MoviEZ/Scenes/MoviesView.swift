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
    @State private var selectedCategory: MoviesCategory = .popular
    
    var body: some View {
        NavigationView {
            VStack {
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
                    MoviePosterCarouselView(title: MoviesCategory.getTitleFor(title: selectedCategory), movies: moviesState.movies!)
                        .animation(.easeIn(duration: 0.5))
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

