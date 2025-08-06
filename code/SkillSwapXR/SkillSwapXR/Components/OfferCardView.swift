//
//  OfferCardView.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-24.
//

import SwiftUI

struct OfferCardView: View {
    var offer: Offer
    @State private var showToast = false
    @State private var selectedGradient: [Color] = []

    let availableGradients: [[Color]] = [
        [Color.red, Color.orange],
        [Color.blue, Color.cyan],
        [Color.purple, Color.pink],
        [Color.green, Color.teal],
        [Color.indigo, Color.mint],
        [Color.yellow, Color.orange]
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("I want to learn \(offer.wantToLearn), I will teach \(offer.offeredSkill.topic)")
                .font(.headline)
                .foregroundColor(.white)

            Text(offer.description)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.9))

            HStack {
                Label(offer.ownerName, systemImage: "person.crop.circle")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .bold()

                Spacer()

                Button("Apply") {
                    withAnimation {
                        showToast = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            showToast = false
                        }
                    }
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(Color.black.opacity(0.7))
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
        .padding()
        .background(
            LinearGradient(colors: selectedGradient, startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear {
            if selectedGradient.isEmpty {
                selectedGradient = availableGradients.randomElement() ?? [Color.gray, Color.gray.opacity(0.5)]
            }
        }
        .overlay(
            VStack {
                if showToast {
                    Text("✅ Successfully Applied!")
                        .font(.footnote)
                        .padding(10)
                        .background(Color.black.opacity(0.85))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .transition(.opacity)
                }
                Spacer()
            }
            .padding(.top, 10),
            alignment: .top
        )
    }
}

#Preview {
    OfferCardView(offer: MockData.offers.first!)
}
