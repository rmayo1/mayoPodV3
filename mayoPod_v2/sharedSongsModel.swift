//
//  sharedSongModel.swift
//  mayoPod_v2
//
//  Created by Grayson Wilkins on 2/20/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//  by Ali Akhtar, Joshua Chang, Robert Mayo, Joe Delia, Grayson Wilkins

import Foundation

private let _songModelSharedInstance = sharedSongModel()
//Class: sharedSongModel
//Author: Josh
//Last Modified: 2/24/15
//Purpose: singleton that holds the master song list, album list, playlist lists.
//Allows sharing of info between the view controllers
//Parameters: none
class sharedSongModel {
    // Initalize the singeton instances for shared data
    var songList: [Song]//master list of songs
    var albumList: [Album]//master list of playlists
    var playlistList: [Playlist]//master list of albums
    
    
    // sharedSongModel Constructor
    // Author: Josh
    // Last Modified: 3/1/15]
    // Purpose: Initializes instance reference of sharedSongModel
    init(){
        songList = [Song]()//view controllers will reference this same instance for songList
        albumList = [Album]()//view controlers will reference this same instance for albumList
        playlistList = [Playlist]()//view controllers will reference this same instace for playlistList
        // start with an empty song in the list
    }
    //Method: addSong
    //Author: Joe
    //Last Modified: 2/24/15
    //Purpose: add song to the master list
    func addSong(newSong:Song){
        songList.append(newSong)
    }
    
    //return this sharedSongModel instance
    class var theSharedSongModel: sharedSongModel {
        return _songModelSharedInstance
    }
}
