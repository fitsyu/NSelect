// https://github.com/Quick/Quick

import Quick
import Nimble
import NSelect

class NSelectSpec: QuickSpec {
    
    override func spec() {
        
        describe("given option 1, 2, 3 ") {
            
            let myQuestion = NSelect()
            myQuestion.options = ["1", "2", "3"]
            
            
            context("when mode is single and option 1 is selected") {
                
                myQuestion.mode = .single
                myQuestion.select(option: "1")
                
                // happy path
                it("then should gives back one and only one selection") {
                    
                    guard let selections = myQuestion.selections() else {
                        XCTFail()
                        return
                    }
                    
                    expect(selections.count).to(equal(1))
                    expect(selections.contains("1")).to(beTrue())
                    
                }
                
                
                // not quite happy
                it("then should not allow to select more than one") {
                   
                    myQuestion.select(option: "2")
                    
                    expect(myQuestion.error).notTo(beNil())
                   
                }
            }
        }
        
        describe("multiple") {
            
            let myQuestion = NSelect()
            myQuestion.options = ["1", "2", "3"]
            
            context("when mode is multiple and option 1 and 2 are selected") {
                
                myQuestion.mode    = .multiple
                myQuestion.select(option: "1")
                myQuestion.select(option: "2")
                
                it("then it should gives back the selections with more than one") {
                    
                    expect(myQuestion.selections()).notTo(beNil())
                    
                    guard let selections = myQuestion.selections() else {
                        XCTFail()
                        return
                    }
                    
                    expect(selections.count).to(equal(2))
                    expect(selections.contains("1")).to(equal(true))
                    expect(selections.contains("2")).to(equal(true))
                }
            }
        }
        
    }
}
