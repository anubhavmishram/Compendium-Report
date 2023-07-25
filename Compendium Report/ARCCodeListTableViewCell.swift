//
//  ARCCodeListTableViewCell.swift
//  Compendium Report
//
//  Created by Anubhav Mishra on 7/24/23.
//

import UIKit

class ARCCodeListTableViewCell: UITableViewCell {

    @IBOutlet var deleteButton: UIButton!
    
    @IBOutlet var codeNameLabel: UILabel!
    
    @IBOutlet var codeNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
