//
//  CreateOfferView.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-26.
//

import SwiftUI

struct CreateOfferView: View {
    let skill: Skill
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var offerStore: OfferDataStore

    @State private var wantToLearn = ""
    @State private var description = ""

    var body: some View {
        Form {
            Section("What You Want to Learn") {
                TextField("e.g. UI Design", text: $wantToLearn)
            }

            Section("Offer Description") {
                TextField("Explain what you'll teach", text: $description)
            }

            Section("Your Skill Being Offered") {
                Text(skill.topic)
                Text(skill.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Button("Publish Offer") {
                let offer = Offer(
                    wantToLearn: wantToLearn,
                    description: description,
                    offeredSkill: skill,
                    ownerName: "You"
                )
                offerStore.addOffer(offer)
                dismiss()
            }
            .disabled(wantToLearn.isEmpty || description.isEmpty)
        }
        .navigationTitle("Create Skill Offer")
    }
}

