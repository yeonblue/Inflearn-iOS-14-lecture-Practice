//
//  ViewController.swift
//  OnBoardingPractice
//
//  Created by yeonBlue on 2021/07/25.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properteis
    var didShowOnBoardingViewController = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        // ViewDidload에서는 화면이 아직 그려지지 않았으므로 present 호출 불가
        // ViewWillAppear도 마찬가지로 화면이 나오기 직전이므로 부적절
        // showOnBoardingViewController()
        
        showOnBoardingPageViewController()
    }
    
    // MARK: - OnBoarding ViewController
    func showOnBoardingViewController() {
        
        if didShowOnBoardingViewController == false {
            let onBoardingViewController =
            OnBoardingItemViewViewController(nibName: "OnBoardingItemViewViewController",
                                            bundle: nil)
            self.modalPresentationStyle = .fullScreen
            self.present(onBoardingViewController, animated: true, completion: nil)
            
            didShowOnBoardingViewController = true
        }
    }
    
    func showOnBoardingPageViewController() {
        
        if didShowOnBoardingViewController == false {
            let pageVC = OnBoardingPageViewController(transitionStyle: .pageCurl,
                                                      navigationOrientation: .horizontal,
                                                      options: nil)
            self.modalPresentationStyle = .fullScreen
            self.present(pageVC, animated: true, completion: nil)
            
            didShowOnBoardingViewController = true
        }
    }
}

