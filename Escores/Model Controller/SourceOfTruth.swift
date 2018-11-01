//
//  Tracker.swift
//  Escores
//
//  Created by Cody on 10/31/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import Foundation

class SourceOfTruth{
    
    static let shared = SourceOfTruth()
    private init() {}
    
    var currentVideoGame: VideoGame?
    var currentLeague: League?
    var currentSeries: Series?
    var currentTournament: Tournament?
    var currentMatch: Match?
    var currentGame: Game?
    var currentWinner: Winner?
    var currentResult: Result?
    var currentTeam: Team?
    var currentPlayer: Player?
    
    var videoGamesArray: [VideoGame] = []
    var leaguesArray: [League] = []
    var seriesArray: [Series] = []
    var tournamentArray: [Tournament] = []
    var matchArray: [Match] = []
    var gameArray: [Game] = []
    var winnerArray: [Winner] = []
    var resultArray: [Result] = []
    var teamArray: [Team] = []
    var playerArray: [Player] = []
}
