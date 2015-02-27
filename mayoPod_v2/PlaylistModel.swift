//
//  PlaylistModel.swift
//  mayoPod_v2
//
//  Created by Grayson Wilkins on 2/22/15.
//  Copyright (c) 2015 Robert Mayo. All rights reserved.
//

import Foundation

//Class: Playlist
//Last Modified: 2/26/15
//Author: Joe Delia
//Purpose: Object that simulates a playlist. Holds all songs added to the playlist
class Playlist{
    
    var plistName: String
    var plistSong: [Song]
    
    //Playlist Constructor
    //Last Modified: 2/17/15
    //Author: Joe Delia
    //Parameters: name - name of the playlist
    init(name:String){
        self.plistName = name
        self.plistSong = []
    }
    
    //Method: addSongToPlaylist(Song)
    //Last Modified: 2/22/15
    //Author: Joe Delia
    //Purpose: Takes in a song parameter, checks to see if that song is already in the playlist, and adds song to the playlist if it is not already included, or shows error message saying song is already in playlist.
    //Parameters: songToAdd - Song that will be added to playlist
    //Output: none
    func addSongToPlaylist(songToAdd:Song){
        var addSong = true
        for song in plistSong{
            if song.getSongName() == songToAdd.getSongName(){
                addSong = false
            }
        }
        if addSong{
            plistSong.append(songToAdd)
        }else{
            //Some sort of error check saying song is already in playlist.
        }
    }
    
    //Method: removeSongFromPlaylist(Song)
    //Last Modified: 2/17/15
    //Author: Joe Delia
    //Purpose: Takes in a song parameter, checks to see if the song is in the playlist, and removes that song from the playlist, or shows an error message indicating song is not in playlist.
    //Parameters: songToRemove - Song that will be removed from playlist
    //Output: none
    func removeSongFromPlaylist(songToRemove:Song){
        var count = 0
        var songRemoved = false
        for song in plistSong{
            if song.getSongName() == songToRemove.getSongName(){
                plistSong.removeAtIndex(count)
                songRemoved = true
            }
            count++
        }
        if songRemoved{
            //Song Successfully removed from playlist
        }else{
            //Song was not in playlist
        }
    }
    
    //Getter function for total length of songs in playlist
    func getPlaylistLength() -> Double{
        var plistLength = 0.0
        for song in plistSong{
            plistLength = plistLength + Double(song.getSongLength()) //Has to be casted as a double, because can't change variable type in Song Class.
        }
        return plistLength
    }
    
    //Getter function used when printing list of songs in playlist (external function)
    func getSongList() -> [Song]{
        return plistSong
    }
    
    //Getter function for name of the playlist
    func getPlaylistName() -> String{
        return plistName
    }
}
