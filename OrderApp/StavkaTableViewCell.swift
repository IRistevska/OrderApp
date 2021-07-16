//
//  StavkaTableViewCell.swift
//  7ca
//
//  Created by Deni Smilevska on 5/15/19.
//  Copyright © 2019 Martin Anchevski. All rights reserved.
//

import UIKit

class StavkaTableViewCell: UITableViewCell {
    @IBOutlet weak var imeLabel: UILabel!
    @IBOutlet weak var kolLabel: UILabel!
    @IBOutlet weak var cenaLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func labelaCell(stavka: Stavka){
        imeLabel.text = stavka.artikal
        kolLabel.text = String(stavka.kolicina)
        cenaLabel.text = String(stavka.kolicina * stavka.cena)
    }

}
