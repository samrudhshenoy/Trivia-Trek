//
//  Score.swift
//  Trivia Trek
//
//  Created by Arthur Lafrance on 2/21/19.
//  Copyright © 2019 Homestead FBLA. All rights reserved.
//

import UIKit
import CloudKit

class Game: NSObject {

    var score: Int
    var date: Date!
    var record: CKRecord
    
    override init() {
        self.date = Date()
        self.score = 0
        self.record = CKRecord(recordType: "Game")
        
        super.init()
    }
    
    init(fromRecord record: CKRecord) {
        let database = CKContainer.default().publicCloudDatabase

        let query = CKQuery(recordType: "Question", predicate: NSPredicate(value: true))

        database.perform(query, inZoneWith: nil, completionHandler: { questions, error in
            if error != nil {

                print("Query failed with error \(error?.localizedDescription ?? "none")")

            }
            else {

                for questionRecord in questions! {

                    let queue = DispatchQueue(label: "questionQuery")
                    
                    queue.sync {
                        
                        let currentQuestion = Question(fromRecord: questionRecord)
                        self.questions.append(currentQuestion)
                        
                    }
                    
                }

            }

        })
    }
    
    func addToDatabase() {
        let db = CKContainer.default().privateCloudDatabase
        
        self.record.setObject(self.score as __CKRecordObjCValue, forKey: "score")
        
        db.save(record, completionHandler: { record, error in })
    }
    
    func getDate() {
        
        var start = self.date.description.startIndex
        var end = self.date.description.firstIndex(of: "-")
        var dateComponents: [String] = []
        
        while end != nil {
            
            let component = String(self.date.description[start..<end!])
//            start = self.date.description.index(after: end!)
//            end = self.date.description.index
            
        }
        
//        var fullStr = self.date.description
//        var separator = fullStr.firstIndex(of: "-")
//        let year = String(fullStr[fullStr.startIndex..<separator!])
//
//        fullStr = String(fullStr[separator!..<fullStr.endIndex])
//        separator = fullStr.firstIndex(of: "-")
//        let month =
    }
    
}

extension String {
    
    func index(of char: Character, after start: String.Index?) -> String.Index {
        
        var start = start
        
        if start == nil {
            start = self.startIndex
        }

        // find relevant subset of string from start -> end
        var subset = String(self[self.startIndex..<start!])
        
        // offset start by distance from startIndex
        // find char in subset
        // scale back index in subset and return it
        
    }
    
}
