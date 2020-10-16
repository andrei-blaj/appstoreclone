//
//  ArcadeTodayView.swift
//  appstoreclone
//
//  Created by Andrei Blaj on 10/6/20.
//

import UIKit

class ArcadeView: UIViewController, UIScrollViewDelegate {
    
    // MARK: Views
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = .clear
        view.autoresizingMask = .flexibleHeight
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.bounces = true
        view.delegate = self
        return view
    }()
    
    // MARK: - Top View -
    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.text = "TUESDAY, OCTOBER 13"
        label.textColor = .lightGray
        label.alpha = 0.0
        return label
    }()
    
    lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.text = "Arcade"
        label.textColor = .black
        return label
    }()
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .clear
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 17.5
        image.layer.borderWidth = 0.25
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.image = UIImage(named: "profile")
        image.clipsToBounds = true
        return image
    }()
    
    override func viewDidLoad() {
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    deinit {
        print("View deinit.")
    }
    
}

extension ArcadeView {
    
    func configureView() {
        view.backgroundColor = .white
        configureScrollView()
        configureTopView()
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8.0),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureTopView() {
        scrollView.addSubview(topView)
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            topView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            topView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            topView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        topView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20.0),
            dateLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 20.0),
            dateLabel.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -20.0)
        ])
        
        topView.addSubview(todayLabel)
        NSLayoutConstraint.activate([
            todayLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 2.0),
            todayLabel.leftAnchor.constraint(equalTo: dateLabel.leftAnchor),
            todayLabel.bottomAnchor.constraint(equalTo: topView.bottomAnchor)
        ])
        
        topView.addSubview(userImageView)
        NSLayoutConstraint.activate([
            userImageView.centerYAnchor.constraint(equalTo: todayLabel.centerYAnchor),
            userImageView.rightAnchor.constraint(equalTo: topView.rightAnchor, constant: -20.0),
            userImageView.widthAnchor.constraint(equalToConstant: 35.0),
            userImageView.heightAnchor.constraint(equalTo: userImageView.widthAnchor, multiplier: 1.0),
            userImageView.leftAnchor.constraint(equalTo: todayLabel.rightAnchor, constant: 8.0)
        ])
        
    }
    
}
