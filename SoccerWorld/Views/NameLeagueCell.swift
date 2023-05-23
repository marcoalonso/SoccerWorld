//
//  NameLeagueCell.swift
//  SoccerWorld
//
//  Created by Marco Alonso Rodriguez on 22/05/23.
//

import UIKit
import SDWebImage

class NameLeagueCell: UICollectionViewCell {
    
    static let identifier = "LeagueCell"
    
    @IBOutlet weak var backgroundPitch: UIImageView!
    @IBOutlet weak var logoLeague: UIImageView!
    @IBOutlet weak var countryLeague: UIImageView!
    @IBOutlet weak var nameLeague: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundPitch.layer.cornerRadius = 12
        backgroundPitch.layer.masksToBounds = true
        
        
    }
    
    func setupCell(leage: LeagueModel) {
        nameLeague.text = leage.league_name ?? ""
        
        if let urlCountry = leage.country_logo {
            countryLeague.sd_setImage(with: URL(string: urlCountry))
        }
        
        if let urlLeagueLogo = leage.league_logo {
            logoLeague.sd_setImage(with: URL(string: urlLeagueLogo), placeholderImage: UIImage(named: "ball"))
        }
    }

}
