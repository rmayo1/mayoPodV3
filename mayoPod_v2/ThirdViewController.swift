//
//  ThirdViewController.swift
//  mayoPod_v2
//
//  Created by Robert Mayo on 2/15/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//  by Ali Akhtar, Joshua Chang, Robert Mayo, Joe Delia, Grayson Wilkins

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
    
    ////////////////////////////////////////////////////////////////
    
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
            var foundInPlaylist = false
            // goes through songList in singleton
            for i in theSongsModel.songList {
                // if songName entered and songArtist entered match a song's info, removes song, marks found boolean as true
                if i.getSongName() == songName {
                    if i.getSongArtist() == songArtist{
                        for plist in sharedSongModel.theSharedSongModel.playlistList {
                            for song in plist.getSongList() {
                                if song.getSongName() == songName {
                                    foundInPlaylist = true
                                }
                            }
                        }
                        if foundInPlaylist == false {
                            removeSong(count)
                            found = true
                        }
                    }
                }
                count++
            }
            // if song was removed...
            if foundInPlaylist == true{
                // refreshes UI and alerts user.
                refreshUI()
                let alertController = UIAlertController(title: "ERROR", message:
                    "The song can't be removed, its in a playlist.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Oh, I'll go fix that.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }else if found == true{
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
    //Author: Ali
    //Purpose: Removes album at a given index.
    //Input: Integer for song index
    func removeAlbum(songIndex: Int) {
        theSongsModel.albumList.removeAtIndex(songIndex)
    }
    
    //Func: removePlaylist
    //Last Modified: 2/26/15
    //Author: Ali
    //Purpose: Removes playlist at a given index.
    //Input: Integer for song index
    func removePlaylist(songIndex: Int) {
        theSongsModel.playlistList.removeAtIndex(songIndex)
    }
    
    //Func: albumRemoval
    //Last Modified: 2/26/15
    //Author: Ali
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
                refreshUI()
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
    
    //Func: editPlaylist
    //Last Modified: 3/1/15
    //Author: Rob + Joe
    //Purpose: Adds an entered song into an entered playlist
    //Input: Button click
    @IBAction func editPlaylist(sender: UIButton) {
        // initializes values from fields for playlist adding
        let playListName = String(plistName.text as NSString)
        let songName = String(plistSongName.text as NSString)
        let artistName = String(plistArtistName.text as NSString)
        
        // initializes boolean to true, sets to false if any field is blank
        var valid = true
        if playListName == "" || songName == "" || artistName == "" {
            valid = false
        }
        //if the fields are filled...
        if valid == true {
            // sets boolean for if song is real, and is the playlist is found
            var realSong = false
            var foundPlayList = false
            //goes through list of all songs
            for song in theSongsModel.songList {
                // if songs name + song artist entered matches one in the master song list
                if song.getSongName() == songName {
                    if song.getSongArtist() == artistName {
                        // sets song as true, searches for playlist
                        realSong = true
                        for plist in theSongsModel.playlistList {
                            // if playlist is found, marks found as true and adds song to playlist
                            if plist.getPlaylistName() == playListName {
                                foundPlayList = true
                                plist.addSongToPlaylist(song)
                            }
                        }
                    }
                }
            }
            if realSong == false{
                // song doesn't exist
                let alertController = UIAlertController(title: "Error", message:
                    "Couldn't find the song, honey.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK, baby, I'll solve this.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            } else if realSong == true && foundPlayList == false{
                // Playlist not found
                let alertController = UIAlertController(title: "Error", message:
                    "Found the song, but you sure this here playlist exists?", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "I can double check...", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            } else if realSong == true && foundPlayList == true{
                    //Song entered to new playlist
                    let alertController = UIAlertController(title: "Success", message:
                        "Song has been entered into the playlist.", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Cool beans.", style: UIAlertActionStyle.Default,handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
            }
        }else{
            //an input field is missing
            let alertController = UIAlertController(title: "Error", message:
                "Fill out the forms, bucko.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "I'll fix that.", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    //Func: removeSongFromPlaylist
    //Last Modified: 3/1/15
    //Author: Rob + Joe
    //Purpose: Removed a song from a playlist.
    //Input: Button click
    @IBAction func removeSongFromPlaylist(sender: AnyObject) {
        // initializes values from entered field values for removal
        let playListName = String(plistName.text as NSString)
        let songName = String(plistSongName.text as NSString)
        let artistName = String(plistArtistName.text as NSString)
        // initializes boolean to true, sets to false if a field is empty
        var valid = true
        if playListName == "" || songName == "" || artistName == "" {
            valid = false
        }
        // if fields are filled...
        if valid == true {
            // initialises booleans for is playlist and song is found
            var playListFound = false
            var songFound = false
            // goes through list of playlists
            for plist in theSongsModel.playlistList {
                // if playlist entered matches an existing playlist...
                if plist.getPlaylistName() == playListName {
                    // sets playlist found to true, goes through songs in playlist
                    playListFound = true
                    for song in plist.getSongList(){
                        // if songfield info matches an existing song...
                        if song.getSongArtist() == artistName {
                            if song.getSongName() == songName {
                                // sets song found to true, removes song from list.
                                songFound = true
                                plist.removeSongFromPlaylist(song)
                            }
                        }
                    }
                }
            }

            if playListFound==true && songFound == false{
                //Playlist name dost exist, but song doesn't
                let alertController = UIAlertController(title: "Error", message:
                    "Found the playlist, but that song doesn't exist.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "I can fix it.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            } else if playListFound == false{
                //Song by artist doesn't exist
                let alertController = UIAlertController(title: "Error", message:
                    "Playlist was not found.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Forgive me, oh great Mayopod.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            } else if songFound == true && playListFound == true{
                // song found, and song removed
                refreshUI()
                let alertController = UIAlertController(title: "Success", message:
                    "Song removed from the playList.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Hella.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }else{
            //an input field is missing
            let alertController = UIAlertController(title: "Error", message:
                "You seem to be missing something. Please fill out the song name, artist and playlist name.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "I'll fix that.", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
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
        plistArtistName.text = ""
        plistName.text = ""
        plistSongName.text = ""
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}