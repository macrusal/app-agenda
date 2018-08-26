//
//  MapaViewController.swift
//  Agenda
//
//  Created by Marcelo on 26/08/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var mapa: MKMapView!
    
    // MARK: - Variaveis
    
    var aluno:Aluno?;
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad();
        self.localizacaoInicial();
        self.localizarAluno();
        self.navigationItem.title = getTitulo();
    }
    
    // MARK: - Metodos
  
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
        }
    }
    
    func localizarAluno() {
        if let aluno = aluno {
            Localizacao().converterEnderecoEmCoordenadas(aluno.endereco!) { (localizacaoEncontrada) in
                let pino = self.configuraPino(aluno.nome!, localizacao: localizacaoEncontrada);
                self.mapa.addAnnotation(pino);
            }
        }
    }
    
    func getTitulo() -> String {
        return "Localizar Contatos";
    }
    
}
