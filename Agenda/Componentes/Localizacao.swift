//
//  Localizacao.swift
//  Agenda
//
//  Created by Marcelo on 26/08/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
import CoreLocation

class Localizacao: NSObject {

    func converterEnderecoEmCoordenadas(_ endereco:String, local:@escaping(_ local:CLPlacemark) -> Void) {
        let conversor = CLGeocoder();
        conversor.geocodeAddressString(endereco) {(listaDeLocalizacoes, error) in
            if let localizacao = listaDeLocalizacoes?.first {
                local(localizacao);
            }
        }
    }
}
