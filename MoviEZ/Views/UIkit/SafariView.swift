//
//  SafariView.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import Foundation
import SafariServices
import SwiftUI

//safari view
struct SafariView: UIViewControllerRepresentable {
    //Open url with safari view controller 
    let url: URL
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    func makeUIViewController(context: Context) -> some SFSafariViewController {
        let safariVC = SFSafariViewController(url: url)
        return safariVC
    }
}
