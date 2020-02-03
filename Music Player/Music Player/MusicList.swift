//
//  MusicList.swift
//  Music Player
//
//  Created by mahsun abuzeyitoğlu on 31.01.2020.
//  Copyright © 2020 mahsun abuzeyitoğlu. All rights reserved.
//

import UIKit
private let id = "id"

var songList : [String] = []
var songImage : [String] = []

var activeSong = 0

import AVFoundation
 var audioPlayer = AVAudioPlayer()
class MusicList: UITableViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.tableView.separatorColor = .white
        navigationItem.title = "Music List"
        
        
        tableView.register(SongCell.self, forCellReuseIdentifier: id)
       
        getSong()
        
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 70, bottom: 0, right: 0)
        
    }

 
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        do {
            let audioPath = Bundle.main.path(forResource: songList[indexPath.row], ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            activeSong = indexPath.row
        }
        catch {
            print(error.localizedDescription)
        }
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! SongCell
        cell.textLabel?.text = songList[indexPath.row]
        cell.artistImage.image = UIImage(named: songList[indexPath.row])
        return cell
    }
    

    func getSong()  {
        
       
            let folderUrl = URL(fileURLWithPath: Bundle.main.resourcePath!)
            do{
                let path = try FileManager.default.contentsOfDirectory(at: folderUrl,includingPropertiesForKeys: nil,options: .skipsHiddenFiles)
                for song_ in path{
                    var songName = song_.absoluteString
                    if songName.contains(".mp3")
                    {
                        let finfString = songName.components(separatedBy: "/")
                        songName = finfString[finfString.count - 1]
                        songName = songName.replacingOccurrences(of: "%20", with: " ")
                        songName = songName.replacingOccurrences(of: ".mp3", with: "")
                        songList.append(songName)
                        print(songName)
                    }
                }
                        
                tableView.reloadData()
            }
        
            catch
            {
                print("err")
            }
        
    }

}
