//
//  ContentView.swift
//  Movie-Tracker
//
//  Created by Denis Tsoi on 17/5/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import SwiftUI

//        Button(action: {
//            print("Hello")
//        }) {
//            Text("Button")
//        }


//ZStack {
//    Image("code").resizable().aspectRatio(contentMode: .fit)
//    Image(systemName: "play.fill").resizable().foregroundColor(.red)
//        .aspectRatio(contentMode: .fit).frame(width: 100, height: 100)
//}
struct MovieDetail: View {
    
    @State var movie: Movie
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        List {
            Section {
                SectionTitle(title: "Title")
                TextField("Movie Title", text: $movie.title)
            }
            Section {
                SectionTitle(title: "Rating")
                HStack {
                    Text(String(repeating: "*", count: Int(movie.rating))).foregroundColor(.yellow).font(.title)
                }
                Slider(value: $movie.rating, in: 1...5, step: 1)
            }
            Section {
                SectionTitle(title: "Seen")
                Toggle(isOn: $movie.seen) {
                    if movie.title == "" {
                        Text("I have seen this movie")
                    } else {
                        Text("I have seen \(movie.title)")
                    }
                }
            }
            Section {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Spacer()
                        Text("Save")
                        Spacer()
                    }
                }
            }
        }.listStyle(GroupedListStyle())

        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie())
    }
}

struct SectionTitle: View {
    var title: String
    var body: some View {
Text(title).font(.caption).foregroundColor(.gray)
    }
}
