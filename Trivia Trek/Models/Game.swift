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
        self.date = Date()
        self.score = 0
        self.record = CKRecord(recordType: "Game")
        
        super.init()
    }
    
    func addToDatabase() {
        let db = CKContainer.default().privateCloudDatabase
        
        self.record.setObject(self.score as __CKRecordObjCValue, forKey: "score")
        
        db.save(record, completionHandler: { record, error in })
    }
    
    func getDateStr() -> String {
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter.string(from: self.date)
        
    }
    
}
