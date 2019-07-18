//
//  ViewController.swift
//  MultyThreadinTableSummer2019
//
//  Created by Viacheslav Bilyi on 7/18/19.
//  Copyright © 2019 Viacheslav Bilyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView! {
		didSet {
			tableView.delegate = self
			tableView.dataSource = self

			let nib = UINib(nibName: "MyTableViewCell", bundle: nil)
			tableView.register(nib, forCellReuseIdentifier: "MyCellId")
		}
	}


	var images: [String] = ["https://cdn.pixabay.com/photo/2015/05/28/14/53/ux-788002_1280.jpg",
	"https://cdn.pixabay.com/photo/2015/05/31/15/07/business-792113_1280.jpg",
	"https://image.shutterstock.com/image-photo/business-cards-mockup-on-color-600w-1034025634.jpg",
	"https://image.shutterstock.com/z/stock-photo-man-and-woman-working-in-the-office-collaborative-teamwork-374619853.jpg",
	"https://image.shutterstock.com/z/stock-photo-two-colleagues-interior-designer-discussing-data-and-digital-tablet-and-computer-laptop-with-sample-370233089.jpg",
	"https://cdn.pixabay.com/photo/2014/05/02/21/49/home-office-336373_1280.jpg"]
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return images.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "MyCellId", for: indexPath) as! MyTableViewCell

		cell.configure(path: images[indexPath.row])

		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 300
	}
}
