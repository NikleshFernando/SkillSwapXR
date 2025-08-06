//
//  Offer.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-24.
//

import Foundation

struct Offer: Identifiable, Codable {
    let id: UUID
    var wantToLearn: String
    var description: String
    var offeredSkill: Skill
    var ownerName: String
    var isAccepted: Bool

    init(id: UUID = UUID(), wantToLearn: String, description: String, offeredSkill: Skill, ownerName: String, isAccepted: Bool = false) {
        self.id = id
        self.wantToLearn = wantToLearn
        self.description = description
        self.offeredSkill = offeredSkill
        self.ownerName = ownerName
        self.isAccepted = isAccepted
    }
}
