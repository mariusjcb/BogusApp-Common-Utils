import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(BogusApp_Common_UtilsTests.allTests),
    ]
}
#endif
