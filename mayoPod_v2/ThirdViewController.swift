//
//  ThirdViewController.swift
//  mayoPod_v2
//
//  Created by Robert Mayo on 2/15/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import UIKit

//Class: Third View Controllwe
//Last Modified: 2/26/15
//Author: Assorted
//Purpose: Hosts code for third view controller
class ThirdViewController: UIViewController {
    // declares interactive elements
    @IBOutlet weak var songRemoveSongField: UITextField!
    @IBOutlet weak var songRemoveArtistField: UITextField!
    @IBOutlet weak var songRemoveButton: UIButton!
    @IBOutlet weak var albumRemoveTitleField: UITextField!
    @IBOutlet weak var albumRemoveArtistField: UITextField!
    @IBOutlet weak var albumRemoveButton: UIButton!
    @IBOutlet weak var playlistRemoveField: UITextField!
    @IBOutlet weak var playlistRemoveButton: UIButton!
    
    @IBOutlet weak var plistSongName: UITextField!
    @IBOutlet weak var plistName: UITextField!
    @IBOutlet weak var plistArtistName: UITextField!
    ///////////////////// Singleton Code ///////////////////////////
    // declares an instance of the singleton model
    var theSongsModel: sharedSongModel = sharedSongModel.theSharedSongModel
    
    //Func: songRemoval
    //Last Modified: 2/26/15
    //Author: Robert
    //Purpose: Check if a song has been entered, remove if so
    //Input: Button click
    @IBAction func songRemoval(sender: UIButton) {
        // declare songName and songArtist variables from textField
        let songName = String(songRemoveSongField.text as NSString)
        let songArtist = String(songRemoveArtistField.text as NSString)
        
        // created boolean for whether fields are filled, set to false if either is empty
        var valid = true
        if songName == "" || songArtist == ""{
            valid = false
        }
        // if the fields are filled...
        if valid == true{
            // sets up count variable to be incremented as we go through the list
            var count = 0
            // initializes boolean for whether song has been found, defaults to false
            var found = false
            // goes through songList in singleton
            for i in theSongsModel.songList {
                // if songName entered and songArtist entered match a song's info, removes song, marks found boolean as true
                if i.getSongName() == songName {
                    if i.getSongArtist() == songArtist{
                        removeSong(count)
                        found = true
                    }
                }
                count++
            }
            // if song was removed...
            if found == true{
                // refreshes UI and alerts user.
                refreshUI()
                let alertController = UIAlertController(title: "SUCCESS", message:
                    "The song has been removed!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "GET IT OUTTA HERE!", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            } else{
                // if song wasn't found, alerts error statement.
                let alertController = UIAlertController(title: "ERROR", message:
                    "Couldn't find the song. Sure its in here?", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "I am sorry for my error, sensei.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        } else {
            // if fields weren't filled, alerts user.
            let alertController = UIAlertController(title: "Error", message:
                "Song information is empty. Fill it up!", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Yes sir, yes sir!", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    
    //Func: removeSong
    //Last Modified: 2/26/15
    //Author: Ali
    //Purpose: Removes song at a given index.
    //Input: Integer for song index
    func removeSong(songIndex: Int) {
        theSongsModel.songList.removeAtIndex(songIndex)
    }
    
    //Func: removeAlbum
    //Last Modified: 2/26/15
    //Author: Rob
    //Purpose: Removes album at a given index.
    //Input: Integer for song index
    func removeAlbum(songIndex: Int) {
        theSongsModel.albumList.removeAtIndex(songIndex)
    }
    
    //Func: removePlaylist
    //Last Modified: 2/26/15
    //Author: Rob
    //Purpose: Removes playlist at a given index.
    //Input: Integer for song index
    func removePlaylist(songIndex: Int) {
        theSongsModel.playlistList.removeAtIndex(songIndex)
    }
    
    //Func: albumRemoval
    //Last Modified: 2/26/15
    //Author: Rob
    //Purpose: Compares info in two fields to list of albums, removes album is found
    //Input: Button click
    @IBAction func albumRemoval(sender: UIButton) {
        //  declares albumName and albumArtist strings based on info in fields
        let albumName = String(albumRemoveTitleField.text as NSString)
        let albumArtist = String(albumRemoveArtistField.text as NSString)
        
        // created boolean for whether fields are filled, set to false if either is empty
        var valid = true
        if albumName == ""{
            valid = false
        }
        // if the fields are filled...
        if valid == true{
            // sets up count variable to be incremented as we go through the list
            var count = 0
            // initialized found booean to false, used for if album is found in albumList
            var found = false
            // goes through album list. If albumName/albumArtist matches info of an entered album, removes from albumList + sets found to true
            for i in theSongsModel.albumList {
                if i.getAlbumName() == albumName{
                    if i.getArtistName() == albumArtist {
                        found = true
                        removeAlbum(count)
                    }
                }
                //iterates count
                count++
            }
            // if album was removed, alerts user and refreshes UI
            if found == true{
                refreshUI()
                let alertController = UIAlertController(title: "SUCCESS", message:
                    "The album has been removed!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Good riddance", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                
            }
            // if album wasn't found, alerts user
            else {
                let alertController = UIAlertController(title: "ERROR", message:
                    "Couldn't find the album. Sure its in here?", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Let me check again.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        // if fields were empty, alerts user.
        else {
            let alertController = UIAlertController(title: "Error", message:
                "You know you left it blank, right?.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Um, ah, of course. Intentional.", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }

    //Func: playlistRemoval
    //Last Modified: 2/26/15
    //Author: Rob
    //Purpose: Compares info in playlist, removes playlist if found
    //Input: Button click
    @IBAction func playlistRemoval(sender: UIButton) {
        // sets playlistName to textfield text
        let playListName = String(playlistRemoveField.text as NSString)
        // if not empty,
        if playListName != "" {
            // initializes found variable as false, sets count to zero
            var found = false
            var count = 0
            // goes through playlistList, if value entered is the same as a playlist, removes and marks found as true.
            for i in theSongsModel.playlistList{
                if playListName == i.plistName{
                    removePlaylist(count)
                    found = true

                }
                count++
            }
            // if playlist was removed, alerts user and refreshes UI
            if found == true {
                let alertController = UIAlertController(title: "SUCCESS", message:
                    "The playlist has been removed!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Aight, man", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            // if playlist wasn't found, alerts user
            else if found == false{
                let alertController = UIAlertController(title: "Error", message:
                    "What playlist is that? I couldn't find it.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Huh.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        // if playlist text field was empty, alerts user.
        else {
            let alertController = UIAlertController(title: "Error", message:
                "The playlist is blank, man...", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "So say we all.", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func editPlaylist(sender: UIButton) {
        let playListName = String(plistName.text as NSString)
        let songName = String(plistSongName.text as NSString)
        let artistName = String(plistArtistName.text as NSString)
        
        var valid = true
        if playListName == "" || songName == "" || artistName == "" {
            valid = false
        }
        
        if valid == true {
            var realSong = false
            for song in theSongsModel.songList {
                if song.getSongName() == songName {
                    if song.getSongArtist() == artistName {
                        for plist in theSongsModel.playlistList {
                            if plist.getPlaylistName() == playListName {
                                plist.addSongToPlaylist(song)
                            }else{
                                //Playlist name doesn't exist
                            }
                        }
                    }else{
                        //Artist isn't associated with song
                    }
                }else{
                    //Song Name doesn't exist
                }
            }
        }else{
            //an input field is missing
        }
    }
    
    
    
    //Func: refreshUI
    //Last Modified: 2/26/15
    //Author: Joe
    //Purpose: Sets UI elements to blank
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