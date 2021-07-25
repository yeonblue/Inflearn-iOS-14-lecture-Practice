//
//  OnBoardingPageViewController.swift
//  OnBoardingPractice
//
//  Created by yeonBlue on 2021/07/25.
//

import UIKit

private let startIndex = 0

class OnBoardingPageViewController: UIPageViewController {

    // MARK: - Properties
    var pages: [UIViewController]?
    var pageControl = UIPageControl()
    var currentIndex = startIndex {
        didSet {
            pageControl.currentPage = currentIndex
        }
    }
    var bottomButtonConstraint: NSLayoutConstraint?

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupPageController()
        addCompleteBottomButton()
        addPageControl()
    }
    
    // MARK: - Setup
    func setupPageController() {
        pages = generateOnBoardingViewControllers()
        self.dataSource = self
        self.delegate = self
        
        // 시작페이지
        setViewControllers([pages![0]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    
    // MARK: - Heleprs
    func generateOnBoardingViewControllers() -> [UIViewController] {
        let vc1 =
        OnBoardingItemViewViewController(nibName: "OnBoardingItemViewViewController",
                                         bundle: nil)
        
        let vc2 =
        OnBoardingItemViewViewController(nibName: "OnBoardingItemViewViewController",
                                         bundle: nil)
        
        let vc3 =
        OnBoardingItemViewViewController(nibName: "OnBoardingItemViewViewController",
                                         bundle: nil)
        
        vc1.setViewController(mainText: "What is Lorem Ipsum?",
                              descripionText: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              imgName: "1")
        
        vc2.setViewController(mainText: "Where does it come from?",
                              descripionText: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.",
                              imgName: "2")
        
        vc3.setViewController(mainText: "Why do we use it?",
                              descripionText: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                              imgName: "3")
        
        return [vc1, vc2, vc3]
    }
    
    func addCompleteBottomButton() {
        let button = UIButton(type: .system)
        button.setTitle("확인", for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.setTitleColor(.darkGray, for: .normal)
        
        self.view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bottomButtonConstraint = button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 150)
        bottomButtonConstraint?.isActive = true
    }
    
    func addPageControl() {
        self.view.addSubview(pageControl)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .darkGray
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = pages?.count ?? 0
        pageControl.currentPage = startIndex
        
        //pageControl.isUserInteractionEnabled = false
        pageControl.addTarget(self, action: #selector(pageControlTapped), for: .valueChanged)
        
        pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func completeButtonPresentation() {
       
        func showButton() {
            bottomButtonConstraint?.constant = 0
        }
        
        func hideButton() {
            bottomButtonConstraint?.constant = 150
        }
        
        guard let pageCnt = pages?.count else { return }
        
        if currentIndex == pageCnt - 1 {
            showButton()
        } else {
            hideButton()
        }
        
//        UIView.animate(withDuration: 0.25) {
//            self.view.layoutIfNeeded()
//        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.25,
                                                       delay: 0,
                                                       options: [.curveEaseIn],
                                                       animations: {
            self.view.layoutIfNeeded()
        },completion: nil) // completion에서 Position 활용 가능.
    }
    
    // MARK: - Selector
    @objc
    func completeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    func pageControlTapped(sender: UIPageControl) {
        guard let pages = pages else { return }
        let currentIndex = sender.currentPage
        let isForward = currentIndex > self.currentIndex
        
        if isForward {
            self.setViewControllers([pages[currentIndex]],
                                    direction: .forward,
                                    animated: true,
                                    completion: nil)
        } else {
            self.setViewControllers([pages[currentIndex]],
                                    direction: .reverse,
                                    animated: true,
                                    completion: nil)
        }
        
        self.currentIndex = currentIndex
        
        completeButtonPresentation()
    }
}

// MARK: - UIPageViewControllerDataSource
extension OnBoardingPageViewController: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let pages = pages,
              let currentIndex = pages.firstIndex(of: viewController) else { return nil}
        self.currentIndex = currentIndex
        
        if currentIndex == 0 {
            return nil
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let pages = pages,
              let currentIndex = pages.firstIndex(of: viewController) else { return nil}
        self.currentIndex = currentIndex
        
        if currentIndex == pages.count - 1{
            return nil
        } else {
            return pages[currentIndex + 1]
        }
    }
}

// MARK: - UIPageViewControllerDelegate
extension OnBoardingPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let currentVC = pageViewController.viewControllers?.first else { return }
        guard let currentIndex = pages?.firstIndex(of: currentVC) else { return }
        self.currentIndex = currentIndex
        
        completeButtonPresentation()
    }
}
