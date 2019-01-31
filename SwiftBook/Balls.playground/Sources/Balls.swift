import UIKit

public class Balls: UIView {
    
    
    ///////////////////// Properties /////////////////
    
    // список цветов для шариков
    private var colors: [UIColor]
    // шарики
    private var balls: [UIView] = []
    // размер шариков
    private var ballSize: CGSize = CGSize(width: 40, height: 40)
    // аниматор графических объектов
    private var animator: UIDynamicAnimator?
    // обработчик перемещений объектов
    private var snapBehavior: UISnapBehavior?
    // обработчик столкновений
    private var collisionBehavior: UICollisionBehavior
    
    ////////////////////// FUNC //////////////////
    
    func ballsView () {
        
        for (index,color) in self.colors.enumerated() {
            
            // Создаем шарик без размера и позиций в пространстве
            let ball = UIView(frame: CGRect.zero)
            // Красим шарик
            ball.backgroundColor = color
            
            addSubview(ball)
            // Добавляем шарик в массив
            self.balls.append(ball)
            // Вычесляем отступ шариков
            let origin = 40*index + 100
            
            ball.frame = CGRect(x: origin, y: origin,
                                width: Int(self.ballSize.width), height: Int(self.ballSize.height))
            
            self.collisionBehavior.addItem(ball)
            // с закругленными углами
            ball.layer.cornerRadius = ball.bounds.width / 2.0

        }
        
    }
    
    ///////////////////// OVERRIDE Обработка Анимации и движения ///////////////
    // Метод Касания пальцем
    override public func touchesBegan(_ touches: Set<UITouch>,
                                        with event: UIEvent?) {
        
        if let touch = touches.first {
            
            let touchLocation = touch.location( in: self )
            
            for ball in self.balls {
                
                if (ball.frame.contains( touchLocation )) {
                    
                    self.snapBehavior = UISnapBehavior(item: ball,
                                                  snapTo: touchLocation)
                    self.snapBehavior?.damping = 0.5
                    self.animator?.addBehavior(snapBehavior!)
                }
            }
        }
    }
    
    // Метод обработки движения пальцем! Тоесть шарик должен двигатся за пальцем
    override public func touchesMoved(_ touches: Set<UITouch>,
                                        with event: UIEvent?) {
        
        if let touch = touches.first {
            
            let touchLocation = touch.location( in: self )
            
            if let snapBehavior = self.snapBehavior {
                snapBehavior.snapPoint = touchLocation
            }
        }
    }
    
    // Завершаем обработку движения
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let snapBehavior = self.snapBehavior {
                self.animator?.removeBehavior(snapBehavior)
            
        }
        self.snapBehavior = nil
        
    }
    
            
    
    
    
    ///////////////////////////// INIT ////////////////////////
    // Инициализатор
    public init(colors: [UIColor]){
        
        // Получаем список цветов
        self.colors = colors
        
        // Инициализируем столкновение
        self.collisionBehavior = UICollisionBehavior(items: [])
        
        collisionBehavior.setTranslatesReferenceBoundsIntoBoundary(with:
            UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1))
        
        // Инициализируем площадку
        super.init(frame: CGRect(x: 0, y: 0, width: 400,height: 400))
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        self.animator = UIDynamicAnimator(referenceView: self)
        /* добавляем обработчик поведения при столкновении
         к аниматору */
        self.animator?.addBehavior(collisionBehavior)
        // вырисовываем шарики
        self.ballsView()
        
    }
    
    // Обязательно!
    required public init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
}

