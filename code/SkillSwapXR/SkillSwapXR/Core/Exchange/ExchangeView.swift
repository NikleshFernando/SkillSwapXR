//
//  ExchangeView.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-23.
//

import SwiftUI


struct ExchangeView: View {
    @State private var selectedTab: ExchangeTab = .myOffers
    @State private var myOffers: [Offer] = MockData.offers.filter { $0.ownerName == "Alex" }
    @State private var offersToAccept: [Offer] = MockData.offers.filter { $0.ownerName != "Alex" }
    
    enum ExchangeTab: String, CaseIterable {
        case myOffers = "My Offers"
        case toAccept = "Offers To Accept"
    }
    
    var body: some View {
        NavigationStack{
            VStack {
                Picker("Exchange Tab", selection: $selectedTab) {
                    ForEach(ExchangeTab.allCases, id: \ .self) { tab in
                        Text(tab.rawValue).tag(tab)
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                ScrollView {
                    VStack(spacing: 16) {
                        if selectedTab == .myOffers {
                            if myOffers.isEmpty {
                                Text("No pending offers yet.")
                                    .foregroundColor(.gray)
                            } else {
                                ForEach(myOffers) { offer in
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text("To: \(offer.ownerName)")
                                            .font(.headline)
                                        Text("Want to learn: \(offer.wantToLearn)")
                                        Text("Will teach: \(offer.description)")
                                            .foregroundColor(.secondary)
                                        
                                        Button(role: .destructive) {
                                            withAnimation {
                                                myOffers.removeAll { $0.id == offer.id }
                                            }
                                        } label: {
                                            Label("Delete Offer", systemImage: "trash")
                                        }
                                        .font(.footnote)
                                    }
                                    .padding()
                                    .background(.ultraThinMaterial)
                                    .cornerRadius(16)
                                    .shadow(radius: 4)
                                }
                            }
                        } else {
                            if offersToAccept.isEmpty {
                                Text("No offers to accept.")
                                    .foregroundColor(.gray)
                            } else {
                                ForEach(offersToAccept) { offer in
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text("\(offer.ownerName) wants to learn: \(offer.wantToLearn)")
                                            .font(.headline)
                                        Text("They will teach: \(offer.description)")
                                            .foregroundColor(.secondary)
                                        
                                        HStack {
                                            Button("Accept") {
                                                withAnimation {
                                                    offersToAccept.removeAll { $0.id == offer.id }
                                                }
                                            }
                                            .buttonStyle(.borderedProminent)
                                            .tint(.green)
                                            
                                            Button("Reject") {
                                                withAnimation {
                                                    offersToAccept.removeAll { $0.id == offer.id }
                                                }
                                            }
                                            .buttonStyle(.bordered)
                                            .tint(.red)
                                        }
                                    }
                                    .padding()
                                    .background(
                                        LinearGradient(
                                            colors: [Color.blue.opacity(0.6), Color.cyan.opacity(0.6)],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                    )
                                    .cornerRadius(16)
                                    .shadow(radius: 5)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    ExchangeView()
}

