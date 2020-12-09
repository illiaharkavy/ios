//
//  Question.swift
//  Quiz
//
//  Created by ILLIA HARKAVY on 25.11.20.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Question: Codable {
    
    let text: String
    let answers: [String]
    
    static func getAll(completion: @escaping (Result<[Question], Error>) -> Void) {
        Firestore.firestore().collection("questions").getDocuments { snapshot, error in
            if let snapshot = snapshot {
                do {
                    let questions = try snapshot.documents.map({ try Firestore.Decoder().decode(Question.self, from: $0.data()) })
                    completion(.success(questions))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(error!))
            }
        }
    }
}
