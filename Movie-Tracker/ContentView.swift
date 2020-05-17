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
struct ContentView: View {
    @State var title = ""
    @State var rating = 3.0
    @State var seen = false
    
    var body: some View {
        List {
            Section {
                TextField("Movie Title", text: $title)
            }
            Section {
                HStack {
                    Text(String(repeating: "*", count: Int(rating))).foregroundColor(.yellow).font(.title)
                }
                Slider(value: $rating, in: 1...5, step: 1)
            }
            Section {
                Toggle(isOn: $seen) {
                    if title == "" {
                        Text("I have seen this movie")
                    } else {
                        Text("I have seen \(title)")
                    }
                }
            }
            Section {
                Button(action: {}) {
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
        ContentView()
    }
}
