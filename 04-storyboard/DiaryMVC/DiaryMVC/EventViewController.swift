//
//  EventViewController.swift
//  DiaryMVC
//
//  Created by Vladimir Saprykin on 14.11.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

//import UIKit
//
//class EventViewController: UIViewController {
//    
//    @IBOutlet weak var recordsView: EventRecord!
//    
//    @IBOutlet weak var segmentedControl: UISegmentedControl!
//    
//    @IBAction func changeView(_ sender: UISegmentedControl) {
//        showView()
//    }
//    
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    private func showView() {
//        if segmentedControl.selectedSegmentIndex == 0 {
//            showEventsView()
//        }
//        else {
//            showTimelineView()
//        }
//    }
//    
//    
//    private func showEventsView() {
//        recordsView.clearRecords()
//        
//        if let fetchedObjects = DiaryModel.instance.diaryFetchResultController.fetchedObjects{
//            for diaryRecord in fetchedObjects{
//                addRecord(date: UIViewUtils.shortDateString(date: diaryRecord.dateCreated),
//                          weatherImage: UIViewUtils.weatherImage(weather: diaryRecord.weather),
//                          title: diaryRecord.titleText,
//                          tint: UIViewUtils.weatherColor(weather: diaryRecord.weather))
//            }
//            
//        }
//    }
//    
//    private func showTimelineView(){
//        recordsView.clearRecords()
//        
//        if let fetchedObjects = DiaryModel.instance.diaryFetchResultController.fetchedObjects{
//            
//            var previouseDiaryRecord: DiaryRecord?
//            
//            for diaryRecord in fetchedObjects{
//                var dateString: String? = UIViewUtils.shortDateString(date: diaryRecord.dateCreated)
//                
//                if let previouseDiaryRecord = previouseDiaryRecord{
//                    let date1 = Calendar.current.startOfDay(for: previouseDiaryRecord.dateCreated as! Date)
//                    let date2 = Calendar.current.startOfDay(for: diaryRecord.dateCreated as! Date)
//                    
//                    if date1 == date2{
//                        dateString = nil
//                    }
//                    else{
//                        let daysInBetween = abs(Int(date1.timeIntervalSince(date2) / 86400)) - 1
//                        
//                        if daysInBetween == 1{
//                            let dateToInsert = Date(timeInterval: 86400, since: date2)
//                            addRecord(date: UIViewUtils.shortDateString(date: dateToInsert as NSDate?))
//                        }
//                        else if daysInBetween > 1{
//                            addRecord(date: "...")
//                        }
//                    }
//                    
//                }
//                
//                addRecord(date: dateString,
//                          weatherImage: UIViewUtils.weatherImage(weather: diaryRecord.weather),
//                          title: diaryRecord.titleText,
//                          tint: UIViewUtils.weatherColor(weather: diaryRecord.weather))
//                
//                previouseDiaryRecord = diaryRecord
//            }
//            
//        }
//    }
//    
//    
//}
