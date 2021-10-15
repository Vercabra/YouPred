//
//  PlotView.swift
//  YouPred
//
//  Created by Dmitriy Dmitriyev on 15.10.2021.
//

class PlotView: BaseLoadableView {
    @IBOutlet private weak var plotView: ScatterChartView!
    
    var data: [[Double]]?
    var dataSet: ScatterChartDataSet?
    
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
        let dataSet = ScatterChartDataSet(entries: dataEntries, label: "DataSet")
        dataSet.scatterShapeSize = 4
        dataSet.setScatterShape(.circle)
        plotView.data = ScatterChartData(dataSet: dataSet)
        self.dataSet = dataSet
    }
    
    private func generateData() -> [ChartDataEntry] {
        var data: [ChartDataEntry] = []
        self.data?.forEach { data.append(ChartDataEntry(x: $0[0], y: $0[1])) }
        return data
    }
}
