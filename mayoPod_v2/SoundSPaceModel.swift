//
//  SoundSPaceModel.swift
//  Sound Space by Sound Space
//
//  Created by Taylor LeBlanc on 2/4/15.
//  Copyright (c) 2015 Sound Space. All rights reserved.
//


import Foundation
// Class: Song
// Last Modified: 2/26/15
// Author: Taylor LeBlanc, Joe Delia
// Purpose: Song class, holds song variables/attributes
// Input/Output: NA
class Song {
    
    var name: String
    var artist: String
    var year: Int
    var length: Float
    var composer: String
    var album: String
    
    
    //Func: init
    //Last Modified: 2/26/15
    //Author: T-Blanc
    //Purpose: Initializes song with inputs
    //Input: song title, song artist both as strings, year as int, song length as float, composer and album as strings
    init(song:String, artist:String, year: Int,length:Float,composer:String,album:String){
        self.name = song
        self.artist = artist
        self.year = year
        self.length = length
        self.composer = composer
        self.album = album
    }
    
    //Stuff Joe Wrote, extending on Song class
    
    //Func: getSongName
    //Last Modified: 2/26/15
    //Author: Joe
    //Purpose: returns song name
    //Input: N/A
    //Output: Returns song name
    func getSongName() -> String{
        return self.name
    }
    
    //Func: getSongArtist
    //Last Modified: 2/26/15
    //Author: Joe
    //Purpose: returns song artist
    //Input: N/A
    //Output: Returns song artist
    func getSongArtist() -> String{
        return self.artist
    }
    
    //Func: getSongYear
    //Last Modified: 2/26/15
    //Author: Joe
    //Purpose: returns song year
    //Input: N/A
    //Output: Returns song year
    func getSongYear() -> Int{
        return self.year
    }
    
    //Func: getSongLength
    //Last Modified: 2/26/15
    //Author: Joe
    //Purpose: returns song length
    //Input: N/A
    //Output: Returns song length
    func getSongLength() -> Float{
        return self.length
    }
    
    //Func: getSongAlbum
    //Last Modified: 2/26/15
    //Author: Joe
    //Purpose: returns song album
    //Input: N/A
    //Output: Returns song album
    func getAlbum() -> String{
        return self.album
    }
}









