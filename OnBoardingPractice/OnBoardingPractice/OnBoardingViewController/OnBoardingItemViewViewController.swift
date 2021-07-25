//
//  OnBoardingItemViewViewController.swift
//  OnBoardingPractice
//
//  Created by yeonBlue on 2021/07/25.
//

import UIKit

class OnBoardingItemViewViewController: UIViewController {

    // MARK: - Properties
    var mainText = ""
    var descrtipionText = ""
    var topImage: UIImage?
    
    // MARK: - IBOutlets
    // IBOutlet은 화면에 올라와야 초기화가 이루어지므로 화면 불러오기 전에 직접 접근은 불가능
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainTitleLabel.text = mainText
        self.descriptionLabel.text = descrtipionText
        self.topImageView.image = topImage
        
        setupImageView()
    }
    
    // MARK: - Setup
    func setupImageView() {
        topImageView.layer.cornerRadius = 30
    }
    
    func setViewController(mainText: String, descripionText: String, imgName: String) {
        self.mainText = mainText
        self.descrtipionText = descripionText
        self.topImage = UIImage(named: imgName) ?? nil
    }
}
