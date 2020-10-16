//
//  TodayView.swift
//  appstoreclone
//
//  Created by Andrei Blaj on 10/6/20.
//

import UIKit

class TodayView: UIViewController, UIScrollViewDelegate {
    
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
        return label
    }()
    
    lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.text = "Today"
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
    
    // MARK: - Cards Table View
    lazy var cardsTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.registerCell(GenericTableViewCell<CardView>.self)
        return tableView
    }()
    
    let cardsViewData: [CardViewModel] = CardsData.shared.cards
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
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

extension TodayView {
    
    func configureView() {
        view.backgroundColor = .white
        configureScrollView()
        configureTopView()
        configureCardsView()
    }
    
    func configureScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
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
            topView.widthAnchor.constraint(equalToConstant: view.frame.size.width)
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
    
    func configureCardsView() {
        scrollView.addSubview(cardsTableView)
        NSLayoutConstraint.activate([
            cardsTableView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            cardsTableView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            cardsTableView.widthAnchor.constraint(equalToConstant: view.frame.size.width),
            cardsTableView.heightAnchor.constraint(equalToConstant: CGFloat(450 * cardsViewData.count)),
            cardsTableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
}

extension TodayView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cardsViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cardCell = tableView.dequeueReusableCell(forIndexPath: indexPath) as GenericTableViewCell<CardView>
        
        let cardViewModel = cardsViewData[indexPath.row]
        
        guard let cellView = cardCell.cellView else {
          
            let appView = AppView(cardViewModel.app)
            if let appViewModel = cardViewModel.app {
                appView?.configure(with: appViewModel)
            }
            let cardView = CardView(cardModel: cardViewModel, appView: appView)
            cardCell.cellView = cardView

            return cardCell
        }
        
        cellView.configure(with: cardViewModel)
        cardCell.clipsToBounds = false
        cardCell.contentView.clipsToBounds = false
        cardCell.cellView?.clipsToBounds = false
        
        cardCell.layer.masksToBounds = false
        cardCell.contentView.layer.masksToBounds = false
        cardCell.cellView?.layer.masksToBounds = false
        
        return cardCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cardViewModel = cardsViewData[indexPath.row]
        let detailView = DetailView(cardViewModel: cardViewModel)
        detailView.modalPresentationStyle = .overCurrentContext
        present(detailView, animated: true, completion: nil)
        
        // To wake up the UI, Apple issue with cells with selectionStyle = .none
        CFRunLoopWakeUp(CFRunLoopGetCurrent())
    }
    
    func selectedCellCardView() -> CardView? {
        
        guard let indexPath = cardsTableView.indexPathForSelectedRow else { return nil }

        let cell = cardsTableView.cellForRow(at: indexPath) as! GenericTableViewCell<CardView>
        guard let cardView = cell.cellView else { return nil }

        return cardView
    }
    
}
