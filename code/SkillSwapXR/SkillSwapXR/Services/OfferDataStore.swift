//
//  OfferDataStore.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-26.
//

import Foundation

class OfferDataStore: ObservableObject {
    @Published var offers: [Offer] = []

    private let filename = "offers.json"

    init() {
        loadOffers()
    }

    func addOffer(_ offer: Offer) {
        offers.append(offer)
        saveOffers()
    }

    func saveOffers() {
        StorageManager.shared.save(offers, to: filename)
    }

    func loadOffers() {
        offers = StorageManager.shared.load([Offer].self, from: filename) ?? []
    }
}
