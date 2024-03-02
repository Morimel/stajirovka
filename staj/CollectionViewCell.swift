//
//  TableViewCell.swift
//  staj
//
//  Created by Isa Melsov on 2/3/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "id"
    
    private let imageAPI: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "gear")
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let label: UILabel = {
        let view = UILabel()
        view.text = "text"
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        contentView.addSubview(imageAPI)
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            imageAPI.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            imageAPI.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            
            label.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 15),
            label.leadingAnchor.constraint(equalTo: imageAPI.trailingAnchor, constant: 10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
