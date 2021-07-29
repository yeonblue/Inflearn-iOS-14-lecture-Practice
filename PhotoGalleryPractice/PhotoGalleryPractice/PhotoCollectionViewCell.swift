//
//  PhotoCollectionViewCell.swift
//  PhotoGalleryPractice
//
//  Created by yeonBlue on 2021/07/26.
//

import UIKit
import PhotosUI

class PhotoCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PhotoCollectionViewCell"
    
    // MARK: - IBOutlets
    @IBOutlet weak var photoImageView: UIImageView!
    
    func loadImage(asset: PHAsset) {
        let width = self.bounds.width
        let imageSize = CGSize(width: width, height: width)
        
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        
        PHImageManager().requestImage(for: asset,
                                         targetSize: imageSize,
                                         contentMode: .aspectFill,
                                         options: options) { [weak self] image, info in
            // 저화질, 고화질 순 이미지 반환
            self?.photoImageView.image = image
        }
    }
}
