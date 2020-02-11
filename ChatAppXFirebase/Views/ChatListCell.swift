//
//  ChatListCell.swift
//  ChatAppXFirebase
//
//  Created by Prapawit Patthasirivichot on 11/2/2563 BE.
//  Copyright © 2563 Prapawit Patthasirivichot. All rights reserved.
//

import UIKit

class ChatListCell: UITableViewCell {

    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setChatCell(name: String, desc: String){
        self.name.text = name
        self.desc.text = desc
    }
    
}
