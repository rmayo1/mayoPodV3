//
//  sharedSongModel.swift
//  mayoPod_v2
//
//  Created by Grayson Wilkins on 2/20/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import Foundation
private let _songModelSharedInstance = sharedSongModel()

class sharedSongModel {
    
    var songList: [Song]
    var albumList: [Album]
    var playlistList: [Playlist]
    
    init(){
        songList = [Song]()
        albumList = [Album]()
        playlistList = [Playlist]()
        // start with an empty song in the list
    }
    
    func addSong(newSong:Song){
        songList.append(newSong)
    }
    
    func getFirstSongName()->NSString{
        return songList[0].name
    }
    class var theSharedSongModel: sharedSongModel {
        return _songModelSharedInstance
    }
}
