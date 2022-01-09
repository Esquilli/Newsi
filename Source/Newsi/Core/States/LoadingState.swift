//
//  ViewState.swift
//  Newsi
//
//  Created by Pedro Fernandez on 1/7/22.
//

import Foundation

enum LoadingState<E> {
    case loading
    case failed(Error)
    case success(E)
}
