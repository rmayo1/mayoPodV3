//
//  sharedSongModel.swift
//  mayoPod_v2
//
//  Created by Grayson Wilkins on 2/20/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import Foundation

private let _songsModelSharedInstance = sharedSongsModel()

class sharedSongsModel {
    
    let theSongs: [Song]
    
    init(){
        theSongs = []
    }
    
    
    class var theSharedSongsModel: sharedSongsModel {
        return _songsModelSharedInstance
    }
}