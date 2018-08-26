//
//  Notificacoes.swift
//  Agenda
//
//  Created by Marcelo on 26/08/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

class Notificacoes: NSObject {

    func exibiNotificacaoDeMediaDosAlunos(dicionarioDeMedia:Dictionary<String, Any>) -> UIAlertController? {
        if let media = dicionarioDeMedia["media"] as? String {
            let alerta = UIAlertController(title: "Atenção", message: "a media geral dos alunos é: \(media)", preferredStyle: .alert);
            let botao = UIAlertAction(title: "OK", style: .default, handler: nil);
            alerta.addAction(botao);
            return alerta;
        }
        return nil;
    }
}
