//
//  AlbumModel.swift
//  mayoPod_v2
//
//  Created by Grayson Wilkins on 2/22/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

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
    
    
    func getAlbumName() -> String{
        // returns album name
        return self.name
    }
    
    func getArtistName() -> String{
        // returns album artist
        return self.artist
    }
    
    func getAlbumYear() -> Int{
        //returns album year
        return self.year
    }
    
    func getProducer() -> String{
        //returns album producer
        return self.producer
    }
    
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
