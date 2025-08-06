//
//  Skills.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-22.
//

import Foundation

struct Skill: Identifiable, Codable {
    let id: UUID
    var topic: String
    var description: String
    var videoURL: String?
    var pdfURL: String?

    init(id: UUID = UUID(), topic: String, description: String, videoURL: String? = nil, pdfURL: String? = nil) {
        self.id = id
        self.topic = topic
        self.description = description
        self.videoURL = videoURL
        self.pdfURL = pdfURL
    }
}

