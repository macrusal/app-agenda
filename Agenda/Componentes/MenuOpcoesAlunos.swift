//
//  MenuOpcoesAlunos.swift
//  Agenda
//
//  Created by Marcelo on 25/08/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

enum MenuActionSheetAlunos {
    case sms
    case ligacao
    case waze
    case mapa
    case abrirPaginaWeb
}

class MenuOpcoesAlunos: NSObject {

    func configuraMenuOpcoesAluno(completion:@escaping(_ opcao:MenuActionSheetAlunos) -> Void) -> UIAlertController {
        let menu = UIAlertController(title: "Atenção", message: "escolha uma das opções abaixo", preferredStyle: .actionSheet);
        let sms = UIAlertAction(title: "enviar SMS", style: .default) { (acao) in
            completion(.sms);
        }
        menu.addAction(sms);
        let ligacao = UIAlertAction(title: "ligar", style: .default) { (acao) in
            completion(.ligacao);
        }
        menu.addAction(ligacao);
        let waze = UIAlertAction(title: "localizar no waze", style: .default) { (acao) in
            completion(.waze);
        }
        menu.addAction(waze);
        let mapa = UIAlertAction(title: "localizar no mapa", style: .default) { (acao) in
            completion(.mapa);
        }
        menu.addAction(mapa);
        let abrirPaginaWeb = UIAlertAction(title: "abrir pagina Web", style: .default) { (acao) in
            completion(.abrirPaginaWeb);
        }
        menu.addAction(abrirPaginaWeb);
        
        let cancelar = UIAlertAction(title: "cancelar", style: .cancel, handler: nil);
        menu.addAction(cancelar);
        
        return menu;
    }
}
