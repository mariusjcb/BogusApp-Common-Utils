//
//  File.swift
//  
//
//  Created by Marius Ilie on 26.01.2021.
//

import XCTest
@testable import BogusApp_Common_Utils

class ObservableTests: XCTestCase {
    
    @Observable
    var sutObservable: String? = nil
    
    func test_whenObserving_shouldNotifyFirstValueAndChanges() {
        let valueExpectation = self.expectation(description: "Should notify first value")
        var calls = 0
        self._sutObservable.observe(on: self, observerBlock: {
            switch calls {
            case 0:
                XCTAssertNil($0)
                calls += 1
            case 1:
                XCTAssertEqual($0, "demo")
                valueExpectation.fulfill()
            default: XCTFail("Wrong calls value")
            }
        })
        sutObservable = "demo"
        wait(for: [valueExpectation], timeout: 1.0)
    }
    
    func test_whenChangingValue_shouldReturnNewValue() {
        sutObservable = "test"
        XCTAssertEqual(sutObservable, "test")
        sutObservable = nil
        XCTAssertEqual(sutObservable, nil)
        sutObservable = "demo"
        XCTAssertEqual(sutObservable, "demo")
    }
    
    func test_whenInstantiatingObservable_shouldRespectInitialWrappedValue() {
        XCTAssertEqual(sutObservable, nil)
    }
    
    static var allTests = [
        ("test_whenObserving_shouldNotifyFirstValueAndChanges", test_whenObserving_shouldNotifyFirstValueAndChanges),
        ("test_whenChangingValue_shouldReturnNewValue", test_whenChangingValue_shouldReturnNewValue),
        ("test_whenInstantiatingObservable_shouldRespectInitialWrappedValue", test_whenInstantiatingObservable_shouldRespectInitialWrappedValue),
    ]
}
