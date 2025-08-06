//
//  ExploreView.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-23.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText: String = ""
    @State private var isLoading: Bool = false
    @State private var allOffers: [Offer] = MockData.offers

    var filteredOffers: [Offer] {
        if searchText.isEmpty {
            return allOffers
        } else {
            return allOffers.filter {
                $0.wantToLearn.localizedCaseInsensitiveContains(searchText) ||
                $0.ownerName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 32)
                    .fill(.ultraThinMaterial)
                    .padding()

                VStack(spacing: 20) {
                    Text("Explore")
                        .font(.largeTitle.bold())
                        .padding(.top)

                    TextField("Search by user or skill...", text: $searchText)
                        .padding(12)
                        .background(.thinMaterial)
                        .cornerRadius(12)
                        .padding(.horizontal)

                    if isLoading {
                        Spacer()
                        ProgressView("Loading offers...")
                        Spacer()
                    } else if filteredOffers.isEmpty {
                        Spacer()
                        Text("No offers found.")
                            .foregroundColor(.gray)
                        Spacer()
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 16) {
                                ForEach(filteredOffers) { offer in
                                    offerCard(offer)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    Spacer()
                }
                .padding()
            }
        }
    }

    @ViewBuilder
    func offerCard(_ offer: Offer) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("\(offer.ownerName) wants to learn: \(offer.wantToLearn)")
                .font(.headline)
            Text("They offer: \(offer.offeredSkill.topic) - \(offer.offeredSkill.description)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.thinMaterial)
        )
        .shadow(radius: 3)
    }
}

#Preview {
    ExploreView()
}
