//
//  ViewController.swift
//  PanGesturePractice
//
//  Created by yeonBlue on 2021/07/24.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Properties
    var currentDragType: DragType = .moveAll {
        didSet {
            greenDragView.currentDragType = currentDragType
        }
    }
    
    let greenDragView = DraggableView()
    
    // MARK: - IBActions
    
    @IBAction func dragTypeSegmentValueChanged(_ sender: UISegmentedControl) {
        currentDragType = DragType.init(rawValue: sender.selectedSegmentIndex) ?? .moveAll
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDraggableViews()
    }

    // MARK: - Add DraggableView
    func setDraggableViews() {
        
        greenDragView.center = self.view.center
        greenDragView.bounds = CGRect(x: 0, y: 0, width: 150, height: 100)
        greenDragView.backgroundColor = .green
        
        self.view.addSubview(greenDragView)
    }
}

