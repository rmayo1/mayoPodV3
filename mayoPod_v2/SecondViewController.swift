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
            for song in artistList {
                
            }
            //sortedTextView.text = artList
        } else if sortSegmenter.selectedSegmentIndex==2{
            var albumList = theSongsModel.albumList.sorted{$0.name < $1.name}
            for album in albumList {
                
            }
            //sortedTextView.text = artList
        } else if sortSegmenter.selectedSegmentIndex==3{
            var playlistList = theSongsModel.playlistList.sorted{$0.plistName < $1.plistName}
            for playlist in playlistList {
                
            }
            //sortedTextView.text = artList
        }
        //sortedTextView.text = theSongsModel.songList[0].getSongName()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}