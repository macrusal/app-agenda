//
//  MapaViewController.swift
//  Agenda
//
//  Created by Marcelo on 26/08/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: - IBOutlet
    
    @IBOutlet weak var mapa: MKMapView!
    
    // MARK: - Variaveis
    
    var aluno:Aluno?;
    lazy var gerenciadoLocalizacao = CLLocationManager();
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.localizacaoInicial();
        self.navigationItem.title = getTitulo();
        self.verificaLocalizacaoUsuario();
    }
    
    // MARK: - Metodos
    
    func verificaLocalizacaoUsuario() {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .authorizedWhenInUse:
                let botao = Localizacao().configuraBotaoLocalizacaoAtual(mapa: mapa);
                mapa.addSubview(botao);
                gerenciadoLocalizacao.startUpdatingLocation();
                break;
            case .notDetermined:
                gerenciadoLocalizacao.requestWhenInUseAuthorization();
                break;
            case .denied:
                break;
            default:
                break;
            }
        }
    }
  
    func configuraPino(_ titulo:String, localizacao:CLPlacemark) -> MKPointAnnotation {
        let pino = MKPointAnnotation();
        pino.title = titulo;
        pino.coordinate = localizacao.location!.coordinate;
        
        return pino;
    }
    
    func localizacaoInicial() {
        Localizacao().converterEnderecoEmCoordenadas("Sé - São Paulo") { (localizacaoEncontrada) in
            let pino = self.configuraPino("Sé - São Paulo", localizacao: localizacaoEncontrada);
            let regiao = MKCoordinateRegionMakeWithDistance(pino.coordinate, 5000, 5000);
            self.mapa.setRegion(regiao, animated: true);
            self.mapa.addAnnotation(pino);
            self.localizarAluno();
        }
    }
    
    func localizarAluno() {
        if let aluno = aluno {
            Localizacao().converterEnderecoEmCoordenadas(aluno.endereco!) { (localizacaoEncontrada) in
                let pino = self.configuraPino(aluno.nome!, localizacao: localizacaoEncontrada);
                self.mapa.addAnnotation(pino);
                self.mapa.showAnnotations(self.mapa.annotations, animated: true);
            }
        }
    }
    
    func getTitulo() -> String {
        return "Localizar Contatos";
    }
    
    //MARK: - CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            let botao = Localizacao().configuraBotaoLocalizacaoAtual(mapa: mapa);
            mapa.addSubview(botao);
            gerenciadoLocalizacao.startUpdatingLocation();
            break;
        default:
            break;
        }
    }
}
