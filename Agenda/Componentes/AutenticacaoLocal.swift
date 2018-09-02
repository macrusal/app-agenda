//
//  AutenticacaoLocal.swift
//  Agenda
//
//  Created by Marcelo on 02/09/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
import LocalAuthentication

class AutenticacaoLocal: NSObject {

    var error : NSError?;
    
    func autorizaUsuario(completion: @escaping(_ autenticado: Bool) -> Void) {
        let contexto = LAContext();
        
        if contexto.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            contexto.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "É necessário autenticação para apagar um aluno") { (resposta, erro) in
                completion(resposta);
            }
        }
    }
}
