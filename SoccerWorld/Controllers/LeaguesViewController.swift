//
//  ViewController.swift
//  SoccerWorld
//
//  Created by Marco Alonso Rodriguez on 22/05/23.
//

import UIKit

class LeaguesViewController: UIViewController {
    
    
    @IBOutlet weak var leaguesCollection: UICollectionView!
    
    var soccerManager = SoccerManager()
    
    var leagues = [LeagueModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        leaguesCollection.register(UINib(nibName: "NameLeagueCell", bundle: nil), forCellWithReuseIdentifier: NameLeagueCell.identifier)
        
        leaguesCollection.delegate = self
        leaguesCollection.dataSource = self
        
        setupCollection()
        
        getLeagues()
    }
    
    private func setupCollection() {
        leaguesCollection.collectionViewLayout = UICollectionViewFlowLayout()
        if let flowLayout = leaguesCollection.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
        }
    }

    private func getLeagues(){
        soccerManager.getLeagues { [weak self] listLeagues, error in
            guard let self = self, let listLeagues = listLeagues else { return }
            
            self.leagues = listLeagues
            DispatchQueue.main.async {
                self.leaguesCollection.reloadData()
            }
            print("Leagues Founded: \(listLeagues.count)")
        }
    }

}


extension LeaguesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        leagues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NameLeagueCell.identifier, for: indexPath) as! NameLeagueCell
        
        cell.setupCell(leage: leagues[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 210)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
}
