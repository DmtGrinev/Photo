//
//  PhotoCollectionViewCell.swift
//  Photo
//
//  Created by Tim Grinev on 11.02.2021.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static var reusedId = "PhotosCell"
    
    var photoImageView: UIImageView! {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGreen
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    var photoLabel: UILabel! {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.text = "Hi"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    var unsplashPhoto: CurrentPhoto! {
           didSet {
               let photoUrl = unsplashPhoto.urls["regular"]
            guard let imageUrl = photoUrl, let url = URL(string: imageUrl) else {return}
            photoImageView.sd_setImage(with: url, completed: nil)
           }
       }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupPhotoLAbel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPhotoLAbel() {
        addSubview(photoLabel)
//        photoLabel.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor).isActive = true
//        photoLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor).isActive = true
    }
   
    
}
