//
//  ViewController.swift
//  Custom TabBar
//
//  Created by Ethan Hung on 2024/5/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tabBarView: UIView!
    
    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeTabBar()
        DispatchQueue.main.async {
            self.firstPage()
        }
    }

    func customizeTabBar () {
        tabBarView.layer.cornerRadius = tabBarView.frame.height / 2
        tabBarView.clipsToBounds = true
    }
    func firstPage() {
        guard let firstPage = self.storyboard?.instantiateViewController(identifier: "FirstViewController") as? FirstViewController else { return }
        self.addChild(firstPage)
        firstPage.view.frame = contentView.bounds
        contentView.addSubview(firstPage.view)
        firstPage.didMove(toParent: self)
    }

    func removeCurrentChildViewController() {
        for child in children {
            child.willMove(toParent: nil)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
    }
    func addChildViewController(withIdentifier identifier: String) {
        guard let childViewController = self.storyboard?.instantiateViewController(identifier: identifier) as? UIViewController else { return }
        self.addChild(childViewController)
        childViewController.view.frame = contentView.bounds
        contentView.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
    }
    @IBAction func tapToChangeViews(_ sender: UIButton) {
        let tag = sender.tag
        removeCurrentChildViewController()
        print(tag)
        switch tag {
        case 1:
            firstPage()
        case 2:
            addChildViewController(withIdentifier: "SecondViewController")
        case 3:
            addChildViewController(withIdentifier: "ThirdViewController")
        case 4:
            addChildViewController(withIdentifier: "FourthViewController")
        default:
            break
        }
    }
}
    
