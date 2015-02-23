//
//  sharedAlbumModel.swift
//  mayoPod_v2
//
//  Created by Grayson Wilkins on 2/22/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import Foundation

private let _albumsModelSharedInstance = sharedAlbumsModel()

class sharedAlbumsModel {
    
    let theAlbums: [Album]
    
    init(){
        theAlbums = []
    }
    
    class var theSharedAlbumsModel: sharedAlbumsModel {
        return _albumsModelSharedInstance
    }
}