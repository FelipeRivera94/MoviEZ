//
//  LoadingView.swift
//  MoviEZ
//
//  Created by Felipe Rivera on 26/10/21.
//

import Foundation
import SwiftUI

//custom loading view
struct LoadingView: View {
    let isLoading: Bool
    let error: NetworkError?
    let retryAction: (()->())?
    var body: some View {
        Group {
            if isLoading {
                HStack {
                    Spacer()
                    ActivityIndicatorView()
                    Spacer()
                }
            } else if error != nil {
                HStack {
                    Spacer()
                    VStack(spacing: 4) {
                        Text(error!.errorDescription).font(.headline)
                        if self.retryAction != nil {
                            Button(action: self.retryAction!){
                                Text("Retry_button")
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: true, error: nil, retryAction: nil)
    }
}
