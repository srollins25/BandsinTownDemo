//
//  UserCell.swift
//  BandsinTownDemo
//
//  Created by stephan rollins on 10/17/19.
//  Copyright © 2019 OmniStack. All rights reserved.
//

import Foundation
import UIKit

class ArtistCell: UITableViewCell, UITableViewDelegate {
    
    
    var mainImage : UIImage?
    
    var mainImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 24
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(mainImageView)
        
        mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        mainImageView.widthAnchor.constraint(equalToConstant: 48).isActive = true
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel?.frame = CGRect(x: 64, y: (textLabel?.frame.origin.y)!, width: (textLabel?.frame.width)!, height: (textLabel?.frame.height)!)

        if let image = mainImage {
            mainImageView.image = image
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}








