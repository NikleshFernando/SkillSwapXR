//
//  MyCoursesView.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-23.
//

import SwiftUI

struct MyCoursesView: View {
    let acceptedSkills: [Skill] = [
        Skill(topic: "Photography", description: "DSLR basics", videoURL: "https://example.com/photo.mp4", pdfURL: "https://example.com/photo.pdf"),
        Skill(topic: "Cooking", description: "Italian pasta secrets", videoURL: "https://example.com/photo.mp4", pdfURL: "https://example.com/photo.pdf"),
        Skill(topic: "Yoga", description: "Basic poses for beginners", videoURL: "https://example.com/yoga.mp4", pdfURL: "https://example.com/photo.pdf")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                RoundedRectangle(cornerRadius: 32)
                    .fill(.ultraThinMaterial)
                    .padding()
                    

                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {

                        if acceptedSkills.isEmpty {
                            Text("No accepted courses yet.")
                                .foregroundColor(.gray)
                        } else {
                            ForEach(acceptedSkills) { skill in
                                courseCard(skill)
                                    .padding(.top, 10)
                                    
                            }
                        }

                        Spacer()
                    }
                    .padding()
                }
            }
            .navigationTitle("My Courses")
        }
    }
        
        @ViewBuilder
        func courseCard(_ skill: Skill) -> some View {
            VStack(alignment: .leading, spacing: 10) {
                Text(skill.topic)
                    .font(.headline)
                
                Text(skill.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                HStack {
                    if let videoURL = skill.videoURL, let url = URL(string: videoURL) {
                        Link("Watch Video", destination: url)
                            .buttonStyle(.borderedProminent)
                    }
                    
                    if let pdfURL = skill.pdfURL, let url = URL(string: pdfURL) {
                        Link("View PDF", destination: url)
                            .buttonStyle(.bordered)
                    }
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(LinearGradient(
                        colors: [.mint, .teal.opacity(0.8)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))
            )
            .foregroundStyle(.white)
            .shadow(radius: 4)
        }
    }

#Preview {
    MyCoursesView()
}
