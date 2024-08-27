//
//  JSONFilesManager.swift
//  MyBudget
//
//  Created by A.Hazzaa on 27/08/2024.
//

import Foundation

class JSONFilesManager {
    
    static func writeJSONFileWith<T: Encodable>(name: String, data: T) {
        
        do {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsDirectory.appendingPathComponent("\(name).json")
            
            if FileManager.default.fileExists(atPath: fileURL.path) {
                try FileManager.default.removeItem(at: fileURL)
            }
            
            try JSONEncoder().encode(data).write(to: fileURL)
            
        } catch {
            print("Error writing data: \(error.localizedDescription)")
        }
    }
    
    static func readJSONFileWith<T: Decodable>(name: String) -> T? {
        
        do {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let jsonFilePath = documentsDirectory.appendingPathComponent("\(name).json")
            if FileManager.default.fileExists(atPath: jsonFilePath.path) {
                let data = try Data(contentsOf: jsonFilePath)
                
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                print("Data read successfully.")
                return decodedData
            } else {
                print("No data found at path:", jsonFilePath.path)
                return nil
            }
        } catch {
            print("Error reading data: \(error.localizedDescription)")
            return nil
        }
        
    }
}
