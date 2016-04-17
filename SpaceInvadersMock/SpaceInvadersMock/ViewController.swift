//
//  ViewController.swift
//  SpaceInvadersMock
//
//  Created by Francisco Amado on 16/04/16.
//  Copyright © 2016 franciscoamado. All rights reserved.
//

import UIKit

struct Game {
	var height: Float
	var width: Float
}

extension UIView {
}

class ViewController: UIViewController {

	@IBOutlet weak var containerView: UIView!
	var player: UIView!
	var bodies: [UIView]?

	override func viewDidLoad() {
		super.viewDidLoad()
//------------------------------------------------------------------------------
		bodies = createInvaders()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func createInvaders() -> [UIView] {
		var bodies: [UIView] = (0 ... 10).map() { i in
			let invader: UIView = customInvader(i)
			self.containerView.addSubview(invader)
			return invader
		}

		player = UIView(frame: CGRectMake(self.containerView.frame.width / 2, self.containerView.frame.height - 50, 25, 25))
		player.backgroundColor = UIColor.blackColor()
		self.containerView.addSubview(player)

		return bodies
	}

	func customInvader(index: Int) -> UIView {
		let size = CGSize(width: 15, height: 15)
		let origin = CGPoint(x: CGFloat((15 + 5 * 2) * index), y: self.containerView.frame.origin.y + 16)
		let invader = UIView(frame: CGRect(origin: origin, size: size))
		invader.backgroundColor = UIColor.blackColor()

		return invader
	}
}
