//
//  inputValidated.swift
//  ExamenSwift
//
//  Created by iMac on 1/04/22.
//

import Foundation


struct InputValidated {
        func getIntWith(_ message: String, errorMessage: String, withRange range: ClosedRange<Int>) -> Int {
           
           var isCorrect = false
           var number = 0
           repeat {
               
               print(message)
               if let inputValue = readLine(), inputValue.count > 0, let value = Int(inputValue), range.contains(value) {
                   number = value
                   isCorrect = true
               } else {
                   self.showErrorMessage(errorMessage)
               }
               
           } while !isCorrect
           
           return number
       }
    

       func getStringWith(_ message: String, errorMessage: String) -> String {
           
           var input = ""
           repeat {
               
               print(message)
               if let inputValue = readLine(), inputValue.count > 0 {
                   input = inputValue
               } else {
                   self.showErrorMessage(errorMessage)
               }
               
           } while input.count == 0
           
           return input
       }

       private func showErrorMessage(_ errorMessage: String) {
           
           let message = """
           ==============================================
           \(errorMessage)
           ==============================================
           
           
           """
           print(message)
       }
    
    func showMessage(message messageSend: String) {
        let message = """
        ==============================================
        \(messageSend)
        ==============================================
        
        
        """
        print(message)
    }

}
