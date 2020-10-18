//
//  UseCase.swift
//  MVISwiftUI
//
//  Created by Endtry on 18/10/2563 BE.
//

import Foundation

/**
 * protocol MyUseCase: UseCase where Param == Int, Result == Promise<Holiday> {}
 */
protocol UseCase {
    associatedtype Param
    associatedtype Result
    
    func execute(params: Param) -> Result
}
