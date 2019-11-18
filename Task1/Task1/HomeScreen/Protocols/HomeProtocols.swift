

import Foundation
import UIKit


protocol HomeViewToPresenterProtocol: class {
    var view: HomePresenterToViewProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
    
}

protocol HomePresenterToViewProtocol: class {
    var presenter: HomeViewToPresenterProtocol? { get set }
    
}

protocol HomePresenterToInteractorProtocol: class {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    
}

protocol HomeInteractorToPresenterProtocol: class {
    var interactor: HomePresenterToInteractorProtocol? { get set }
    
    
}

protocol HomePresenterToRouterProtocol: class {
    static func createHomeModule() -> UIViewController?
}
