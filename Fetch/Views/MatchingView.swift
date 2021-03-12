//
//  MatchingView.swift
//  Fetch
//
//  Created by Ronny on 3/3/21.
//
import UIKit
import SwiftUI

struct MatchingView: View {
    var matches = ["Kyra", "Steph", "Mike", "Al", "Jimmy", "Tyler"]
    var dogs = ["Gus", "Rusty", "Jax", "Layla", "Max", "Brock"]
    var emails = ["KyraN@gmail.com", "StephS@uoregon.edu", "MikeK@aol.com", "Al456@uoregon.edu", "JimmyT@gmail.com", "Tylerf@gmail.com"]
    var profileUIColor = UIColor(red: 0.75, green: 0.18, blue: 0.87, alpha: 1.00)
    var customColor = Color(#colorLiteral(red: 0, green: 0.5166278481, blue: 0.5898452401, alpha: 1))
    var body: some View {
        
            ZStack {
                
                NavigationView {
                    
                List(matches.indices) { item in
                        VStack(alignment: .leading) {
                            
                            Text("Owner: \(matches[item])")
                            Text("Email: \(emails[item])")
                            Text("Pet: \(dogs[item])")
                        }
                }.navigationTitle("Matches")
                    
                    
            }
                
            
        }
    }
}



struct MatchingView_Previews: PreviewProvider {
    static var previews: some View {
        MatchingView()
    }
}
