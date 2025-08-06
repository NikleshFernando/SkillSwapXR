//
//  SkillFeedView.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-23.
//

import SwiftUI

struct SkillFeedView: View {
    @EnvironmentObject var offerStore: OfferDataStore
    @EnvironmentObject var skillStore: SkillDataStore
    @State private var searchText: String = ""
    @State private var navigateToCreateOffer = false

    var filteredOffers: [Offer] {
        if searchText.isEmpty {
            return offerStore.offers
        } else {
            return offerStore.offers.filter {
                $0.wantToLearn.localizedCaseInsensitiveContains(searchText) ||
                $0.description.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Welcome to")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Text("SkillSwap")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    Spacer()
                    Button {
                        navigateToCreateOffer = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                .padding(.leading,20)

                TextField("Search skills or offers...", text: $searchText)
                    .padding(10)
                    .background(.thinMaterial)
                    .cornerRadius(10)
                    .padding(.horizontal)

                ScrollView {
                    LazyVStack(spacing: 24) {
                        if filteredOffers.isEmpty {
                            Text("No offers available.")
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            ForEach(filteredOffers) { offer in
                                OfferCardView(offer: offer)
                                    .frame(maxWidth: 600)
                                    .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.bottom)
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $navigateToCreateOffer) {
                if let skill = skillStore.skills.first {
                    CreateOfferView(skill: skill)
                } else {
                    Text("No skills available to create an offer.")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    SkillFeedView()
        .environmentObject(OfferDataStore())
        .environmentObject(SkillDataStore())
}
