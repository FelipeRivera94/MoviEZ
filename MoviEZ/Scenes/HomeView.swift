//
//  HomeView.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 25/10/21.
//

import SwiftUI

//Home scene
struct HomeView: View {
    
    //enum for home view tab bar control
    enum Tab: Int {
        case movies
        case search
    }
    
    // default tab state variable
    @State private var selectedTab = Tab.movies
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MoviesView().tabItem {
                renderTabBarItem(itemName: "movies_item_name", imageName: "film")
            }.tag(Tab.movies)
            SearchView().tabItem {
                renderTabBarItem(itemName: "more_item_name", imageName: "magnifyingglass")
            }.tag(Tab.search)
        }
    }
}

// MARK:  Render Tab bar item
///  create and render a tab bar item
/// - parameter itemName: it is the name that the item will display
/// - parameter imageName: it is the image that the item will display
/// - returns: returns the created item ready to be rendered
private func renderTabBarItem(itemName: LocalizedStringKey, imageName:String) -> some View {
    VStack {
        Image(systemName: imageName).imageScale(.large)
        Text(itemName)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
