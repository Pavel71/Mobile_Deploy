import Cocoa
import CreateML


let data = try MLDataTable(contentsOf: URL(fileURLWithPath: "/Users/imac/Desktop/twitter-sanders-apple3.csv"))

let (trainingData, testingData) = data.randomSplit(by: 0.8, seed: 12)

let sentimantClassifire = try MLTextClassifier(trainingData: trainingData, textColumn: "text", labelColumn: "class")

let evalutionMetrics = sentimantClassifire.evaluation(on: testingData)

let evalutionAccuracy = (1.0 - evalutionMetrics.classificationError) * 100
let metaData = MLModelMetadata(author: "PavelM", shortDescription: "NLP",version: "1.0")

//try sentimantClassifire.write(to: URL(fileURLWithPath: "/Users/imac/Desktop/TwitSentimentClassifier.mlmodel"))

try sentimantClassifire.prediction(from: "I think @CocaCola is ok ")
