//
//  PhotoViewController.swift
//  Photo
//
//  Created by Tim Grinev on 11.02.2021.
//

import UIKit

class PhotoViewController: UIViewController {
    
    var collectionView: UICollectionView!
    
    var networkDataFetcher = NetworkDataFetcher()
    
    private var photosObject = [PhotoViewModel]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
       
    }
    private func configurateCell(cell: PhotoCollectionViewCell, for indexPath: IndexPath) {
        let photos = self.photosObject[indexPath.item]
            
        cell.photoImageView.image = self.photosImage.description
        
        
        let photoUrl = URL(string: self.photosObject[indexPath.item])
        guard let photoData = try Data(contentsOf: photoUrl) else {return}
        cell.photoImageView.image = photosImage.image
    }

    
}

extension PhotoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ratio: CGFloat = 1.2
        let width = collectionView.frame.width - collectionView.contentInset.left - collectionView.contentInset.right
        let height = width * ratio
        return CGSize(width: width, height: height)
    }
}

extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(photosObject.count)
        return  5 //photos.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      //  let photos = self.photos[indexPath.item] //1
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reusedId, for: indexPath) as! PhotoCollectionViewCell
        cell.backgroundColor = .systemYellow
        //    let unsplashPhoto = photos[indexPath.item]
        print("\(photosObject)" + " !!!!!!!!!!!!!!!!!!!")
        // cell.photoImageView.image =
        // cell.photoLabel.text = photos.title
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
}

private extension PhotoViewController {
    func setupCollectionView() {
        self.collectionView =  UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        self.collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.collectionView.backgroundColor = .systemGray2
        self.view.addSubview(collectionView)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.reusedId)
        self.collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = .zero
    }
}

//func TTT() {
//    NetworkDataFetcher.fetchPhoto() {
//
//    }
//        }

