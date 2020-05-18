//
//  MovieList.swift
//  Movie-Tracker
//
//  Created by Denis Tsoi on 17/5/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import SwiftUI

struct MovieList: View {
    var movies = [Movie(), Movie(), Movie()]
    var body: some View {
        NavigationView {
            List(movies) {
                currentMovie in
                NavigationLink(destination: MovieDetail(movie: currentMovie)) {
                    Text(currentMovie.title)
                }
            }.navigationBarTitle("Movies").navigationBarItems(trailing:
                NavigationLink(destination: MovieDetail(movie: Movie())) {
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
