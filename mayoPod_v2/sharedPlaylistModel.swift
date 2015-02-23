//
//  sharedPlaylistModel.swift
//  mayoPod_v2
//
//  Created by Grayson Wilkins on 2/22/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import Foundation

private let _playlistsModelSharedInstance = sharedPlaylistsModel()

class sharedPlaylistsModel {
    
    let thePlaylists: [Playlist]
    
    init(){
        thePlaylists = []
    }
    
    class var theSharedPlaylistModel: sharedPlaylistsModel {
        return _playlistsModelSharedInstance
    }
}