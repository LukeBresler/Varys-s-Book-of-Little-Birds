//
//  DecoyBirdList.swift
//  Varys's Book of Little Birds
//
//  Created by Luke Bresler on 2023/06/25.
//

import SwiftUI
import Foundation

struct DecoyBirdListView: View {
    let birds: [Bird]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(birds, id: \.name) { bird in
                        VStack(alignment: .leading){
                            HStack(alignment: .top){
                                Spacer()
                                VStack{
                                    Image(bird.image)
                                    
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 100)
                                        .cornerRadius(10)
                                    
                                }
                                Spacer()
                                VStack{
                                    Spacer()
                                    Text(bird.name)
                                        .font(.headline)
                                    
                                    Text(bird.scientificName)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    Text("Habitat: \(bird.habitat)")
                                        .font(.subheadline)
                                        .padding(.bottom, 4)
                                    Spacer()
                                }
                            }
                            Text(bird.description)
                                .font(.body)
                                .lineLimit(nil)
                        }
                        .padding(10)
                        Text("~")
                            .padding(.bottom, 4)
                    }
                }
                .padding(.horizontal)
            }.scrollContentBackground(.hidden)
            
        }
    }
}

struct DecoyBirdListView_Previews: PreviewProvider {
    static var previews: some View {
        DecoyBirdListView(birds: birds)
    }
}
