//
//  MenuOption.swift
//  ExamenSwift
//
//  Created by iMac on 1/04/22.
//

import Foundation

enum MenuOption: Int {
    case none = 0
    case add = 1
    case list = 2
    case search = 3
    case delete = 4
    case exit = 5
}

enum confirmDelete: Int {
 case close = 0
 case confirm = 1
}

struct Menu {
    
    func show() {
        let message = """
         ====================================
                  DARK ZONE ACADEMY
         ====================================

         1. Agregar Nuevo Alumno
         2. Listar todos los alumnos
         3. Buscar un alumno por nombre
         4. Eliminar un alumno
         5. Salir
        
        """
        self.repeatOption()
        print(message)
    }
    
    func repeatOption() {
        let separator = Array(repeating: "\n", count: 6).joined()
        print("", terminator: separator)
    }
    
}
