//
//  DisplayNoteViewController.swift
//  MakeSchoolNotes
//
//  Created by Chris Orcutt on 1/10/16.
//  Copyright © 2016 MakeSchool. All rights reserved.
//

import UIKit

class DisplayNoteViewController: UIViewController {
    var note: Note?
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let note = note {
            noteTitleTextField.text = note.title
            noteContentTextView.text = note.content

        } else {
            noteTitleTextField.text = ""
            noteContentTextView.text = ""
        }
    }
    @IBOutlet weak var noteTitleTextField: UITextField!
    @IBOutlet weak var noteContentTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            let listNotesTableViewController = segue.destinationViewController as! ListNotesTableViewController
            if identifier == "Save" {
                if let note = note {
                    let newNote = Note()
                    newNote.title = noteTitleTextField.text ?? ""
                    newNote.content = noteContentTextView.text ?? ""
                    RealmHelper.update(note, newNote: newNote)
                } else {
                    let note = Note()
                    note.title = noteTitleTextField.text ?? ""
                    note.modificationTime = NSDate()
                    note.content = noteContentTextView.text
                    RealmHelper.add(note)
                }
                listNotesTableViewController.notes = RealmHelper.retrieve()
            }
        }
    }
}
