//
//  FirstViewController.swift
//  mayoPod_v3
//
//  Created by Robert Mayo on 2/15/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//  by Ali Akhtar, Joshua Chang, Robert Mayo, Joe Delia, Grayson Wilkins

import UIKit

// Desc.: First view, responsible for adding songs.
// Last Modified: 2/22/15
// Author: Assorted
// Parameters: N/A
// Output: N/A
class FirstViewController: UIViewController {
    // declares/links UI elements that will be interacted with
    @IBOutlet weak var songNameField: UITextField!
    @IBOutlet weak var songArtistField: UITextField!
    @IBOutlet weak var songComposerField: UITextField!
    @IBOutlet weak var songAlbumField: UITextField!
    @IBOutlet weak var songProducerField: UITextField!
    @IBOutlet weak var songYearLbel: UILabel!
    @IBOutlet weak var songLengthLabel: UILabel!
    @IBOutlet weak var songLengthSlider: UISlider!
    @IBOutlet weak var songYearStepper: UIStepper!
    @IBOutlet weak var playlistName: UITextField!
    
    ///////////////////// Singleton Code ///////////////////////////
    // Description: Creates a reference to the instance of the singleton
    // Last Modified: 2/25/15
    // Author: Robert
    // Parameters: None
    // Output: N/A
    
    var theSongsModel: sharedSongModel = sharedSongModel.theSharedSongModel
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    ////////////////////////////////////////////////////////////////
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Desc.: Changes year on UI label to reflect slider change.
    // Last Modified: 2/22/15
    // Author: Robert
    // Parameters: Change in UIstepper
    // Output: N/A
    @IBAction func songYearStep(sender: UIStepper) {
        //sets label text value as sent value form user click
        songYearLbel.text = Int(sender.value).description
    }
    
    // Desc.: Changes UIlabel to reflect slider change to Min:Sec
    // Last Modified: 2/22/15
    // Author: Robert
    // Parameters: Change in UI slider activates
    // Output: N/A
    @IBAction func songLengthChange(sender: UISlider) {
        // sets constant variable second to equal value of slider modulo 60
        let seconds = (sender.value%60)
        // sets constant variable slider to total - seconds % 60
        let minutes = (sender.value-seconds)/60
        // sets UIlabel text to be a string of minutes:seconds
        songLengthLabel.text = String(Int(minutes))+":"+String(Int(seconds))
        // adds a zero before seconds if second is less than 10.
        if seconds < 10{
            songLengthLabel.text = String(Int(minutes))+":0"+String(Int(seconds))
        }
    }
    
    // Desc.: Adds song to masterList
    // Last Modified: 2/22/15
    // Author: Joe
    // Parameters: Takes button click.
    // Output: N/A
    @IBAction func addSong(sender: AnyObject) {
        // songField/stepper/slider values taken, assigned to constants
        let songName = String(songNameField.text as NSString)
        let songArtist = String(songArtistField.text as NSString)
        let songAlbum = String(songAlbumField.text as NSString)
        let songComposer = String(songComposerField.text as NSString)
        let songLength = (songLengthSlider.value)
        let songYear = (Int(songYearStepper.value))
        let songProducer = String(songProducerField.text as NSString)
        // checks if song/artist/composer is blank, is false if so.
        var valid = true
        if songName == "" || songArtist == "" || songComposer == ""{
            valid = false
        }
        // if song/artist/composer field are filled...
        if valid == true{
            // creates an instance of song with previously created constants.
            let newSong = Song(song: songName, artist:songArtist, year: songYear,length:songLength,composer:songComposer,album:songAlbum)
            // checks if song is already in the master song list.
            var alreadyEntered = false
            for i in theSongsModel.songList {
                if i.getSongName() == songName{
                    // if songName and songArtist are the same as a song in the master list, assigns alreadyEntered to True
                    if i.getSongArtist() == songArtist{
                        
                        alreadyEntered = true
                    }
                }
            }
            refreshUI()
            // if the song hasn't been entered...
            if alreadyEntered == false{
                // appends song to singleton song list
                theSongsModel.songList.append(newSong)
                // creates an alert screen with a success statement
                let alertController = UIAlertController(title: "SUCCESS", message:
                    "The song has been successfully added.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Sweet, thanks.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                // if the song album field is filled, checks if album is already created,
                if songAlbum != ""{
                    var foundAlbum = false
                    for i in theSongsModel.albumList{
                        if songAlbum == i.getAlbumName(){
                            // if found, appends song to album
                            foundAlbum = true
                            i.addSongToAlbum(newSong)
                        }
                    }
                    //if album isn't found, creates the album.
                    if foundAlbum == false{
                        let newAlbum = Album(albumName: songAlbum, artist: songArtist, year: songYear, producer: songProducer)
                        theSongsModel.albumList.append(newAlbum)
                        newAlbum.addSongToAlbum(newSong)
                    }
                }
            } else {
                // if song was already entered, creates an alert stating that the song has already been entered
                let alertController = UIAlertController(title: "ERROR", message:
                    "The song has already been added, will not be entered again.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Sweet, thanks.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        } else {
            // if fields must be filled, creates an alert telling the user that they must fill certain fields.
            let alertController = UIAlertController(title: "ERROR", message:
                "Song name, artist and composer fields must be filled. Album and producer may be left empty.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Sweet, thanks.", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    // Desc.: Adds song to masterList
    // Last Modified: 2/27/15
    // Author: Joe
    // Parameters: Takes button click.
    // Output: N/A
    @IBAction func addPlaylist(sender: AnyObject) {
        // initializes playlist from textfield
        let plistName = String(playlistName.text as NSString)
        
        // initializes boolean that will mark whether playListField is empty
        var valid = true
        if plistName == "" {
            valid = false
        }
        // if not empty, creates a new playlist.
        if valid == true {
            let newPlist = Playlist(name: plistName)
            // checks if playList is already in the playlistList
            var alreadyEntered = false
            //goes through playlistList, changed alreadyEntered boolean to true if already entered
            for plist in theSongsModel.playlistList {
                if plist.getPlaylistName() == plistName {
                    alreadyEntered = true
                }
            }
            // refreshes UI
            refreshUI()
            // if playlist was added succesfully, alerts user
            if alreadyEntered == false {
                theSongsModel.playlistList.append(newPlist)
                
                let alertController = UIAlertController(title: "SUCCESS", message:
                    "The playlist has been successfully added.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Sweet, thanks.", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            // if playlist was already in the playListList, alerts user
            else{
                let alertController = UIAlertController(title: "Error", message:
                    "The playlist has already been entered", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "What?", style: UIAlertActionStyle.Default,handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
        // if playlist field was empty, alerts user
        else {
            let alertController = UIAlertController(title: "Error", message:
                "Please fill out the playlist field.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Yes, dear.", style: UIAlertActionStyle.Default,handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
    }
    
    
    // Description: Refreshes the parameters for the user interface.
    // Last modified: 2/25/2015
    // Author: Ali
    // Parameters: None
    // Output: Fields updated
    func refreshUI(){
        songYearLbel.text = "2015"
        songYearStepper.value = 2015
        songNameField.text = ""
        songComposerField.text = ""
        songArtistField.text = ""
        songAlbumField.text = ""
        songProducerField.text = ""
        playlistName.text = ""
    }
    
}

