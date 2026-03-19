//
//  TravelLogUITests.swift
//  TravelLogUITests
//
//  Created by Tatiana Ampilogova on 3/3/26.
//

import XCTest

final class TravelLogUITests: XCTestCase {

    func testUIElenents() {
        let app = XCUIApplication()
        app.activate()
        XCTAssertTrue(app.staticTexts["TravelLog"].exists)
    }
    
    func testAddCountry() {
        let app = XCUIApplication()
        app.activate()
        
        let element = app.buttons["AddCountryView"].firstMatch
        element.tap()
        app/*@START_MENU_TOKEN@*/.textFields["Country"]/*[[".otherElements.textFields[\"Country\"]",".textFields[\"Country\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.textFields["Country"]/*[[".otherElements",".textFields[\"US\"]",".textFields[\"Country\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("USA")
        
        let element2 = app.textFields["Memory"].firstMatch
        element2.tap()
        element2.tap()
        app/*@START_MENU_TOKEN@*/.textFields["Memory"]/*[[".otherElements",".textFields[\"Goo\"]",".textFields[\"Memory\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("Good")
        app/*@START_MENU_TOKEN@*/.buttons["Increment"]/*[[".steppers",".buttons[\"Rating: 4, Increment\"]",".buttons[\"Increment\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.doubleTap()
        element.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Americas"]/*[[".otherElements.staticTexts[\"Americas\"]",".staticTexts[\"Americas\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["USA"]/*[[".otherElements.staticTexts[\"USA\"]",".staticTexts[\"USA\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
    }
    func testDelete() {
        let app = XCUIApplication()
        app.activate()
        let element = app.buttons["AddCountryView"].firstMatch
        element.tap()
        app/*@START_MENU_TOKEN@*/.textFields["Country"]/*[[".otherElements.textFields[\"Country\"]",".textFields[\"Country\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        app/*@START_MENU_TOKEN@*/.textFields["Country"]/*[[".otherElements",".textFields[\"Russia\"]",".textFields[\"Country\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("Russia")
        
        let element2 = app/*@START_MENU_TOKEN@*/.textFields["Memory"]/*[[".otherElements.textFields[\"Memory\"]",".textFields[\"Memory\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.firstMatch
        element2.tap()
        element2.tap()
        app/*@START_MENU_TOKEN@*/.textFields["Memory"]/*[[".otherElements",".textFields[\"Goo\"]",".textFields[\"Memory\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.typeText("good")
        app/*@START_MENU_TOKEN@*/.buttons["Increment"]/*[[".steppers",".buttons[\"Rating: 4, Increment\"]",".buttons[\"Increment\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.doubleTap()
        app/*@START_MENU_TOKEN@*/.buttons["Increment"]/*[[".steppers",".buttons[\"Rating: 5, Increment\"]",".buttons[\"Increment\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.firstMatch.tap()
        element.tap()
        app.cells/*@START_MENU_TOKEN@*/.firstMatch/*[[".containing(.other, identifier: nil).firstMatch",".firstMatch"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        app.buttons["Delete"].firstMatch.tap()
        
    }
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        // This measures how long it takes to launch your application.
        measure(metrics: [XCTApplicationLaunchMetric()]) {
            XCUIApplication().launch()
        }
    }
}
