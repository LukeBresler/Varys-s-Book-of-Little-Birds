//
//  ContentView.swift
//  Varys's Book of Little Birds
//
//  Created by Luke Bresler on 2023/06/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @Environment(\.scenePhase) var scenePhase
    @State private var itIsSafe: Bool = false
    @GestureState var secretBird: Bool = false
    
    
    var body: some View {
        ZStack{
            
            //Background View
            VStack(alignment:.center){
                HStack{
                    Image("littleBirds")
                        .resizable()
                        .scaledToFill()
                }.padding(.trailing, 40)
            }.ignoresSafeArea()
                .zIndex(1)
            
            //Title
            VStack {
                HStack{
                    Image(systemName: "bird")
                        .foregroundColor(.white)
                    Text("Varys's Book of Little Birds")
                        .font(.title2)
                        .foregroundColor(.white)
                        .shadow(color: .orange, radius: 7)
                    Image(systemName: "bird")
                        .foregroundColor(.white)
                    
                    //secret bird button
                        .gesture(LongPressGesture(minimumDuration: 3)
                            .updating($secretBird){ currentState, gestureState, transaction in
                                gestureState = currentState
                                
                            }.onEnded { value in
                                itIsSafe.toggle()
                            }
                        )
                }
                Spacer()
            }
            .zIndex(20)
            
            //If it is safe then show real list
            VStack{
                if itIsSafe == true {
                    VStack{
                        CharactersListView().padding(.all, 10)
                    }
                    .padding(.bottom, 10)
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    
                    //Spacer()
                    HStack{
                        
                        HStack{
                            
                            VStack{
                                HStack{
                                    Spacer()
                                    VStack{
                                        Image(systemName: "eye.trianglebadge.exclamationmark")
                                        Text("Hide")
                                    }.padding(.trailing, 30)
                                }
                            }
                            .onTapGesture {
                                itIsSafe = false
                            }
                        }.foregroundColor(.white)
                            .padding(.bottom, 2)
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    
                } else {
                    VStack{
                        DecoyBirdListView(birds: birds)
                            .padding(.top, 15)
                            .padding(.leading, 20)
                            .padding(.trailing, 20)
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .padding(.bottom, 20)
                }
            }
            .zIndex(22)
            .padding(.top, 30)
            .padding(.leading, 40)
            .padding(.trailing, 40)
            
            // if device changes app or goes into the background it will show the decoy list
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    itIsSafe = false
                } else if newPhase == .background {
                    itIsSafe = false
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
