//
//  ViewController.swift
//  Chapter16-1
//
//  Created by daito yamashita on 2021/03/24.
//

import UIKit

class ViewController: UIViewController {

    var angle: CGFloat = 180.0
    
    @IBAction func dragColor(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        //
        if translation.x > 0 {
            // 右方向へドラッグしたら色相環を右回り
            angle -= 1.0
        } else {
            // 左方向へドラッグしたら色相環を左回り
            angle += 1.0
        }
        
        if angle < 0 {
            angle += 360
        } else if angle > 360 {
            angle -= 360
        }
        
        let color = UIColor(
            hue: angle / 360,
            saturation: 1.0,
            brightness: 1.0,
            alpha: 1.0
        )
        view.backgroundColor = color
    }
    
    @IBAction func dragging(_ sender: UIPanGestureRecognizer) {
        // Outlet接続しなくてもsender.view!で参照できる
        let tombo = sender.view!
        tombo.center = sender.location(in: self.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(
            hue: angle / 360,
            saturation: 1.0,
            brightness: 1.0,
            alpha: 1.0
        )
    }


}

