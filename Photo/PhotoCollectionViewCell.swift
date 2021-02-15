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
    }
    
    private func setupPhotoImageView() {
        addSubview(photoImageView)
        photoImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBOutlet weak var photoLabel: UILabel!
    
}
