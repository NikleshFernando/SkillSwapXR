//
//  SkillUploadView.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-26.
//

import SwiftUI

struct SkillUploadView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var skillStore: SkillDataStore

    @State private var topic: String = ""
    @State private var description: String = ""
    @State private var pdfURL: URL?
    @State private var videoURL: URL?
    @State private var showFileImporter = false
    @State private var importingPDF = false

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Skill Details")) {
                    TextField("Skill Topic", text: $topic)
                    TextField("Description", text: $description)
                }

                Section(header: Text("Optional Materials")) {
                    Button("Select PDF") {
                        importingPDF = true
                        showFileImporter = true
                    }

                    Button("Select Video") {
                        importingPDF = false
                        showFileImporter = true
                    }

                    if let pdfURL = pdfURL {
                        Text("PDF: \(pdfURL.lastPathComponent)")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }

                    if let videoURL = videoURL {
                        Text("Video: \(videoURL.lastPathComponent)")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }

                Button("Save Skill") {
                    let newSkill = Skill(
                        topic: topic,
                        description: description,
                        videoURL: videoURL?.absoluteString,
                        pdfURL: pdfURL?.absoluteString
                    )
                    skillStore.addSkill(newSkill)
                    dismiss()
                }
                .disabled(topic.isEmpty || description.isEmpty)
            }
            .navigationTitle("Add Skill")
            .fileImporter(
                isPresented: $showFileImporter,
                allowedContentTypes: importingPDF ? [.pdf] : [.movie, .video],
                allowsMultipleSelection: false
            ) { result in
                switch result {
                case .success(let urls):
                    if let selectedURL = urls.first {
                        if importingPDF {
                            self.pdfURL = selectedURL
                        } else {
                            self.videoURL = selectedURL
                        }
                    }
                case .failure(let error):
                    print("File import error: \(error.localizedDescription)")
                }
            }
        }
    }
}

struct SkillUploadView_Previews: PreviewProvider {
    static var previews: some View {
        SkillUploadView()
            .environmentObject(SkillDataStore())
    }
}
