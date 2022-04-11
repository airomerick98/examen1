//
//  studentManager.swift
//  ExamenSwift
//
//  Created by iMac on 1/04/22.
//

import Foundation

struct Student {
    let name: String
    let lastName: String
    let address: String
    let documentNumber: String
    let dateLast: String
    
    var fullNameInitials: String {
        guard let nameInitial = self.name.first else { return "Sin nombre" }
        guard let lastNameInitial = self.lastName.first else { return "Sin apellido" }
        return "\(nameInitial).\(lastNameInitial)"
    }
    
    var age: Any {
        let yearCurrent: Int = 2022
        let arrBirth = self.dateLast.components(separatedBy: "/")
        guard let year = Int(arrBirth[2]) else { return 1954 }
        return yearCurrent - year
    }
}

var students: [Student] = []

struct StudentManager {
    
    mutating func addStudent() {
        let name = inputValidated.getStringWith("Ingrese Nombre:", errorMessage: "Debe completar nombre para continuar al siguiente paso")
        
        let lastName = inputValidated.getStringWith("Ingrese Apellido:", errorMessage: "Debe completar apellido para continuar al siguiente paso")
        
        let address = inputValidated.getStringWith("Ingrese Dirección:", errorMessage: "Debe completar dirección para continuar al siguiente paso")
        
        let documentNumber = inputValidated.getStringWith("Ingrese Numero Documento:", errorMessage: "Debe completar numero documento para continuar al siguiente paso")
        
        let dateLast = inputValidated.getStringWith("Ingrese Fecha de Nacimiento:", errorMessage: "Debe completar fecha de nacimiento para continuar al siguiente paso")
        
        students.append(Student(name: name, lastName: lastName, address: address, documentNumber: documentNumber, dateLast: dateLast))
        
        print("Se registro el alumno correctamente.")
    }
 
    func listStudents() {
        print("Alumnos:")
        
        for (i, student) in students.enumerated() {
            print("- \(i + 1) ) \(student.fullNameInitials) \(student.name) \(student.lastName)")
        }
    }
    
    func searchStudent() {
        let optionSearch = inputValidated.getStringWith("Ingrese Numero Documento:", errorMessage: "Numero Documento incorrecto")
        let studentFilter = students.filter({$0.documentNumber == optionSearch})
        print("""
           ==============================================
                                Alumno
           ==============================================
        """)
        for (i, student) in studentFilter.enumerated() {
            print("""
                Alumno Encontrado:
                \(i + 1))
                - Nombre: \(student.name) \(student.lastName)
                - Fecha Nacimientp: \(student.dateLast)
                - Dirección: \(student.address)
                - Numero Documento: \(student.documentNumber)
                - Edad: \(student.age)
                
            """)
        }
    }
    
    func deleteStudent() {
        let optionDelete = inputValidated.getStringWith("Ingrese Numero Documento:", errorMessage: "Numero Documento incorrecto")
        guard let index = students.firstIndex(where: {$0.documentNumber == optionDelete}) else {
            print("Numero documento no reconocido")
            return
        }
        let confirm = inputValidated.getIntWith("¿ Desea eliminar el alumno ? 0 - Cancelar , 1 - Eliminar", errorMessage: "Ingrese opcion correctamente", withRange: 0...1)
        let valueOption = confirmDelete(rawValue: confirm)
        switch valueOption {
        case .none:
            break
        case .close:
            print("\n Regresando al menu \n")
        case .confirm:
            students.remove(at: index)
            print("""
               ==============================================
                        Alumno Eliminado
               ==============================================
               
            """)
        }
    }
}


