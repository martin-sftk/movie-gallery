//
//  MediaTableViewCell.swift
//  Movie Gallery
//
//  Created by Martín Serrano on 14/09/23.
//

import UIKit

class MediaTableViewCell: UITableViewCell {

    static let identifier = "MediaTableViewCell"
    
    private let mediaButton: UIButton = {
        let mediaButton = UIButton()
        let image = UIImage(systemName: "star", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        mediaButton.setImage(image, for: .normal)
        mediaButton.translatesAutoresizingMaskIntoConstraints = false
        mediaButton.tintColor = .darkGray
        return mediaButton
    }()
    
    private let mediaLabel: UILabel = {
        let mediaLabel = UILabel()
        mediaLabel.translatesAutoresizingMaskIntoConstraints = false
        return mediaLabel
    }()
    
    private let mediaPosterUIImageView: UIImageView = {
        let mediaImageView = UIImageView()
        mediaImageView.contentMode = .scaleAspectFill
        mediaImageView.translatesAutoresizingMaskIntoConstraints = false
        return mediaImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mediaPosterUIImageView)
        contentView.addSubview(mediaLabel)
        contentView.addSubview(mediaButton)
        
        applyConstraints()
    }
    
    private func applyConstraints() {
        let mediaPosterUIImageViewConstraints = [
            mediaPosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mediaPosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            mediaPosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            mediaPosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let mediaLabelConstraints = [
            mediaLabel.leadingAnchor.constraint(equalTo: mediaPosterUIImageView.trailingAnchor, constant: 20),
            mediaLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        let mediaButtonConstraints = [
            mediaButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            mediaButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(mediaPosterUIImageViewConstraints)
        NSLayoutConstraint.activate(mediaLabelConstraints)
        NSLayoutConstraint.activate(mediaButtonConstraints)
    }
    
    public func configure(with model: MediaViewModel) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {return}
        mediaPosterUIImageView.sd_setImage(with: url, completed: nil)
        mediaLabel.text = model.mediaName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
