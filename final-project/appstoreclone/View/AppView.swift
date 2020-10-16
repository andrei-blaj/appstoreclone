//
//  AppView.swift
//  appstoreclone
//
//  Created by Andrei Blaj on 10/6/20.
//

import UIKit

class AppView: UIView {
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = backgroundType.titleTextColor
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = backgroundType.subtitleTextColor
        return label
    }()
    
    lazy var buttonSubtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = backgroundType.subtitleTextColor
        return label
    }()
    
    lazy var getButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var labelsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var detailsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let appViewType: AppViewType
    var viewModel: AppViewModel
    
    var backgroundType: BackgroundType = .light {
        didSet {
            titleLabel.textColor = backgroundType.titleTextColor
            subtitleLabel.textColor = backgroundType.subtitleTextColor
            buttonSubtitleLabel.textColor = backgroundType.subtitleTextColor
        }
    }
 
    init?(_ viewModel: AppViewModel?) {
        guard let viewModel = viewModel else { return nil }
        self.viewModel = viewModel
        self.appViewType = viewModel.appViewType
        super.init(frame: .zero)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        configureViews()
        configureLabelsView()
        backgroundColor = .clear
        
        switch appViewType {
        case .featured:
            addFeaturedTopViews()
        case .horizontal:
            addDetailViews()
        case .none:
            break
        }
    }
    
    func configureViews() {
        iconImageView.configureAppIconView(forImage: viewModel.iconImage, size: appViewType.imageSize)
        
        titleLabel.configureAppHeaderLabel(withText: viewModel.name)
        
        subtitleLabel.configureAppSubHeaderLabel(withText: viewModel.category.description.uppercasedFirstLetter)
        
        buttonSubtitleLabel.configureTinyLabel(withText: "In-App Purchases")
        
        getButton.roundedActionButton(withText: viewModel.appAccess.description)
    }
    
    func configureLabelsView() {
        
        labelsView.addSubview(subtitleLabel)
        
        NSLayoutConstraint.activate([
            subtitleLabel.leftAnchor.constraint(equalTo: labelsView.leftAnchor),
            subtitleLabel.bottomAnchor.constraint(equalTo: labelsView.bottomAnchor),
            subtitleLabel.widthAnchor.constraint(equalTo: labelsView.widthAnchor)
        ])
        
        labelsView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: labelsView.leftAnchor),
            titleLabel.widthAnchor.constraint(equalTo: labelsView.widthAnchor),
            titleLabel.topAnchor.constraint(equalTo: labelsView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -2.0)
            
        ])
        
    }
    
    fileprivate func addHorizontalLabelsAndButton() {
        addSubview(labelsView)
        addSubview(getButton)
    }
    
    fileprivate func configureHorizontalLabelsAndButton() {
        
        NSLayoutConstraint.activate([
            labelsView.leftAnchor.constraint(equalTo: self.leftAnchor),
            labelsView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            labelsView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7),
            
            getButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            getButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            getButton.widthAnchor.constraint(equalToConstant: 76.0)
        ])
        
    }
    
    fileprivate func addPurchaseAvailableLabelIfNeeded() {
        
        if viewModel.hasInAppPurchase && buttonSubtitleLabel.superview == nil {
            addSubview(buttonSubtitleLabel)
            
            NSLayoutConstraint.activate([
                buttonSubtitleLabel.centerXAnchor.constraint(equalTo: getButton.centerXAnchor),
                buttonSubtitleLabel.topAnchor.constraint(equalTo: getButton.bottomAnchor, constant: 3.0)
            ])
        }

        if viewModel.hasInAppPurchase == true {
            buttonSubtitleLabel.isHidden = (viewModel.isOnDevice == true || viewModel.alreadyPurchased == true) ? true : false
        } else {
            buttonSubtitleLabel.isHidden = true
        }
        
    }
    
}

extension AppView {
    
    fileprivate func addFeaturedTopViews() {
        addSubview(iconImageView)
        addHorizontalLabelsAndButton()

        configureHorizontalLabelsAndButton()
        configureFeaturedTopViews()
    }
    
    fileprivate func configureFeaturedTopViews() {
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: self.topAnchor),
            iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: appViewType.imageSize),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor)
        ])
        
        configureHorizontalLabelsAndButton()
    }
    
    func configure(with viewModel: AppViewModel) {
        self.viewModel = viewModel

        configureViews()
        switch appViewType {
        case .horizontal:
            configureDetailViews()
        case .featured:
            configureFeaturedTopViews()
        case .none:
            break
        }
    }
    
}

// MARK: - Horizontal Type -
/// Icon, name, category, get button
extension AppView {
    
    fileprivate func addDetailViews() {
        addSubview(iconImageView)
        addSubview(labelsView)
        addSubview(getButton)
        addPurchaseAvailableLabelIfNeeded()
        configureDetailViews()
    }
    
    fileprivate func configureDetailViews() {
        backgroundColor = .white

        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor),
            iconImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        
            labelsView.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 15.0),
            labelsView.rightAnchor.constraint(equalTo: getButton.leftAnchor, constant: -10.0),
            labelsView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            getButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            getButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -1.0),
            getButton.widthAnchor.constraint(equalToConstant: 76.0)
        ])
    
    }
    
}
