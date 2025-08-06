//
//  MainAppView.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-23.
//

import SwiftUI

struct MainAppView: View {
    @State private var selectedTab: AppTab = .skillFeed

    var body: some View {
        TabView(selection: $selectedTab) {
            SkillFeedView()
                .tabItem {
                    Label("Skill Feed", systemImage: "person.3.fill")
                }
                .tag(AppTab.skillFeed)

            ExploreView()
                .tabItem {
                    Label("Explore", systemImage: "magnifyingglass")
                }
                .tag(AppTab.explore)

            ExchangeView()
                .tabItem {
                    Label("Exchange", systemImage: "arrow.left.arrow.right.circle")
                }
                .tag(AppTab.exchange)

            MyCoursesView()
                .tabItem {
                    Label("My Courses", systemImage: "book.fill")
                }
                .tag(AppTab.myCourses)

            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tag(AppTab.profile)
        }
        .tabViewStyle(.sidebarAdaptable) // For visionOS sidebar layout
    }
}



#Preview {
    MainAppView()
}
