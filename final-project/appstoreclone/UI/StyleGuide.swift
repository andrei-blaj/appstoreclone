//
//  StyleGuide.swift
//  appstoreclone
//
//  Created by Andrei Blaj on 10/6/20.
//

import UIKit


enum BackgroundType: String {
    case light
    case dark
    
    var titleTextColor: UIColor {
        switch self {
        case .dark:
            return .lightTitleTextColor
        case .light:
            return .darkTitleTextColor
        }
    }
    
    var subtitleTextColor: UIColor {
        switch self {
        case .dark:
            return .lightSubtitleTextColor
        case .light:
            return .darkSubtitleTextColor
        }
    }
}

extension UIColor {
    static let backgroundColor = UIColor(red: 0.99, green: 0.99, blue: 0.99, alpha: 1.00)
    static let buttonBackgroundColor = UIColor(red: 0.94, green: 0.95, blue: 0.96, alpha :1.00)
    static let borderColor: UIColor =  UIColor(red: 0.35, green: 0.35, blue: 0.35, alpha: 0.3)
    static let heroTextColor: UIColor = .white
    static let lightSubtitleTextColor: UIColor = UIColor.white.withAlphaComponent(0.8)
    static let lightTitleTextColor: UIColor = .white
    static let darkSubtitleTextColor: UIColor = .gray
    static let darkTitleTextColor: UIColor = .black
}

extension CGFloat {
    static let heroTextSize: CGFloat = 50.0
    static let headerTextSize: CGFloat = 28.0
    static let subHeaderTextSize: CGFloat = 15.0
    static let appHeaderTextSize: CGFloat = 15.0
    static let appSubHeaderTextSize: CGFloat = 13.0
    static let tinyTextSize: CGFloat = 8.0
}

extension UILabel {
  
    func configureHeaderLabel(withText text: String) {
        configure(withText: text, size: .headerTextSize, alignment: .left, lines: 0, weight: .bold)
    }

    func configureSubHeaderLabel(withText text: String) {
        configure(withText: text, size: .subHeaderTextSize, alignment: .left, lines: 0, weight: .semibold)
    }

    func configureHeroLabel(withText text: String) {
        configure(withText: text, size: .heroTextSize, alignment: .left, lines: 0, weight: .heavy)
    }

    func configureAppHeaderLabel(withText text: String){
        configure(withText: text, size: .appHeaderTextSize, alignment: .left, lines: 2, weight: .medium)
    }

    func configureAppSubHeaderLabel(withText text: String) {
        configure(withText: text, size: .appSubHeaderTextSize, alignment: .left, lines: 2, weight: .regular)
    }

    func configureTinyLabel(withText text: String) {
        configure(withText: text, size: .tinyTextSize, alignment: .center, lines: 1, weight: .regular)
    }

    private func configure(withText newText: String,
                         size: CGFloat,
                         alignment: NSTextAlignment,
                         lines: Int,
                         weight: UIFont.Weight) {
        text = newText
        font = UIFont.systemFont(ofSize: size, weight: weight)
        textAlignment = alignment
        numberOfLines = lines
        lineBreakMode = .byTruncatingTail
    }
    
}

extension UIImageView {
    func configureAppIconView(forImage appImage: UIImage, size: CGFloat) {
        image = appImage
        contentMode = .scaleAspectFit
        layer.cornerRadius = size/5.0
        layer.borderColor = UIColor.borderColor.cgColor
        layer.borderWidth = 0.5
        clipsToBounds = true
    }
}

extension UIButton {
    func roundedActionButton(withText text: String) {
        let bgColor: UIColor = text == AppAccess.onCloud.description ? .clear : .buttonBackgroundColor
        backgroundColor = bgColor
        if text == AppAccess.onCloud.description {
            setTitle("", for: UIControl.State.normal)
            setImage(UIImage(named: text), for: .normal)
        } else {
            setTitle(text, for: UIControl.State.normal)
        }
        titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        layer.cornerRadius = 15
        contentEdgeInsets = UIEdgeInsets(top: 5.5, left: 0, bottom:5.5, right: 0)
    }
}

extension UIStackView {
    func configure(withAxis axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, spacing: CGFloat, distribution: UIStackView.Distribution = .fill) {
        self.axis = axis
        self.alignment = alignment
        self.spacing = spacing
        self.distribution = distribution
    }
}

