//
//  ActivityIndicatorView.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import SwiftUI

// Activity indicator for loading view
struct ActivityIndicatorView: UIViewRepresentable {
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    //Make and star animating a view
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
}
