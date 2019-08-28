//
//  docTableViewCell.swift
//  CoreDataDocumentsChallenge
//
//  Created by Danae N Nash on 8/28/19.
//  Copyright © 2019 Danae N Nash. All rights reserved.
//

import UIKit

class docTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

    func configureCell(doc: Document){
        self.nameLabel.text = doc.docName
        self.sizeLabel.text = doc.docDescription

        
    }
    
}
