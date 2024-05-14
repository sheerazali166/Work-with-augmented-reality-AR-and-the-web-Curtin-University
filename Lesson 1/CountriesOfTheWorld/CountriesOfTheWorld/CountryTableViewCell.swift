//
//  CountryTableViewCell.swift
//  CountriesOfTheWorld
//
//  Created by Sheeraz on 13/05/2024.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var pupulationLabel: UILabel!
    
    func update(with country: Country) {
        
        flagLabel.text = country.flag
        nameLabel.text = country.name
        regionLabel.text = country.region
        pupulationLabel.text = country.population
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
