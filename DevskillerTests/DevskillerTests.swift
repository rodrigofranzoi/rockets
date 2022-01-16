//
//  DevskillerTests.swift
//  DevskillerTests
//
//  Created by Ivo Silva on 18/09/2020.
//  Copyright © 2020 Mindera. All rights reserved.
//

import XCTest
@testable import Devskiller

class DevskillerTests: XCTestCase {
    
    let model: MainViewModel = MainViewModel(missionsService: MissionsService(api: TestApi()),
                                             companyService: CompanyService(api: TestApi()))
    lazy var vc = MainViewController(model: model)
    

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func testMainModel() throws {
        XCTAssertEqual(model.missions.count, 0)
        XCTAssertEqual(model.info, "")
        XCTAssertEqual(model.years.count, 0)
        
        model.loadData()
        
        XCTAssertEqual(model.missions.count, 2)
        XCTAssertEqual(model.years.count, 1)
        XCTAssertEqual(model.missions[0].launch_year, "2018")
        XCTAssertEqual(model.info, "Rodrigo was founded by Rodrigo in 2021. It has now 200 employees, 200 launch sites, and is valuated at USD 10000000.")
    }
    
    func testMainCellModel() throws {

        model.loadData()
        let cellModel = MainCellModel(mission: model.missions[0])
        
        XCTAssertEqual(cellModel.daysTitle, "Days since:")
        XCTAssertEqual(cellModel.patchUrl, "https://eu.ui-avatars.com/api/?size=48&name=Tt")
        XCTAssertEqual(cellModel.rocketName, "Rocket / 1")
    }

}
