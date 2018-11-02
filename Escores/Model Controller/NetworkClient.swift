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
    
    //Archive Fetches
    
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
    func fetchSeries(seriesID: Int, completion: @escaping (Series?) -> Void){
        let cheatingURL = URL(string: "https://api.pandascore.co/series/\(seriesID).json?token=1TORRHXHHOf7egRXHaXiMaYWCuDS83_n8-oBAKMJQg_bRFclIeY")
        print(cheatingURL)
        URLSession.shared.dataTask(with: cheatingURL!) { (data, _, error) in
            if let error = error {
                print("Error with dataTask: \(#function) \(error) \(error.localizedDescription)")
                completion(nil); return
            }
            guard let data = data else { completion(nil); return}
            
            do{
                let series = try JSONDecoder().decode(Series.self, from: data)
                completion(series)
            }catch let error{
                print("Error fetching game \(error) \(error.localizedDescription)")
                completion(nil);return
            }
            }.resume()
    }
    func fetchTournament(tournamentID: Int, completion: @escaping (Tournament?) -> Void){
        let cheatingURL = URL(string: "https://api.pandascore.co/tournaments/\(tournamentID).json?token=1TORRHXHHOf7egRXHaXiMaYWCuDS83_n8-oBAKMJQg_bRFclIeY")
        print(cheatingURL)
        URLSession.shared.dataTask(with: cheatingURL!) { (data, _, error) in
            if let error = error {
                print("Error with dataTask: \(#function) \(error) \(error.localizedDescription)")
                completion(nil); return
            }
            guard let data = data else { completion(nil); return}
            
            do{
                let tournaments = try JSONDecoder().decode(Tournament.self, from: data)
                completion(tournaments)
            }catch let error{
                print("Error fetching game \(error) \(error.localizedDescription)")
                completion(nil);return
            }
            }.resume()
    }
    func fetchMatch(matchID: Int, completion: @escaping (Match?) -> Void){

        let cheatingURL = URL(string: "https://api.pandascore.co/matches/\(matchID).json?token=1TORRHXHHOf7egRXHaXiMaYWCuDS83_n8-oBAKMJQg_bRFclIeY")
        print(cheatingURL)
        URLSession.shared.dataTask(with: cheatingURL!) { (data, _, error) in
            if let error = error {
                print("Error with dataTask: \(#function) \(error) \(error.localizedDescription)")
                completion(nil); return
            }
            guard let data = data else { completion(nil); return}
            
            do{
                let matches = try JSONDecoder().decode(Match.self, from: data)
                completion(matches)
            }catch let error{
                print("Error fetching game \(error) \(error.localizedDescription)")
                completion(nil);return
            }
            }.resume()
    }
    
    func fetchTeam(teamID: Int, completion: @escaping (Team?) -> Void){
        
        let cheatingURL = URL(string: "https://api.pandascore.co/teams/\(teamID).json?token=1TORRHXHHOf7egRXHaXiMaYWCuDS83_n8-oBAKMJQg_bRFclIeY")
        print(cheatingURL)
        URLSession.shared.dataTask(with: cheatingURL!) { (data, _, error) in
            if let error = error {
                print("Error with dataTask: \(#function) \(error) \(error.localizedDescription)")
                completion(nil); return
            }
            guard let data = data else { completion(nil); return}
            
            do{
                let teams = try JSONDecoder().decode(Team.self, from: data)
                completion(teams)
            }catch let error{
                print("Error fetching game \(error) \(error.localizedDescription)")
                completion(nil);return
            }
            }.resume()
    }
    func fetchPlayer(playerID: Int, completion: @escaping (Player?) -> Void){
        
        let cheatingURL = URL(string: "https://api.pandascore.co/players/\(playerID).json?token=1TORRHXHHOf7egRXHaXiMaYWCuDS83_n8-oBAKMJQg_bRFclIeY")
        print(cheatingURL)
        URLSession.shared.dataTask(with: cheatingURL!) { (data, _, error) in
            if let error = error {
                print("Error with dataTask: \(#function) \(error) \(error.localizedDescription)")
                completion(nil); return
            }
            guard let data = data else { completion(nil); return}
            
            do{
                let players = try JSONDecoder().decode(Player.self, from: data)
                completion(players)
            }catch let error{
                print("Error fetching game \(error) \(error.localizedDescription)")
                completion(nil);return
            }
            }.resume()
    }
    
    //Running Fetches
    func fetchSeriesRunning(completion: @escaping ([Series]?) -> Void){
        let cheatingURL = URL(string: "https://api.pandascore.co/series/running.json?token=1TORRHXHHOf7egRXHaXiMaYWCuDS83_n8-oBAKMJQg_bRFclIeY")
        print(cheatingURL)
        URLSession.shared.dataTask(with: cheatingURL!) { (data, _, error) in
            if let error = error {
                print("Error with dataTask: \(#function) \(error) \(error.localizedDescription)")
                completion(nil); return
            }
            guard let data = data else { completion(nil); return}
            
            do{
                let series = try JSONDecoder().decode([Series].self, from: data)
                completion(series)
            }catch let error{
                print("Error fetching game \(error) \(error.localizedDescription)")
                completion(nil);return
            }
            }.resume()
    }
    func fetchTournamentRunning(completion: @escaping ([Tournament]?) -> Void){
        let cheatingURL = URL(string: "https://api.pandascore.co/tournaments/running.json?token=1TORRHXHHOf7egRXHaXiMaYWCuDS83_n8-oBAKMJQg_bRFclIeY")
        print(cheatingURL)
        URLSession.shared.dataTask(with: cheatingURL!) { (data, _, error) in
            if let error = error {
                print("Error with dataTask: \(#function) \(error) \(error.localizedDescription)")
                completion(nil); return
            }
            guard let data = data else { completion(nil); return}
            
            do{
                let tournaments = try JSONDecoder().decode([Tournament].self, from: data)
                completion(tournaments)
            }catch let error{
                print("Error fetching game \(error) \(error.localizedDescription)")
                completion(nil);return
            }
            }.resume()
    }
    func fetchMatchRunning(completion: @escaping ([Match]?) -> Void){
        
        let cheatingURL = URL(string: "https://api.pandascore.co/matches/running.json?token=1TORRHXHHOf7egRXHaXiMaYWCuDS83_n8-oBAKMJQg_bRFclIeY")
        print(cheatingURL)
        URLSession.shared.dataTask(with: cheatingURL!) { (data, _, error) in
            if let error = error {
                print("Error with dataTask: \(#function) \(error) \(error.localizedDescription)")
                completion(nil); return
            }
            guard let data = data else { completion(nil); return}
            
            do{
                let matches = try JSONDecoder().decode([Match].self, from: data)
                completion(matches)
            }catch let error{
                print("Error fetching game \(error) \(error.localizedDescription)")
                completion(nil);return
            }
            }.resume()
    }
    
}
