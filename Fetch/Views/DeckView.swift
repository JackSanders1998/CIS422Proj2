//
//  DeckView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//

import SwiftUI

struct DeckView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("house")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400.0, height: 300.0, alignment: .top)
            }
        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView()
    }
}
