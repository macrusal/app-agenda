//
//  ImagePicker.swift
//  Agenda
//
//  Created by Marcelo on 25/08/2018.
//  Copyright © 2018 Alura. All rights reserved.
//

import UIKit

enum MenuOpcaoes {
    case camera
    case biblioteca
}

protocol ImagePickerFotoSelecionada {
    func imagePickerImagemSelecionada(_ fot:UIImage)
}

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Atributos
    
    var delegate:ImagePickerFotoSelecionada?
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let foto = info[UIImagePickerControllerOriginalImage] as! UIImage;
        delegate?.imagePickerImagemSelecionada(foto);
        picker.dismiss(animated: true, completion: nil);
    }
    
    func menuDeOpcaoes(completion:@escaping(_ opcao:MenuOpcaoes) -> Void) -> UIAlertController {
        let menu = UIAlertController(title: "Atenção", message: "escolha uma das opções abaixo", preferredStyle: .actionSheet);
        let camera = UIAlertAction(title: "tirar foto", style: .default) { (acao) in
            completion(.camera);
        }
        menu.addAction(camera);
        let biblioteca = UIAlertAction(title: "biblioteca", style: .default) { (acao) in
            completion(.biblioteca);
        }
        menu.addAction(biblioteca);
        let cancelar = UIAlertAction(title: "cancelar", style: .cancel, handler: nil);
        menu.addAction(cancelar);
        
        return menu;
    }
}
