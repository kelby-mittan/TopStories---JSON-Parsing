//
//  ViewController.swift
//  TopStories
//
//  Created by Kelby Mittan on 11/25/19.
//  Copyright © 2019 Kelby Mittan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dump(HeadlinesData.getHeadlines())
    }


}

