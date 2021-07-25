//
//  DraggableView.swift
//  PanGesturePractice
//
//  Created by yeonBlue on 2021/07/24.
//

import UIKit

enum DragType: Int, CaseIterable {
    case moveX = 0
    case moveY
    case moveAll
}

class DraggableView: UIView {
    
    // MARK: - Properteis
    var currentDragType: DragType = .moveAll
    
    // MARK: - Lifecycle
    init() {
        super.init(frame: .zero)
        
        let panGesture = UIPanGestureRecognizer(target: self,
                                                action: #selector(dragViewSelector))
        self.addGestureRecognizer(panGesture)
    }
    
    required init?(coder: NSCoder) {
        // interface Builder
        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selector
    @objc
    func dragViewSelector(pan: UIPanGestureRecognizer) {
        switch pan.state {

        case .possible:
            print("possible")
        case .began:
            print("began")
        case .changed:
            print("changed")
            var myPosition = self.center
            let delta = pan.translation(in: self.superview)
            
            if currentDragType == .moveX {
                myPosition.x += delta.x
            } else if currentDragType == .moveY {
                myPosition.y += delta.y
            } else {
                myPosition.x += delta.x
                myPosition.y += delta.y
            }

            self.center = myPosition
            
            pan.setTranslation(.zero, in: self.superview)
        case .ended, .cancelled:
            
            guard let superView = self.superview else { return }
            
            if self.frame.minX < 0 {
                self.frame.origin.x = 0
            } else if self.frame.maxX > superView.frame.maxX {
                self.frame.origin.x = superView.frame.maxX - self.frame.width
            }
        case .failed:
            print("failed")
        @unknown default:
            print("unknown")
        }
    }
}

