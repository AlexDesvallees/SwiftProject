//
//  ViewController.swift
//  NoteStudentsManager
//
//  Created by iMacFabLab2 on 10/01/2017.
//  Copyright © 2017 Ynov. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    
    var note: NoteClassViewController
    
    //RealmConnexion & Actions
    
    static func addNote(note: NoteClassViewController){
        let realm = try! Realm()
        try! realm.write(){
            realm.add(note)
        }
    }
    
    static func updateNote(oldNote: NoteClassViewController, newNote: NoteClassViewController){
        let realm = try! Realm()
        try! realm.write(){
            oldNote.title = newNote.title
            oldNote.content = newNote.content
            oldNote.modificationTime = newNote.modificationTime
        }
    }
    
    static func deleteNote(note: NoteClassViewController){
        let realm = try! Realm()
        try! realm.write(){
            realm.delete(note)
        }
    }
    
    static func retrieveNotes() -> Results<NoteClassViewController> {
        let realm = try! Realm()
        return realm.objects(Note).sorted("modificationTime", ascending: false)
    }
    
    //Function section
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func calculateGradeWithoutFinal() -> Double {
        var temp:Int = 0
        
        for element in gradesWithoutFinalExam //Mettre la liste de notes <-- voir la Realm
        {
            temp += element
        }
        
        resultWithoutFinalExam = Double(temp / tabOfFinalGrade)
        
        return resultWithoutGradeFinalExam
    }
    
    //IBAction section
    
    @IBAction func BtnAjoutNote(_ sender: UIButton) {
        
        
    }
    
    @IBAction func BtnCalculMoyenne(_ sender: UIButton) -> Double{
        
        var moyenne: Double
        
        moyenne = calculateGradeWithoutFinal()
        
        return moyenne
        
    }
    
    
    
}

