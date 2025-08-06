//
//  SkillSwapViewModel.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-26.
//

import Foundation


class SkillSwapViewModel: ObservableObject {
    @Published var skills: [Skill] = []
    @Published var offers: [Offer] = []

    init() {
        loadData()
    }

    func addSkill(_ skill: Skill) {
        skills.append(skill)
        saveData()
    }

    func addOffer(_ offer: Offer) {
        offers.append(offer)
        saveData()
    }

    func acceptOffer(_ offer: Offer) {
        if let index = offers.firstIndex(where: { $0.id == offer.id }) {
            offers[index].isAccepted = true
            saveData()
        }
    }

    func acceptedSkills() -> [Skill] {
        offers.filter { $0.isAccepted }.map { $0.offeredSkill }
    }

    private func saveData() {
        StorageManager.shared.save(skills, to: "skills.json")
        StorageManager.shared.save(offers, to: "offers.json")
    }

    private func loadData() {
        skills = StorageManager.shared.load([Skill].self, from: "skills.json") ?? []
        offers = StorageManager.shared.load([Offer].self, from: "offers.json") ?? []
    }
}
