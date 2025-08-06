//
//  Profile.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-22.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var skillStore: SkillDataStore
    @State private var selectedTab: ProfileTab = .skills
    @State private var showSkillUpload = false

    @State private var userOffers: [Offer] = [
        Offer(wantToLearn: "Design", description: "UI principles", offeredSkill: Skill(topic: "SwiftUI", description: "SwiftUI basics", videoURL: nil, pdfURL: nil), ownerName: "You")
    ]

    let userName = "Alex Johnson"
    let userBio = "Creative artist and musician passionate about skill sharing."

    enum ProfileTab: String, CaseIterable {
        case skills = "My Skills"
        case offers = "My Offers"
    }

    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 32)
                    .fill(.ultraThinMaterial)
                    .padding()

                VStack(spacing: 20) {
                    HStack {
                        Text("Profile")
                            .font(.largeTitle.bold())
                        Spacer()
                        Button {
                            showSkillUpload = true
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding(.horizontal)

                    // Profile Details
                    VStack(spacing: 8) {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                        Text(userName)
                            .font(.title2)
                            .bold()
                        Text(userBio)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .padding(.bottom)

                    Picker("Tab", selection: $selectedTab) {
                        ForEach(ProfileTab.allCases, id: \.self) { tab in
                            Text(tab.rawValue).tag(tab)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding(.horizontal)

                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            if selectedTab == .skills {
                                if skillStore.skills.isEmpty {
                                    Text("No skills yet.").foregroundColor(.gray)
                                } else {
                                    ForEach(skillStore.skills) { skill in
                                        skillCard(skill)
                                    }
                                }

                            } else {
                                if userOffers.isEmpty {
                                    Text("No offers yet.").foregroundColor(.gray)
                                } else {
                                    ForEach(userOffers) { offer in
                                        offerCard(offer)
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    Spacer()
                }
                .padding()
            }
        }
        .sheet(isPresented: $showSkillUpload) {
            SkillUploadView()
        }
    }

    @ViewBuilder
    func skillCard(_ skill: Skill) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(skill.topic)
                .font(.headline)
            Text(skill.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.thinMaterial)
        )
        .shadow(radius: 3)
    }

    @ViewBuilder
    func offerCard(_ offer: Offer) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("I want to learn: \(offer.wantToLearn)")
                .font(.headline)
            Text("I will teach: \(offer.description)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(.thinMaterial)
        )
        .shadow(radius: 3)
    }
}

#Preview {
    ProfileView()
}
