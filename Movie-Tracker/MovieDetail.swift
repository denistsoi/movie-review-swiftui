//
//  ContentView.swift
//  Movie-Tracker
//
//  Created by Denis Tsoi on 17/5/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    
    @State var movie: Movie
    @Environment(\.presentationMode) var presentationMode
    
    let newMovie: Bool
    
    @EnvironmentObject var movieStorage:  MovieStorage
    
    var body: some View {
        List {
            Section {
                SectionTitle(title: "Title")
                TextField("Movie Title", text: $movie.title)
            }
            Section {
                SectionTitle(title: "Rating")
                HStack {
                    Text(String(repeating: "*", count: Int(movie.rating))).foregroundColor(.yellow).font(.title).accessibility(label: Text("\(Int(movie.rating)) star rating"))
                }
                Slider(value: $movie.rating, in: 1...5, step: 1).accessibility(value: Text("\(Int(movie.rating))"))
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
                    if self.newMovie {
                        self.movieStorage.movies.append(self.movie)
                    } else {
                      
                        for x in 0..<self.movieStorage.movies.count {
                            
                            if self.movieStorage.movies[x].id == self.movie.id {
                                self.movieStorage.movies[x] = self.movie
                            }
                        }
                    }
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
        MovieDetail(
            movie: Movie(),
            newMovie: true)
    }
}

struct SectionTitle: View {
    var title: String
    var body: some View {
        Text(title).font(.caption).foregroundColor(.gray)
    }
}
