//
//  main.swift
//  ExamenSwift
//
//  Created by iMac on 31/03/22.
//

import Foundation

var option: MenuOption

let menu = Menu()
let inputValidated = InputValidated()
var studentMager = StudentManager()

repeat {
    menu.show()
    let valueOption = inputValidated.getIntWith("Ingrese una opción", errorMessage: "La opcion ingresada es incorrecta", withRange: 1...5)
    option = MenuOption(rawValue: valueOption) ?? .none
    
    switch option {
    case .none:
        break
    case .add:
        studentMager.addStudent()
    case .list:
        studentMager.listStudents()
    case .search:
        studentMager.searchStudent()
    case .delete:
        studentMager.deleteStudent()
    case .exit:
        inputValidated.showMessage(message: "Sessión Cerrada")
    }
    
} while option != .exit && option != .none

