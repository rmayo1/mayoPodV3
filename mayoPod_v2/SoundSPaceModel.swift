//
//  SoundSPaceModel.swift
//  Sound Space by Sound Space
//
//  Created by Taylor LeBlanc on 2/4/15.
//  Copyright (c) 2015 Sound Space. All rights reserved.
//

import Foundation

class Song {
    
    var name: String
    var artist: String
    var year: Int
    var length: Float
    var composer: String
    var album: String
    
    
    init(song:String, artist:String, year: Int,length:Float,composer:String,album:String){
        self.name = song
        self.artist = artist
        self.year = year
        self.length = length
        self.composer = composer
        self.album = album
    }
    
    //Stuff Joe Wrote:
    func getSongName() -> String{
        return self.name
    }
    
    func getSongArtist() -> String{
        return self.artist
    }
    
    func getSongYear() -> Int{
        return self.year
    }
    
    func getSongLength() -> Float{
        return self.length
    }
}









