//
//  PlotView.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 15.10.2021.
//

import Charts

class PlotView: BaseLoadableView {
    @IBOutlet private weak var plotView: LineChartView!
    
    var data: [[Double]]?
    var dataSet: LineChartDataSet?
    
    func configurePlot(data: [[Double]]) {
        self.data = data
        plotView.backgroundColor = .black
        plotView.noDataTextColor = .white
        plotView.rightAxis.enabled = false
        setupData()
        setupAxis()
    }
    
    private func setupAxis() {
        plotView.xAxis.labelPosition = .bottom
        plotView.xAxis.labelTextColor = .white
        plotView.leftAxis.labelTextColor = .white
        plotView.legend.textColor = .white
    }
    
    private func setupData() {
        let dataEntries = generateData()
        let dataSet = LineChartDataSet(entries: dataEntries, label: "Videos")
        dataSet.circleRadius = 4
        dataSet.circleHoleRadius = 2
        plotView.data = LineChartData(dataSet: dataSet)
        self.dataSet = dataSet
    }
    
    private func generateData() -> [ChartDataEntry] {
        var data: [ChartDataEntry] = []
        self.data?.forEach { data.append(ChartDataEntry(x: $0[0], y: $0[1])) }
        return data
    }
}
