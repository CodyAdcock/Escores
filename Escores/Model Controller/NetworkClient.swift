//
//  VideoGameController.swift
//  Escores
//
//  Created by Cody on 10/31/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

class NetworkClient{
    static let shared = NetworkClient()
    private init(){}
    
    let baseURL = URL(string: "https://api.pandascore.co")
    let apiKey = "token=1TORRHXHHOf7egRXHaXiMaYWCuDS83_n8-oBAKMJQg_bRFclIeY"
    
    
    func fetchVideoGame(game: String, completion: @escaping (VideoGame?) -> Void){
        
        var videoGameID = 0
        
        switch game{
        case "PUBG":
            videoGameID = 20
        case "Overwatch":
            videoGameID = 14
        case "Dota 2":
            videoGameID = 4
        case "CS:GO":
            videoGameID = 3
        case "LoL":
            videoGameID = 1
        default:
            videoGameID = 0
        }
        
        if videoGameID == 0{
            print("Error getting video game id"); return
        }
        
        let cheatingURL = URL(string: "https://api.pandascore.co/videogames/\(videoGameID).json?token=1TORRHXHHOf7egRXHaXiMaYWCuDS83_n8-oBAKMJQg_bRFclIeY")
        print(cheatingURL)

        URLSession.shared.dataTask(with: cheatingURL!) { (data, _, error) in
            if let error = error {
                print("Error with dataTask: \(#function) \(error) \(error.localizedDescription)")
                completion(nil); return
            }
            guard let data = data else { completion(nil); return}
            
            do{
                let videoGame = try JSONDecoder().decode(VideoGame.self, from: data)
                completion(videoGame)
            }catch let error{
                print("Error fetching game \(error) \(error.localizedDescription)")
                completion(nil);return
            }
            }.resume()
    }
    
    func fetchLeague(leagueID: Int, completion: @escaping (League?) -> Void){
        let cheatingURL = URL(string: "https://api.pandascore.co/leagues/\(leagueID).json?token=1TORRHXHHOf7egRXHaXiMaYWCuDS83_n8-oBAKMJQg_bRFclIeY")
        print(cheatingURL)
        URLSession.shared.dataTask(with: cheatingURL!) { (data, _, error) in
            if let error = error {
                print("Error with dataTask: \(#function) \(error) \(error.localizedDescription)")
                completion(nil); return
            }
            guard let data = data else { completion(nil); return}
            
            do{
                let league = try JSONDecoder().decode(League.self, from: data)
                completion(league)
            }catch let error{
                print("Error fetching game \(error) \(error.localizedDescription)")
                completion(nil);return
            }
            }.resume()
    }
    
}
