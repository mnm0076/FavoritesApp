//
//  FavoritesView.swift
//  Favorites
//
//  Created by Meghan Murphy on 7/13/25.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var viewModel: FavoritesViewModel

    var body: some View {
        NavigationView {
            List {
                if viewModel.cities.contains(where: { $0.isFavorite }) {
                    Section(header: Text("Cities")) {
                        ForEach(viewModel.cities.filter { $0.isFavorite }) { city in
                            HStack {
                                Text(city.cityName)
                                Spacer()
                                Button {
                                    viewModel.toggleFavoriteCity(city)
                                } label: {
                                    Image(systemName: "heart.slash").foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }

                if viewModel.hobbies.contains(where: { $0.isFavorite }) {
                    Section(header: Text("Hobbies")) {
                        ForEach(viewModel.hobbies.filter { $0.isFavorite }) { hobby in
                            HStack {
                                Text("\(hobby.hobbyIcon) \(hobby.hobbyName)")
                                Spacer()
                                Button {
                                    viewModel.toggleFavoriteHobby(hobby)
                                } label: {
                                    Image(systemName: "heart.slash").foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }

                if viewModel.books.contains(where: { $0.isFavorite }) {
                    Section(header: Text("Books")) {
                        ForEach(viewModel.books.filter { $0.isFavorite }) { book in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(book.bookTitle).fontWeight(.bold)
                                    Text(book.bookAuthor).font(.subheadline).foregroundColor(.gray)
                                }
                                Spacer()
                                Button {
                                    viewModel.toggleFavoriteBook(book)
                                } label: {
                                    Image(systemName: "heart.slash").foregroundColor(.gray)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}
