//
//  Strings.swift
//  AppTestMovies
//
//  Created by Mario Vargas on 09/11/24.
//

import Foundation


struct Strings {
    
    struct General {
        static var okButton: String {
            return "Aceptar"
        }
        static var cancelButton: String {
            return "Cancelar"
        }
        static var networkError: String {
            return "Error de Red"
        }
        static var warning: String {
            return "Aviso"
        }
        static var networkErrorMessage: String {
            return "Asegurate de tener una buena conección a internet."
        }
        static var warningMessage: String {
            return "Por el momento esta opción no se encuentra disponible."
        }
        static var titleAlert: String {
            return "Title"
        }
        static var messageAlert: String {
            return "Alert message"
        }
    }
    
    struct WelcomeScreen {
        static var titleHeader: String {
            return "Prueba iOS Mario"
        }
        
    }
    
    struct DetailScreen {
        static var btnPlay: String {
            return " Play Video"
        }
        static var okAction: String {
            return "Ok pressed"
        }
        static var cancelAction: String {
            return "Cancel pressed"
        }
    }
    
    struct Icons {
        static var errorIcon: String {
            return "xmark.shield.fill"
        }
        static var warningIcon: String {
            return "exclamationmark.triangle.fill"
        }
        static var backArrow: String {
            return "chevron.backward"
        }
        static var movieIcon: String {
            return "movieclapper"
        }
        static var playIcon: String {
            return "play.circle"
        }
    }
}
