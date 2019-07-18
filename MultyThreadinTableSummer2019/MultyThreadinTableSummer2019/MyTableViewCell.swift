//
//  MyTableViewCell.swift
//  MultyThreadinTableSummer2019
//
//  Created by Viacheslav Bilyi on 7/18/19.
//  Copyright © 2019 Viacheslav Bilyi. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {

	@IBOutlet weak var indicator: UIActivityIndicatorView!
	@IBOutlet weak var photoImageView: UIImageView!

	private var path: String?

	override func prepareForReuse() {
		photoImageView.image = nil
	}

	func configure(path: String) {
		self.path = path
		indicator.startAnimating()

		DispatchQueue.global(qos: .userInitiated).async { [weak self] in
			if let url = URL(string: path),
				let data = try? Data(contentsOf: url),
				let image = UIImage(data: data),
				path == self?.path {

				DispatchQueue.main.async {
					self?.photoImageView.image = image
					self?.indicator.stopAnimating()
				}
			}
		}
	}
}
