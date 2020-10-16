//
//  CardViewModel.swift
//  appstoreclone
//
//  Created by Andrei Blaj on 10/6/20.
//

import UIKit

enum CardViewMode {
    case full
    case card
}

enum CardViewType {
    case appOfTheDay(bgImage: UIImage, bgType: BackgroundType?, app: AppViewModel)
    case appCollection(apps: [AppViewModel], title: String, subtitle: String)
    case appArticle(bgImage: UIImage, bgType: BackgroundType?, title: String, subtitle: String, description: String, app: AppViewModel)
  
    var backgroundImage: UIImage? {
        switch self {
        case .appOfTheDay(let bgImage, _, _), .appArticle(let bgImage, _, _, _, _, _):
            return bgImage
        default:
            return nil
        }
    }
}

class CardViewModel {
  
    var viewMode: CardViewMode = .card
    let viewType: CardViewType
    var title: String? = nil
    var subtitle: String? = nil
    var description: String? = nil
    var app: AppViewModel? = nil
    var appCollection: [AppViewModel]? = nil
    var backgroundImage: UIImage? = nil
    var backgroundType: BackgroundType = .light
  
    init(viewType: CardViewType) {
        self.viewType = viewType
        switch viewType {
        case .appArticle(let bgImage, let bgType, let title, let subtitle, let description, let app):
            self.backgroundImage = bgImage.imageWith(newSize: CGSize(width: 375, height: 450))
            self.title = title
            self.subtitle = subtitle
            self.description = description
            self.app = app
            self.backgroundType = bgType ?? .light
        case .appOfTheDay(let bgImage, let bgType, let app):
            self.backgroundImage = bgImage.imageWith(newSize: CGSize(width: 375, height: 450))
            self.app = app
            self.backgroundType = bgType ?? .light
        case .appCollection(let apps, let title, let subtitle):
            self.appCollection = apps
            self.title = title
            self.subtitle = subtitle
        }
    }
}

