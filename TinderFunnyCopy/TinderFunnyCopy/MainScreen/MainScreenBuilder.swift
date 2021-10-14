//
//  MainScreenBuilder.swift
//  TinderFunnyCopy
//
//  Created by macuser on 13.10.2021.
//  
//

import UIKit


class MainScreenBuilder: NSObject {
  class func viewController() -> MainScreenViewController {
    let view = MainScreenView.create() as MainScreenViewProtocol
    let model: MainScreenModelProtocol = MainScreenModel()
    let dataSource = MainScreenDataSource(withModel: model)
    let viewController = MainScreenViewController(withView: view, model: model, dataSource: dataSource)
    return viewController
  }
}

