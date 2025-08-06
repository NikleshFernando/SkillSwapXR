//
//  StorageManager.swift
//  SkillSwapXR
//
//  Created by Niklesh Fernando on 2025-06-26.
//

import Foundation


final class StorageManager {
    static let shared = StorageManager()

    private init() {}

    func save<T: Codable>(_ data: T, to filename: String) {
        let url = getDocumentsDirectory().appendingPathComponent(filename)
        if let encoded = try? JSONEncoder().encode(data) {
            try? encoded.write(to: url)
        }
    }

    func load<T: Codable>(_ type: T.Type, from filename: String) -> T? {
        let url = getDocumentsDirectory().appendingPathComponent(filename)
        guard let data = try? Data(contentsOf: url) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }

    private func getDocumentsDirectory() -> URL {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
}
