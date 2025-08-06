//
//  SidebarView.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-23.
//
import SwiftUI

struct SidebarView: View {
    @Binding var selectedTab: AppTab

    var body: some View {
        TabView(selection: $selectedTab) {
            SkillFeedView()
                .tabItem {
                    Label(AppTab.skillFeed.title, systemImage: AppTab.skillFeed.icon)
                }
                .tag(AppTab.skillFeed)

            ExploreView()
                .tabItem {
                    Label(AppTab.explore.title, systemImage: AppTab.explore.icon)
                }
                .tag(AppTab.explore)

            ExchangeView()
                .tabItem {
                    Label(AppTab.exchange.title, systemImage: AppTab.exchange.icon)
                }
                .tag(AppTab.exchange)

            MyCoursesView()
                .tabItem {
                    Label(AppTab.myCourses.title, systemImage: AppTab.myCourses.icon)
                }
                .tag(AppTab.myCourses)

            ProfileView()
                .tabItem {
                    Label(AppTab.profile.title, systemImage: AppTab.profile.icon)
                }
                .tag(AppTab.profile)
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    SidebarView(selectedTab: .constant(.skillFeed))
}

