//
//  SongCell.swift
//  Music Player
//
//  Created by mahsun abuzeyitoğlu on 31.01.2020.
//  Copyright © 2020 mahsun abuzeyitoğlu. All rights reserved.
//

import UIKit
private let id = "id"
class SongCell: UITableViewCell {

    let artistImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Hello")
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: id)
        addSubview(artistImage)
        
        artistImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        artistImage.anchor(top: nil, left: self.leftAnchor, bottom: nil, rigth: nil, marginTop: 16, marginLeft: 16, marginBottom: 16, marginRigth: 0, width: 45, heigth: 45)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
