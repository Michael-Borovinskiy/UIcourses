//
//  CustomHeader.swift
//  AuthApp
//
//  Created by Михаил on 22.12.2020.
//

//import UIKit
//
//class CustomHeader: UITableViewHeaderFooterView {
//    let title = UILabel()
//
//    override init(reuseIdentifier: String?) {
//        super.init(reuseIdentifier: reuseIdentifier)
//        configureContents()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func configureContents() {
//
//        title.translatesAutoresizingMaskIntoConstraints = false
//        contentView.addSubview(title)
//
//        // Center the image vertically and place it near the leading
//        // edge of the view. Constrain its width and height to 50 points.
//        NSLayoutConstraint.activate([
//            title.heightAnchor.constraint(equalToConstant: 10),
//            title.leadingAnchor.constraint(equalTo: contentView.trailingAnchor,
//                   constant: 8),
//            title.trailingAnchor.constraint(equalTo:
//                                                superview!.trailingAnchor, constant: 10),
//            title.centerYAnchor.constraint(equalTo: superview!.centerYAnchor)
//        ])
//    }
//}
