//
//  ViewController.swift
//  Silly Song
//
//  Created by Hend Mahmoud on 3/31/17.
//  Copyright © 2017 Hend Mahmoud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joinWithSeparator( "\n")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reset(sender: AnyObject) {
        nameField.text=""
    }

    @IBAction func displayLyrics(sender: AnyObject) {
        let result = lyricsForName(bananaFanaTemplate, fullName: nameField.text!)
        lyricsView.text = result
    }
    
    func shortNameFromName(name: String) -> String {
        var shortName = name.lowercaseString
        shortName.removeAtIndex(shortName.startIndex)
        print(shortName)
        return shortName
    }
   
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        let someName = shortNameFromName(fullName)
        let lyrics = lyricsTemplate.stringByReplacingOccurrencesOfString("<FULL_NAME>", withString:fullName).stringByReplacingOccurrencesOfString("<SHORT_NAME>", withString: someName)
        
        return lyrics
    }


}

