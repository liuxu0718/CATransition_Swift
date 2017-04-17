//
//  ViewController.swift
//  CATransition_Swift
//
//  Created by liuxu on 2017/4/17.
//  Copyright © 2017年 liuxu. All rights reserved.
//

import UIKit

enum AnimaitonType:Int {
    case Push, Reveal, MoveIn, Cube, SuckEffect, OglFlip, RippleEffect, PageCurl, PageUnCurl, CameraIrisHollowOpen, CameraIrisHollowClose
}


class ViewController: UIViewController {
    
    let dataArray = ["推挤", "揭开", "覆盖", "立方体", "吮吸", "翻转", "波纹", "翻页", "反翻页", "开镜头", "关镜头"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.cyan
        let tableView = UITableView.init(frame: self.view.bounds)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell.init(style: .value1, reuseIdentifier: "cell");
        cell.textLabel?.text = self.dataArray[indexPath.row]
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = AnimaitonType(rawValue: indexPath.row)!;
        let animation = CATransition.init()
        //animation direction
        animation.subtype = kCATransitionFromRight
        animation.duration = 1
        switch type {
        case .Push:
            animation.type = kCATransitionPush
        case .Reveal:
            animation.type = kCATransitionReveal
        case .MoveIn:
            animation.type = kCATransitionMoveIn
        case .Cube:
            animation.type = "cube"
        case .SuckEffect:
            animation.type = "suckEffect"
        case .OglFlip:
            animation.type = "oglFlip"
        case .RippleEffect:
            animation.type = "rippleEffect"
        case .PageCurl:
            animation.type = "pageCurl"
        case .PageUnCurl:
            animation.type = "pageUnCurl"
        case .CameraIrisHollowOpen:
            animation.type = "cameraIrisHollowOpen"
        case .CameraIrisHollowClose:
            animation.type = "cameraIrisHollowClose"
        default:
            break;
        }
        self.view.layer.add(animation, forKey: "animation")
    }
}

