//
//  CharacterListView.swift
//  Varys's Book of Little Birds
//
//  Created by Luke Bresler on 2023/06/25.
//

import Foundation
import SwiftUI

struct CharactersListView: View {
    @ObservedObject var characterDataManager = CharacterDataManager()
    @State private var searchText = ""
   // @Binding var searchText: String
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            List(characterDataManager.characters, id: \.id) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    HStack {
                        if character.gender == "Male" {
                            Image("averageWesterosJoe")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(8)
                                .padding(10)
                        } else {
                            Image("averageWesterosJane")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(8)
                                .padding(10)
                        }
                        VStack {
                            Text(character.name)
                                .font(.title3)
                                .padding(.bottom, 10)
                            
                            if character.aliases[0] == ""{
                                
                            } else {
                                Text("AKA: \(character.aliases[0])")
                            }
                        }
                    }
                }
                .id(character.id)
                .searchable(text: $searchText)
            }
           // .background(opacity: 0.5)

           // .scrollContentBackground(.hidden)
            .navigationBarTitle("A little bird sang...")
            .refreshable {
                characterDataManager.loadMoreCharacters()
            }
            .onAppear {
                characterDataManager.fetchCharacters()
                checkInternetConnection()
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("No Internet Connection"),
                    message: Text("Please check your internet connection and try again."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
        .accentColor(.black)
    }
    
    // Checks the internet connection by making a request to a reliable URL.
    // Displays an alert if there is no internet connection.
    private func checkInternetConnection() {
        guard let url = URL(string: "https://www.google.com") else {
            showAlert = true
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (_, _, error) in
            showAlert = (error != nil)
        }
        task.resume()
    }
}

//struct SearchBar: View {
//    @Binding var text: String
//
//    var body: some View {
//        HStack {
//            TextField("Look", text: $text)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//                .padding(.horizontal, 10)
//
//            Button(action: {
//                text = ""
//            }) {
//                Image(systemName: "magnifyingglass.circle.fill")
//                    .foregroundColor(.white)
//                    .font(.title)
//            }
//            .padding(.trailing, 10)
//        }
//        .padding(.vertical, 8)
//        .background(Color.white.opacity(0.9))
//        .cornerRadius(10)
//        .padding(.horizontal, 10)
//        .padding(.bottom, 10)
//    }
//}

struct CharacterListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView()
    }
}
