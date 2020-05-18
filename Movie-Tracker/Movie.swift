//
//  Movie.swift
//  Movie-Tracker
//
//  Created by Denis Tsoi on 17/5/2020.
//  Copyright © 2020 Denis Tsoi. All rights reserved.
//

import Foundation

struct Movie: Identifiable {
    var id = UUID()
    var title = "Movie"
    var rating = 3.0
    var seen = false
}
