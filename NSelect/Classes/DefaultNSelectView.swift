//
//  DefaultNSelectView.swift
//  NSelect
//
//  Created by iOSDev on 13/06/19.
//


public class DefaultNSelectView: UIView, NSelectView {
    
    public var backing: NSelect = NSelect()
    
    public var delegate: NSelectViewDelegate?
    
    public func present() {
        
        if backing.mode == .single {
            // draw radio buttons
        } else {
            // draw checkboxes
        }
        
        
        var y = 0
        
        let label = UILabel(frame: CGRect(x: 0, y: y, width: 100, height: 30))
        label.text = backing.title
        
        y += 30
        self.addSubview(label)
        
        backing.options.forEach {
            let label = UILabel(frame: CGRect(x: 0, y: y, width: 100, height: 30))
            label.text = $0
            
            y += 30
            self.addSubview(label)
        }
     
    }
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        print("init by frame")
//        present()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("init by coder")
//        present()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        print("init from nib")
//        present()
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
//        present()
    }
    
    
    
}
