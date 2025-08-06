//
//  MockData.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-24.
//

import Foundation


let mockSkills: [Skill] = [
    Skill(topic: "Piano", description: "Learn to play piano from scratch.", videoURL: nil, pdfURL: nil),
    Skill(topic: "Photography", description: "Basics of using a DSLR camera.", videoURL: nil, pdfURL: nil),
    Skill(topic: "Cooking", description: "Learn Italian dishes!", videoURL: nil, pdfURL: nil)
]

let mockUser = User(name: "Alex", bio: "Creative artist and musician", skills: mockSkills)

struct MockData {
    static let offers: [Offer] = [
        Offer(wantToLearn: "Photography", description: "Looking to master DSLR.", offeredSkill: Skill(topic: "Graphic Design", description: "Teach Adobe tools", videoURL: nil, pdfURL: nil), ownerName: "Alice"),
        Offer(wantToLearn: "Public Speaking", description: "Improve stage confidence.", offeredSkill: Skill(topic: "Yoga", description: "Basics of yoga", videoURL: nil, pdfURL: nil), ownerName: "Bob"),
        Offer(wantToLearn: "SwiftUI", description: "Learn layout management.", offeredSkill: Skill(topic: "Music Production", description: "FL Studio basics", videoURL: nil, pdfURL: nil), ownerName: "Charlie"),
        Offer(wantToLearn: "BlockChain", description: "Developing Block Chain System", offeredSkill: Skill(topic: "Machin Learning", description: "Supervised Learning basics", videoURL: nil, pdfURL: nil), ownerName: "Charlie"),
        Offer(wantToLearn: "Guitar", description: "Chords and strumming", offeredSkill: mockSkills[0], ownerName: "Alex")
    ]
}

