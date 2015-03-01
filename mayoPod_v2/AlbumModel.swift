//
//  AlbumModel.swift
//  mayoPod_v2
//
//  Created by Grayson Wilkins on 2/22/15.
//  Copyright (c) 2015 Mayo Industries. All rights reserved.
//  by Ali Akhtar, Joshua Chang, Robert Mayo, Joe Delia, Grayson Wilkins

import Foundation

//Class: Album
//Last Modified: 2/17/15
//Author: Josh Chang
//Purpose: Object that simulates an album. Holds songs of a single album

class Album{
    var name: String
    var artist: String
    var year: Int
    var producer: String
    var length : Float
    
    var songs: [Song]
    
    //Album Constructor
    //Last Modified: 2/17/15
    //Author: Josh Chang
    //Parameters: albumName : the name of the album, artist: the artist of the album, year: the year of album, producer: the producer of the album
    init(albumName:String, artist:String, year: Int, producer:String){
        self.name = albumName
        self.artist = artist
        self.year = year
        self.producer = producer
        self.length = 0
        self.songs = []
        
    }
    
    //Method: getAlbumLength()
    //Last Modified: 2/17/15
    //Author: Josh Chang
    //Purpose: Calculate the sum of the lengths of all the songs currently in this album
    //Parameters: None
    //Output: Float
    func getAlbumLength() -> Float{
        for i in songs{
            self.length = self.length + i.length
        }
        return self.length
    }
    
    //Method: getAlbumName()
    //Last Modified: 2/17/15
    //Author: Josh Chang
    //Purpose: returns AlbumName
    //Parameters: None
    //Output: String for albumName
    func getAlbumName() -> String{
        // returns album name
        return self.name
    }
    
    //Method: getArtistName()
    //Last Modified: 2/17/15
    //Author: Josh Chang
    //Purpose: returns artistName
    //Parameters: None
    //Output: String for artistName
    func getArtistName() -> String{
        // returns album artist
        return self.artist
    }
    
    //Method: getAlbumYear()
    //Last Modified: 2/17/15
    //Author: Josh Chang
    //Purpose: returns Album year
    //Parameters: None
    //Output: Int for album year
    func getAlbumYear() -> Int{
        //returns album year
        return self.year
    }
    
    //Method: getProducer()
    //Last Modified: 2/17/15
    //Author: Josh Chang
    //Purpose: returns Album producer
    //Parameters: None
    //Output: String for album producer
    func getProducer() -> String{
        //returns album producer
        return self.producer
    }
    
    //Method: getSongsInName()
    //Last Modified: 2/17/15
    //Author: Josh Chang
    //Purpose: returns list of songs
    //Parameters: None
    //Output: list comprised of songs
    func getSongsInAlbum() -> [Song]{
        //returns songs in album
        return self.songs
    }
    
    //Method: addSongToAlbum
    //Last Modified: 2/25/15
    //Author: Joe Delia
    //Purpose: Add a song to the this Album instance
    //Parameters: songToAdd: a Song object
    //Output: Float
    func addSongToAlbum(songToAdd:Song){
        var addSong = true //bool flag to check if song exists in album already
        for song in self.songs{
            if song.getSongName() == songToAdd.getSongName(){
                addSong = false//flag set to false, song already exists
            }
        }
        if addSong{
            self.songs.append(songToAdd)//add song to the Album
        }
    }
}
