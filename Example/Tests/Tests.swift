// https://github.com/Quick/Quick

import Quick
import Nimble
import NSelect

class NSelect {
    
    let title: String?
    let options: [String]
    let selections: [String]?
}

//
let myQuestion = NSelect()
myQuestion.title = "Ideal workplace for you"
myQuestion.options = [ "Calm", "Noisy", "Peaceful", "Hectic" ]
myQuestion.defaultSelections = [ "Calm" ]
myQuestion.mode = NSelect.Mode.single | .multi

// it's just a passive component
// just give it a NSelect and it will do presentation logic to user
let myQuestionViewer: NSelectView = DefaultNSelectView()
myQuestionViewer.backing = myQuestion


// at any point in time
// we can get about user selection this way
if let userSelections = myQuestion.selections { // or myQuestionViewer.backing.selections

} else {
    // no selection
    // we can get default selection if it was provided
    print(myQuestion.defaultSelections)
}





class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("these will fail") {

            it("can do maths") {
                expect(1) == 2
            }

            it("can read") {
                expect("number") == "string"
            }

            it("will eventually fail") {
                expect("time").toEventually( equal("done") )
            }
            
            context("these will pass") {

                it("can do maths") {
                    expect(23) == 23
                }

                it("can read") {
                    expect("🐮") == "🐮"
                }

                it("will eventually pass") {
                    var time = "passing"

                    DispatchQueue.main.async {
                        time = "done"
                    }

                    waitUntil { done in
                        Thread.sleep(forTimeInterval: 0.5)
                        expect(time) == "done"

                        done()
                    }
                }
            }
        }
    }
}
