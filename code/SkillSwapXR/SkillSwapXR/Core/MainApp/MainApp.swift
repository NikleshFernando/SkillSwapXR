//
//  MainApp.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-24.
//

import Foundation
 
enum AppTab: Hashable {
    case skillFeed, explore, exchange, myCourses, profile

    var icon: String {
        switch self {
        case .skillFeed: return "person.3.fill"
        case .explore: return "magnifyingglass"
        case .exchange: return "arrow.left.arrow.right.circle"
        case .myCourses: return "book.fill"
        case .profile: return "person.crop.circle"
        }
    }

    var title: String {
        switch self {
        case .skillFeed: return "Feed"
        case .explore: return "Explore"
        case .exchange: return "Exchange"
        case .myCourses: return "Courses"
        case .profile: return "Profile"
        }
    }
}

