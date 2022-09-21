//
//  ContentView.swift
//  movieapp2
//
//  Created by Shahad on 21/09/o022.
//

import SwiftUI
struct Member: Identifiable{
    let id = UUID()
    
    let name: String
    let imageName: String
   
}
struct MovieInfo: Identifiable{
    let id = UUID()
    
    let title: String
    let imageName: String
    let casting: [Member]
}
struct ContentView: View {
    let movies = [MovieInfo(title: "Les miserable", imageName: "Les-miserable", casting: [Member( name: "anne hathaway", imageName: "anne hathaway"),Member ( name: "Eddie Redmayne", imageName: "Eddie Redmayne")
                                                                                         ]),
                  MovieInfo(title: "The Age of Adaline", imageName: "The_Age_of_Adaline", casting: [ Member( name: "Blake Lively", imageName: "aBlake Lively") ]),
                  MovieInfo(title: "Freedom Writers", imageName: "Freedom-writers", casting: [ Member( name: "HilarySwank", imageName: "HilarySwank"), Member( name: "Patrick Dempsey", imageName: "Patrick Dempsey")
                                                                            ]
                           )
    ]
    var body: some View {
       // VStack {
            NavigationView {
                List{
                    ForEach(movies) { movie in
                        NavigationLink(destination:info(moviie: movie) ){
                         
                        
                            Details(movie: movie)
                    }
                  
                    
                }
                .navigationTitle("Movies")
            }
           
        }
        //}
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Details: View {
    let movie: MovieInfo
    
    var body: some View {
        HStack{
            Image(movie.imageName).resizable()
                .frame(width: 90, height: 90)
            
                .clipShape(Circle())
            Text(movie.title).font(.largeTitle)
        }
        .padding()
        
        
    }
}

struct info: View {
    let moviie: MovieInfo

        var body: some View{
            ZStack{
                
                Color.black
                Image(moviie.imageName).resizable().scaledToFill().scaledToFit().opacity(0.5)
                    .blur(radius: 10)
                    .scaledToFill()
                VStack{
                    Image(moviie.imageName).resizable().frame(width: 180,height: 180).clipShape(Circle())
                    Text(moviie.title).font(.largeTitle)
                    ScrollView(.horizontal){
                        HStack{
                            ForEach(moviie.casting){ Members in
                                
                                VStack{
                                    Text(Members.imageName)
                                    Image(Members.name).resizable().frame(width: 100,height: 100)
                                    
                                }
                            }
                        }
                        
                    }
                }
                
                
            }.ignoresSafeArea() .foregroundColor(.white)
        }
    }
    

