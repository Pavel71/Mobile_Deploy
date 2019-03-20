import UIKit
import PlaygroundSupport


class MyViewController: UIViewController {
  
  var button = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initView()
    
    button.addTarget(self, action: #selector(pressButton(sender:)), for: .touchUpInside)
  }
  
  // идет отрисовка объектов по координатам
  override func viewDidAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    
    initButton()
    
  }
  
  private func initView() {
    self.title = "VC1"
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
  }
  
  //MARK: Button
  private func initButton() {
    
    button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    button.center = view.center
    button.setTitle("Нажми VC1", for: .normal)
    button.layer.cornerRadius = 10
    button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    button.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
    
    view.addSubview(button)
  }
  
  @objc private func pressButton(sender: UIButton) {

    print(sender.currentTitle)
    
    let vc2 = MyViewController2()
    self.navigationController?.pushViewController(vc2, animated: true)
    
  }
  
}

class MyViewController2: UIViewController {
  
  var button = UIButton()
  
  var imageView = UIImageView()
  let imageURL = URL(string: "https://avatars.mds.yandex.net/get-pdb/1054037/892a0eab-b95b-4f37-8cc0-252d02580153/s375")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    initView()
    
    loadPhoto()
  
  }
  
  // идет отрисовка объектов по координатам
  override func viewDidAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    print("Прорисовка каркаса для картинки")
    initImage()
    
  }
  
  private func loadPhoto() {
    
    
    // Это глобальная очередь
  
    let queue = DispatchQueue.global(qos: .utility)
    print("Пошла загрузка")
    
    queue.async {
     print("Получаю data в global")
      if let data = try? Data(contentsOf: self.imageURL!) {
        // Ui должны прорисовыватся в main очереди
        DispatchQueue.main.async {
          print("Вернул data в main")
          self.imageView.image = UIImage(data: data)
        }
        
      }
    }
  }
  
  private func initImage() {
    imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    imageView.center = view.center
    imageView.contentMode = .scaleAspectFit
    
    view.addSubview(imageView)
  }
  
  private func initView() {
    self.title = "VC2"
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
  }
  
  
  
}

let vc = MyViewController()
let navigatonController = UINavigationController(rootViewController: vc)

PlaygroundPage.current.liveView = navigatonController
