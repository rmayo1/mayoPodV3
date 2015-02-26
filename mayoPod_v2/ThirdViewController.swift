//
//  ThirdViewController.swift
//  mayoPod_v2
//
//  Created by Robert Mayo on 2/15/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet weak var songRemoveSongField: UITextField!
    @IBOutlet weak var songRemoveArtistField: UITextField!
    @IBOutlet weak var songRemoveButton: UIButton!
    @IBOutlet weak var albumRemoveTitleField: UITextField!
    @IBOutlet weak var albumRemoveArtistField: UITextField!
    @IBOutlet weak var albumRemoveButton: UIButton!
    @IBOutlet weak var playlistRemoveField: UITextField!
    @IBOutlet weak var playlistRemoveButton: UIButton!
    
    ///////////////////// Singleton Code ///////////////////////////
    
    var theSongsModel: sharedSongModel = sharedSongModel.theSharedSongModel
    
    ////////////////////////////////////////////////////////////////
    
    @IBAction func songRemoval(sender: UIButton) {
        let songName = String(songRemoveSongField.text as NSString)
        let songArtist = String(songRemoveArtistField.text as NSString)

        var valid = true
        if songName == "" || songArtist == ""{
            valid = false
        }
        if valid == true{
            var count = 0
            
            var found = false
            for i in theSongsModel.songList {
                i.getSongName()
                
                if i.getSongName() == songName {
                    if i.getSongArtist() == songArtist{
                        removeSong(count)
                        found = true
                        
                    }
                }
                count++
            }
            if found == true{
                refreshUI()
                let alertController = UIAlertController(title: "SUCCESS", message:
                    "The song has been removed!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "GET IT OUTTA HERE!", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)

            } else {
                let alertController = UIAlertController(title: "ERROR", message:
                    "Couldn't find the song. Sure its in here?", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "I am sorry for my error, sensei.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        } else {
            let alertController = UIAlertController(title: "Error", message:
                "Song information is empty. Fill it up!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Yes sir, yes sir!", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func removeSong(songIndex: Int) {
        theSongsModel.songList.removeAtIndex(songIndex)
    }
    
    func removeAlbum(songIndex: Int) {
        theSongsModel.albumList.removeAtIndex(songIndex)
    }
    
    func removePlaylist(songIndex: Int) {
        theSongsModel.playlistList.removeAtIndex(songIndex)
    }
    
    @IBAction func albumRemoval(sender: UIButton) {
        let albumName = String(albumRemoveTitleField.text as NSString)
        let albumArtist = String(albumRemoveArtistField.text as NSString)
        
        var valid = true
        if albumName == ""{
            valid = false
        }
        if valid == true{
            var count = 0
            var found = false
            for i in theSongsModel.albumList {
                if i.getAlbumName() == albumName{
                    if i.getArtistName() == albumArtist {
                        found = true
                        removeAlbum(count)
                    }
                }
                count++
            }
            
            if found == true{
                refreshUI()
                let alertController = UIAlertController(title: "SUCCESS", message:
                    "The album has been removed!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Good riddance", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                
            } else {
                let alertController = UIAlertController(title: "ERROR", message:
                    "Couldn't find the album. Sure its in here?", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Let me check again.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        } else {
            let alertController = UIAlertController(title: "Error", message:
                "You know you left it blank, right?.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Um, ah, of course. Intentional.", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }

    @IBAction func playlistRemoval(sender: UIButton) {
        let playListName = String(playlistRemoveField.text as NSString)
        if playListName != "" {
            var found = false
            var count = 0
            for i in theSongsModel.playlistList{
                if playListName == i.plistName{
                    removePlaylist(count)
                    found = true

                }
            }
            if found == true {
                let alertController = UIAlertController(title: "SUCCESS", message:
                    "The playlist has been removed!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Aight, man", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            } else if found == false{
                let alertController = UIAlertController(title: "Error", message:
                    "What playlist is that? I couldn't find it.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Huh.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        } else {
            let alertController = UIAlertController(title: "Error", message:
                "The playlist is blank, man...", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "So say we all.", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    func refreshUI() {
        songRemoveSongField.text = ""
        songRemoveArtistField.text = ""
        albumRemoveTitleField.text = ""
        albumRemoveArtistField.text = ""
        playlistRemoveField.text = ""
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}