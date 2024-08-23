import UIKit
import CoreML

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let model = try? SqueezeNet(configuration: MLModelConfiguration()) else {
            fatalError("Erro ao carregar o modelo")
        }
        
        guard let image = UIImage(named: "exampleImage") else {
            fatalError("Imagem não encontrada")
        }
        
        guard let ciImage = CIImage(image: image) else {
            fatalError("Erro to convert UIImage to CIImage")
        }
        
        let input = SqueezeNetInput(image: ciImage)
        
        guard let output = try? model.prediction(input: input) else {
            fatalError("Erro ao realize prevision")
        }
        
        let classLabel = output.classLabel
        print("Classification: \(classLabel)")
    }
}


