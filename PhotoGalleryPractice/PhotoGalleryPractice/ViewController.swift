//
//  ViewController.swift
//  PhotoGalleryPractice
//
//  Created by yeonBlue on 2021/07/26.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {

    // MARK: - Properties
    var fetchImageResults: PHFetchResult<PHAsset>? {
        didSet {
            photoCollectionView.reloadData()
        }
    }
    
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
        self.navigationItem.title = "Photo Gallery"
        
        let photoItem = UIBarButtonItem(image: UIImage(systemName: "photo.on.rectangle"),
                                        style: .done,
                                        target: self,
                                        action: #selector(checkCameraPermission))
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
    func checkCameraPermission() {
        func showGallery() {
            let library = PHPhotoLibrary.shared()
            var config = PHPickerConfiguration(photoLibrary: library)
            config.selectionLimit = 10
            
            let pickerViewController = PHPickerViewController(configuration: config)
            pickerViewController.delegate = self
            
            present(pickerViewController, animated: true, completion: nil)
        }
        
        func alertAndMoveSetting() {
            let alert = UIAlertController(title: "포토라이브러리 접근 권한을 활성화 해주세요",
                                          message: nil,
                                          preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "닫기",
                                          style: .cancel,
                                          handler: nil))
            
            alert.addAction(UIAlertAction(title: "설정으로 이동",
                                          style: .default,
                                          handler: { _ in
                guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        func askCameraPermission() {
            PHPhotoLibrary.requestAuthorization { status in
                self.checkCameraPermission()
            }
        }
        
        switch PHPhotoLibrary.authorizationStatus() {
        
        case .notDetermined:
            askCameraPermission()
        case .denied:
            DispatchQueue.main.async {
                alertAndMoveSetting()
            }
        case .authorized, .limited:
            DispatchQueue.main.async {
                showGallery()
            }
        case .restricted:
            print("DEBUG: Permission Restricted")
        @unknown default:
            fatalError("Unknown Status")
        }
    }
    
    @objc
    func refreshImages() {
        photoCollectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource/Delegate
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchImageResults?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.reuseIdentifier,
                                 for: indexPath) as! PhotoCollectionViewCell
        if let asset = self.fetchImageResults?[indexPath.row] {
            cell.loadImage(asset: asset)
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
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

// MARK: - PHPickerViewControllerDelegate
extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        let assetIdentifiers = results.map { $0.assetIdentifier ?? "" }
        fetchImageResults = PHAsset.fetchAssets(withLocalIdentifiers: assetIdentifiers, options: nil)

        self.dismiss(animated: true, completion: nil)
    }
}
