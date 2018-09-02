//
//  Localizacao.swift
//  Agenda
//
//  Created by Marcelo on 26/08/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class Localizacao: NSObject {

    func converterEnderecoEmCoordenadas(_ endereco:String, local:@escaping(_ local:CLPlacemark) -> Void) {
        let conversor = CLGeocoder();
        conversor.geocodeAddressString(endereco) {(listaDeLocalizacoes, error) in
            if let localizacao = listaDeLocalizacoes?.first {
                local(localizacao);
            }
        }
    }
    
    func configuraBotaoLocalizacaoAtual(mapa: MKMapView) -> MKUserTrackingButton {
        let botao = MKUserTrackingButton(mapView: mapa);
        botao.frame.origin.x = 10;
        botao.frame.origin.y = 10;
        return botao;
    }
}
