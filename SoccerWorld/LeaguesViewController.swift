//
//  ViewController.swift
//  SoccerWorld
//
//  Created by Marco Alonso Rodriguez on 22/05/23.
//

import UIKit

class LeaguesViewController: UIViewController {
    
    var soccerManager = SoccerManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getLeagues()
    }

    private func getLeagues(){
        soccerManager.getLeagues { [weak self] listLeagues, error in
            guard let self = self, let listLeagues = listLeagues else { return }
            
            print("Leagues Founded: \(listLeagues.count)")
        }
    }

}

