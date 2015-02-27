//
//  SecondViewController.swift
//  mayoPod_v2
//
//  Created by Robert Mayo on 2/15/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import UIKit
// Desc.: Second view, responsible listing songs, artist, albums, and playlists.
// Last Modified: 2/22/15
// Author: Assorted
// Parameters: N/A
// Output: N/A

class SecondViewController: UIViewController {
    // declares/links UI elements that will be interacted with
    @IBOutlet weak var sortedTextView: UITextView!
    @IBOutlet weak var sortSegmenter: UISegmentedControl!
    
    ///////////////////// Singleton Code ///////////////////////////
    // Description: Creates a reference to the instance of the singleton
    // Last Modified: 2/25/15
    // Author: Robert
    // Parameters: None
    // Output: N/A
    
    var theSongsModel: sharedSongModel = sharedSongModel.theSharedSongModel
    
    ////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Method: sortSegment
    //Last Modified: 2/24/15
    //Author: Grayson
    //Parameters: none
    //Output: none
    @IBAction func sortSegment(sender: UISegmentedControl) {
        //list all songs and thier artists in master list of songs alphabetically
        if sortSegmenter.selectedSegmentIndex==0{
            var songList = theSongsModel.songList.sorted{$0.name < $1.name} //sort songs alphabetically
            var toText: String = "" //string of songs, empty first
            //create the string of songs by adding one by one
            for song in songList {
                toText += (song.name + " by: " + song.artist + "\n")
            }
            sortedTextView.text = toText //display the string of songs
            
        //list all songs based on artist name alphabetically
        } else if sortSegmenter.selectedSegmentIndex==1{
            var artistList = theSongsModel.songList.sorted{$0.artist < $1.artist} //sort all artists by name alphabetically
            var toText: String = "" //string of songs, empty first
            //create the string of songs by adding one by one
            for song in artistList {
                toText += (song.name + " by: " + song.artist + "\n")
            }
            sortedTextView.text = toText //display the string of songs
            
        //list all songs based on album name alphabetically
        } else if sortSegmenter.selectedSegmentIndex==2{
            var albumList = theSongsModel.albumList.sorted{$0.name < $1.name} //sort all albums by name alphabetically
            var toText = "" //string on songs, empty first
            //create the string of songs by adding one by one
            for album in albumList {
                toText += (album.name + ": " + "\n")
                for song in album.getSongsInAlbum(){
                    toText += ("\t" + song.name + " by: " + song.artist + "\n")
                }
            }
            sortedTextView.text = toText //distplay the string of songs
            
        //list all songs based on playlist name alphabetically
        } else if sortSegmenter.selectedSegmentIndex==3{
            var playlistList = theSongsModel.playlistList.sorted{$0.plistName < $1.plistName}
            var toText = "" //string of songs, empty first
            //create the stirng of songs by adding one by one
            for playlist in playlistList {
                toText += (playlist.plistName + ": " + "\n")
                for song in playlist.getSongList(){
                    toText += ("\t" + song.name + " by: " + song.artist + "\n")
                }
            }
            sortedTextView.text = toText//display the string of songs
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}