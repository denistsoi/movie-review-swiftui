//
//  MovieList.swift
//  Movie-Tracker
//
//  Created by Denis Tsoi on 17/5/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import SwiftUI

struct MovieList: View {
    @EnvironmentObject var movieStorage : MovieStorage
    
    var body: some View {
        NavigationView {
            List(movieStorage.movies) {
                currentMovie in
                NavigationLink(destination: MovieDetail(movie: currentMovie, newMovie: false)) {
                    Text(currentMovie.title)
                }
            }.navigationBarTitle("Movies").navigationBarItems(trailing:
                NavigationLink(destination: MovieDetail(movie: Movie(), newMovie: true)) {
                    Text("Create")
                }
            )
        }
    }
}


struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
