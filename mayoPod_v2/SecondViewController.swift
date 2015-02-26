//
//  SecondViewController.swift
//  mayoPod_v2
//
//  Created by Robert Mayo on 2/15/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var sortedTextView: UITextView!
    @IBOutlet weak var sortSegmenter: UISegmentedControl!
    
    ///////////////////// Singleton Code ///////////////////////////
    
    var theSongsModel: sharedSongModel = sharedSongModel.theSharedSongModel
    
    ////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        //sortSegmenter.selectedSegmentIndex == 0
        super.viewDidLoad()
    }
    
    @IBAction func sortSegment(sender: UISegmentedControl) {
        if sortSegmenter.selectedSegmentIndex==0{
            var songList = theSongsModel.songList.sorted{$0.name < $1.name}
            var toText: String = ""
            for song in songList {
                toText += (song.name + " by: " + song.artist + "\n")
            }
            sortedTextView.text = toText
        } else if sortSegmenter.selectedSegmentIndex==1{
            var artistList = theSongsModel.songList.sorted{$0.artist < $1.artist}
            var toText: String = ""
            for song in artistList {
                toText += (song.artist + ": " + song.name + "\n")
            }
            sortedTextView.text = toText
        } else if sortSegmenter.selectedSegmentIndex==2{
            var albumList = theSongsModel.albumList.sorted{$0.name < $1.name}
            var toText = ""
            for album in albumList {
                toText += (album.name + " by: " + album.artist + "\n")
                //for song in album {
                    //toText += (song.name + " by: " + song.artist + "\n")
                //}
            }
            sortedTextView.text = toText
        } else if sortSegmenter.selectedSegmentIndex==3{
            var playlistList = theSongsModel.playlistList.sorted{$0.plistName < $1.plistName}
            var toText = ""
            for playlist in playlistList {
                toText += (playlist.plistName + ": " + "\n")
                //for Song in playlistList {
                    //toText += (song.name + " by: " + song.artist + "\n")
                //}
            }
            sortedTextView.text = toText
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}