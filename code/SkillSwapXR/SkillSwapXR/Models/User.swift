//
//  User.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-24.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    let name: String
    let bio: String
    var skills: [Skill]
}


