//
//  Coordinator.swift
//  MVVM-Coordinator
//
//  Created by shashank mishra on 07/12/24.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
