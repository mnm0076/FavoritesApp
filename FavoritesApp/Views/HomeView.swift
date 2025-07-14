//
//  HomeView.swift
//  Favorites
//
//  Created by Meghan Murphy on 7/13/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: FavoritesViewModel

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Cities")) {
                    ForEach(viewModel.cities) { city in
                        HStack {
                            Text(city.cityName)
                            Spacer()
                            Button {
                                viewModel.toggleFavoriteCity(city)
                            } label: {
                                Image(systemName: city.isFavorite ? "heart.fill" : "heart")
                                    .foregroundColor(Color("HotPink"))
                            }
                        }
                    }
                }

                Section(header: Text("Hobbies")) {
                    ForEach(viewModel.hobbies) { hobby in
                        HStack {
                            Text("\(hobby.hobbyIcon) \(hobby.hobbyName)")
                            Spacer()
                            Button {
                                viewModel.toggleFavoriteHobby(hobby)
                            } label: {
                                Image(systemName: hobby.isFavorite ? "heart.fill" : "heart")
                                    .foregroundColor(Color("HotPink"))
                            }
                        }
                    }
                }

                Section(header: Text("Books")) {
                    ForEach(viewModel.books) { book in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(book.bookTitle).fontWeight(.bold)
                                Text(book.bookAuthor).font(.subheadline).foregroundColor(.gray)
                            }
                            Spacer()
                            Button {
                                viewModel.toggleFavoriteBook(book)
                            } label: {
                                Image(systemName: book.isFavorite ? "heart.fill" : "heart")
                                    .foregroundColor(Color("HotPink"))
                            }
                        }
                    }
                }
            }
            .navigationTitle("Home")
        }
    }
}
