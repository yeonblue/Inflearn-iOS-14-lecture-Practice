//
//  ViewController.swift
//  PhotoGalleryPractice
//
//  Created by yeonBlue on 2021/07/26.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavtgationSettings()
        setupImageCollectionView()
    }
    
    // MARK: - Setup
    func setupNavtgationSettings() {
        self.title = "Photo Gallery"
        
        let photoItem = UIBarButtonItem(image: UIImage(systemName: "photo.on.rectangle"),
                                        style: .done,
                                        target: self,
                                        action: #selector(showGallery))
        photoItem.tintColor = .black.withAlphaComponent(0.75)
        
        self.navigationItem.rightBarButtonItem = photoItem
        
        let refreshItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"),
                                          style: .done,
                                          target: self,
                                          action: #selector(refreshImages))
        refreshItem.tintColor = .black.withAlphaComponent(0.75)
        
        self.navigationItem.leftBarButtonItem = refreshItem
    }
    
    func setupImageCollectionView() {
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
    }
    
    // MARK: - Selector
    @objc
    func showGallery() {
        
    }

    @objc
    func refreshImages() {
        
    }
}

// MARK: - UICollectionViewDataSource/Delegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier,
                                 for: indexPath) as! PhotoCollectionViewCell
        cell.backgroundColor = .lightGray
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ( UIScreen.main.bounds.width - 1 ) / 2
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
