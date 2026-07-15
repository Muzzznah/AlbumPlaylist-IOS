//
//  CustomWebView.swift
//  AlbumPlaylist
//
//  Created by Muznah Adil on 2026-07-15.
//


import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {

    let webText: String

    // Creates the view and configures its initial state.
    func makeUIView(context: Context) -> WKWebView {
        WKWebView()
    }

    // Updates the state of the view with new information from SwiftUI.
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: webText) else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }

    // The type of view to present.
    typealias UIViewType = WKWebView

}
