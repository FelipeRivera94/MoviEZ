//
//  SearchBar.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import Foundation

import SwiftUI
//Search bar view
struct SearchBarView: UIViewRepresentable {
    //placeHolder
    let placeholder: String
    //Biding
    @Binding var text: String
    //update text using biding
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
    //make and customise view
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.delegate = context.coordinator
        return searchBar
    }
    //asociate coordinator with biding
    func makeCoordinator() -> Coordinator {
        Coordinator(text: self.$text)
    }
    //init coordinator
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        init(text: Binding<String>) {
            _text = text
        }
        //update text in change
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.text = searchText
        }
        //push keyboard down
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }

}
