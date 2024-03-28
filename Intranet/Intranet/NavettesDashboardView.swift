//
//  NavettesDashboardView.swift
//  Intranet
//
//  Created by Léo Lesimple on 28/05/2023.
//

import SwiftUI
import SQLite

struct NavettesDashboardView: SwiftUI.View {
    @State private var navettes: [Navette] = []

    var body: some SwiftUI.View {
        VStack {
            List(navettes, id: \.id) { navette in
                Text(navette.name)
            }
        }
        .onAppear(perform: fetchData)
    }

    func fetchData() {
        guard let url = URL(string: "https://leolesimple.fr/request_db.db") else {
            print("Invalid URL")
            return
        }

        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationURL = documentsURL.appendingPathComponent("request_db.db")

        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)

        let request = URLRequest(url: url)

        let task = session.downloadTask(with: request) { (tempLocalURL, response, error) in
            if let tempLocalURL = tempLocalURL, error == nil {
                do {
                    try FileManager.default.moveItem(at: tempLocalURL, to: destinationURL)

                    let db = try Connection(destinationURL.path)

                    let table = Table("navette")
                    let id = Expression<Int>("id")
                    let name = Expression<String>("user")

                    navettes = try db.prepare(table).map { row in
                        Navette(id: row[id], name: row[name])
                    }
                } catch {
                    print("Error: \(error)")
                }
            } else {
                print("Error downloading database: \(error?.localizedDescription ?? "")")
            }
        }

        task.resume()
    }
}

struct Navette: Identifiable {
    let id: Int
    let name: String
}

struct NavettesDashboardView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        NavettesDashboardView()
    }
}
