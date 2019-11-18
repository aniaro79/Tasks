

import Foundation
import UIKit

class HomePresenter: HomeViewToPresenterProtocol,HomeInteractorToPresenterProtocol{
    var view: HomePresenterToViewProtocol?
    
    var router: HomePresenterToRouterProtocol?
    
    var interactor: HomePresenterToInteractorProtocol?
    
    
}
