//
//  CharacterDetailView.swift
//  Varys's Book of Little Birds
//
//  Created by Luke Bresler on 2023/06/25.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    var body: some View {
        
        ScrollView{
            HStack{
                VStack {
                    
                    if character.name != ""{
                        Text("\(character.name)")
                            .font(.title2)
                    } else{
                        Text("\(character.aliases[0])")
                    }
                    if character.gender == "Male"{
                        Image("averageWesterosJoe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                            .cornerRadius(8)
                            .padding(10)
                    } else {
                        Image("averageWesterosJane")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300)
                            .cornerRadius(8)
                            .padding(10)
                    }
                    
                    VStack(alignment: .leading) {
                        
                        if character.died != "" {
                            HStack{
                                Image(systemName: "camera.macro.circle")
                                    .padding(.leading, 7)
                                Text("POTENTIALY ALIVE")
                                //Spacer()
                            }.padding(.bottom, 7)
                            
                        } else {
                            HStack{
                                Image(systemName: "xmark.circle")
                                    .padding(.leading, 7)
                                Text("DECEASED")
                            }.padding(.bottom, 7)
                        }
                        if character.aliases[0] == ""{
                        } else {
                            HStack{
                                Image(systemName: "person.bust.fill")
                                    .padding(.leading, 7)
                                Text("AKA: \(character.aliases.joined(separator: ", "))")
                            }.padding(.bottom, 7)
                        }
                        if character.name == "" {
                            HStack{
                                Image(systemName:"face.dashed")
                                Text("Name: Unknown")
                            }.padding(.leading, 7)
                                .padding(.bottom, 7)
                        } else {
                            
                        }
                        if character.titles == [""] {
                            HStack{
                                Image(systemName: "laurel.leading")
                                Image(systemName: "laurel.trailing")
                                //  if character.titles == nil {
                                Text("Titles: Nobody of concern")
                            }.padding(.bottom, 7)
                        } else {
                            HStack{
                                Image(systemName: "laurel.leading")
                                Image(systemName: "laurel.trailing")
                                Text("\(character.titles.joined(separator: ", "))")
                            }.padding(.bottom, 7)
                        }
                    }
                }
            }
        }.padding(.leading, 25)
        .padding(.trailing, 25)
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let character = Character(url: "sampleURL", name: "", gender: "Male", culture: "Sample Culture", born: "Sample Born", died: "In 300 AC, at Oldstones", titles: ["Sample Title"], aliases: ["Alias 1", "Alias 2"], father: nil, mother: nil, spouse: nil,  books: ["Book 1", "Book 2"], povBooks: ["Pov Book 1", "Pov Book 2"], tvSeries: ["TV Series 1", "TV Series 2"], playedBy: ["Actor 1", "Actor 2"], imageURL: nil)
        
        return CharacterDetailView(character: character)
    }
}

