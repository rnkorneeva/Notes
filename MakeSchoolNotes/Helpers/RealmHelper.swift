//
//  RealmHelper.swift
//  MakeSchoolNotes
//
//  Created by Irina Korneeva on 19/07/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import Foundation

import RealmSwift

class RealmHelper {
    static func add(object: Note) {
        let realm = try! Realm()
        try! realm.write() {
            realm.add(object)
        }
    }
    static func delete(object: Note) {
        let realm = try! Realm()
        try! realm.write() {
            realm.delete(object)
        }
    }
    static func update(noteToBeUpdated: Note, newNote:Note) {
        let realm = try! Realm()
        try! realm.write() {
            noteToBeUpdated.content = newNote.content
            noteToBeUpdated.title = newNote.title
            noteToBeUpdated.modificationTime = newNote.modificationTime
        }
    }
    static func retrieve() -> Results<Note> {
        let realm = try! Realm()
        return realm.objects(Note).sorted("modificationTime", ascending: false)
        
    }

}