//
//  PhotoViewController.swift
//  Photo
//
//  Created by Tim Grinev on 11.02.2021.
//

import UIKit

class PhotoViewController: UIViewController {
    
 // var photos = [PhotoViewModel]

    var networkDataFetcher = NetworkDataFetcher()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        networkDataFetcher.fetchPhoto { (photoResults) in
//            photoResults.map { (photo) -> in
//                print(photo.urls["small"])
//            })
        }
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
        10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! PhotoCollectionViewCell
        cell.backgroundColor = .systemYellow
    //    let viewModel = PhotoViewModel(title: "Lbvf", imageName: "Image1")
     //   cell.photoImageView?.image = UIImage(named: viewModel.imageName)
       // cell.photoLabel.text = photos.title
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        return cell
    }
}



private extension PhotoViewController {
    func setupCollectionView() {
        //    self.collectionView =  UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        self.collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      //  self.collectionView.backgroundColor = .systemGray2
       // self.view.addSubview(collectionView)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        // self.collectionView.register(PictureCell<PictureView>.self)
        self.collectionView.contentInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = .zero
    }
}
