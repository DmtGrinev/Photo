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
        imageView.backgroundColor = .systemGreen
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    var photoLabel: UILabel! {
        let label = UILabel(frame: CGRect(x: 150, y: 150, width: 200, height: 20))
        label.font = .systemFont(ofSize: 17)
        label.backgroundColor = .systemGray
        label.textAlignment = .left
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
        setupPhotoImageView()
        setupPhotoLAbel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupPhotoImageView() {
        addSubview(photoImageView)
      //  photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func setupPhotoLAbel() {
        addSubview(photoLabel)
//        photoLabel.trailingAnchor.constraint(equalTo: photoImageView.trailingAnchor).isActive = true
//        photoLabel.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor).isActive = true
    }
}
