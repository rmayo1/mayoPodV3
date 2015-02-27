//
//  sharedSongModel.swift
//  mayoPod_v2
//
//  Created by Grayson Wilkins on 2/20/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import Foundation

private let _songModelSharedInstance = sharedSongModel()
//Class: sharedSongModel
//Author: Josh
//Last Modified: 2/24/15
//Purpose: singleton that holds the master song list, album list, playlist lists.
//          Allows sharing between the view controllers
//Parameters: none
class sharedSongModel {
    // Initalize the singeton instances for shared data
    var songList: [Song]//master list of songs
    var albumList: [Album]//master list of playlists
    var playlistList: [Playlist]//master list of albums
    
    
    //sharedSongModel Constructor
    init(){
        songList = [Song]()//view controllers will reference this same instance for songList
        albumList = [Album]()//view controlers will reference this same instance for albumList
        playlistList = [Playlist]()//view controllers will reference this same instace for playlistList
        // start with an empty song in the list
    }
    //Method: addSong
    //Author: Rob
    //Last Modified: 2/24/15
    //Purpose: add song to the master list
    func addSong(newSong:Song){
        songList.append(newSong)
    }
    //////////////////////test////////
    //func getFirstSongName()->NSString{
        //return songList[0].name
    //}
    /////////////////////////////////
    
    //return this sharedSongModel instance
    class var theSharedSongModel: sharedSongModel {
        return _songModelSharedInstance
    }
}
