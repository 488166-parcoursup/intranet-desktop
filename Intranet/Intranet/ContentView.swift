//
//  ContentView.swift
//  Intranet
//
//  Created by Léo Lesimple on 28/05/2023.
//

import SwiftUI

struct Item {
    var image: String
    var label: String
}

struct ContentView: View {
    let items = [
        Item(image: "hand.thumbsup", label: "Up"),
        Item(image: "tortoise", label: "Tortoise"),
        Item(image: "forward", label: "Forward"),
        Item(image: "hand.thumbsdown", label: "Down"),
        Item(image: "hare", label: "Hare"),
        Item(image: "backward", label: "Backward")
    ]

    var body: some View {
       Text("Heelo")
    }
}
