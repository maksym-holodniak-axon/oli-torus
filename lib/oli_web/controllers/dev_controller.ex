defmodule OliWeb.DevController do
  use OliWeb, :controller

  alias Oli.Utils.FlameGraph

  @test """
  {
    "activity_attempt_guid": "6b36017c-a696-486a-83ed-a04dce9e0926",
    "part_attempt_guid": "8f092302-06d4-440b-8f9a-aa8b7bd8b458",
    "response": {
      "IFRAME_frameCssClass": {
        "key": "IFRAME_frameCssClass",
        "path": "q:1391798251257:189|stage.simTimeline.IFRAME_frameCssClass",
        "type": 2,
        "value": ""
      },
      "IFRAME_frameHeight": {
        "key": "IFRAME_frameHeight",
        "path": "q:1391798251257:189|stage.simTimeline.IFRAME_frameHeight",
        "type": 1,
        "value": 600
      },
      "IFRAME_frameSrc": {
        "key": "IFRAME_frameSrc",
        "path": "q:1391798251257:189|stage.simTimeline.IFRAME_frameSrc",
        "type": 2,
        "value": "https://s3.us-west-2.amazonaws.com/etx-habworlds/trg-hab-world-sims/timeline.html"
      },
      "IFRAME_frameVisible": {
        "key": "IFRAME_frameVisible",
        "path": "q:1391798251257:189|stage.simTimeline.IFRAME_frameVisible",
        "type": 4,
        "value": true
      },
      "IFRAME_frameWidth": {
        "key": "IFRAME_frameWidth",
        "path": "q:1391798251257:189|stage.simTimeline.IFRAME_frameWidth",
        "type": 1,
        "value": 950
      },
      "IFRAME_frameX": {
        "key": "IFRAME_frameX",
        "path": "q:1391798251257:189|stage.simTimeline.IFRAME_frameX",
        "type": 1,
        "value": 25
      },
      "IFRAME_frameY": {
        "key": "IFRAME_frameY",
        "path": "q:1391798251257:189|stage.simTimeline.IFRAME_frameY",
        "type": 1,
        "value": 220
      },
      "IFRAME_frameZ": {
        "key": "IFRAME_frameZ",
        "path": "q:1391798251257:189|stage.simTimeline.IFRAME_frameZ",
        "type": 1,
        "value": 1
      },
      "Timeline.Controls.Minimap.disabled": {
        "id": "stage.simTimeline.Timeline.Controls.Minimap.disabled",
        "key": "Timeline.Controls.Minimap.disabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.Controls.Minimap.disabled",
        "type": 4,
        "value": false
      },
      "Timeline.Controls.Minimap.visible": {
        "id": "stage.simTimeline.Timeline.Controls.Minimap.visible",
        "key": "Timeline.Controls.Minimap.visible",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.Controls.Minimap.visible",
        "type": 4,
        "value": true
      },
      "Timeline.Controls.ShowCorrect": {
        "id": "stage.simTimeline.Timeline.Controls.ShowCorrect",
        "key": "Timeline.Controls.ShowCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.Controls.ShowCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.Controls.ShowResetEventsButton": {
        "id": "stage.simTimeline.Timeline.Controls.ShowResetEventsButton",
        "key": "Timeline.Controls.ShowResetEventsButton",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.Controls.ShowResetEventsButton",
        "type": 4,
        "value": true
      },
      "Timeline.Controls.ShowResetZoomButton": {
        "id": "stage.simTimeline.Timeline.Controls.ShowResetZoomButton",
        "key": "Timeline.Controls.ShowResetZoomButton",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.Controls.ShowResetZoomButton",
        "type": 4,
        "value": true
      },
      "Timeline.Controls.Tooltip": {
        "id": "stage.simTimeline.Timeline.Controls.Tooltip",
        "key": "Timeline.Controls.Tooltip",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.Controls.Tooltip",
        "type": 4,
        "value": true
      },
      "Timeline.Controls.Zoom.Max Years": {
        "id": "stage.simTimeline.Timeline.Controls.Zoom.Max Years",
        "key": "Timeline.Controls.Zoom.Max Years",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.Controls.Zoom.Max Years",
        "type": 1,
        "value": 15900000000
      },
      "Timeline.Controls.Zoom.Min Years": {
        "id": "stage.simTimeline.Timeline.Controls.Zoom.Min Years",
        "key": "Timeline.Controls.Zoom.Min Years",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.Controls.Zoom.Min Years",
        "type": 1,
        "value": -15900000000
      },
      "Timeline.Controls.Zoom.disabled": {
        "id": "stage.simTimeline.Timeline.Controls.Zoom.disabled",
        "key": "Timeline.Controls.Zoom.disabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.Controls.Zoom.disabled",
        "type": 4,
        "value": false
      },
      "Timeline.EventsToUse.Anthropologic": {
        "id": "stage.simTimeline.Timeline.EventsToUse.Anthropologic",
        "key": "Timeline.EventsToUse.Anthropologic",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.EventsToUse.Anthropologic",
        "type": 3,
        "value": "[]"
      },
      "Timeline.EventsToUse.Biological": {
        "id": "stage.simTimeline.Timeline.EventsToUse.Biological",
        "key": "Timeline.EventsToUse.Biological",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.EventsToUse.Biological",
        "type": 3,
        "value": "[]"
      },
      "Timeline.EventsToUse.Cosmic": {
        "id": "stage.simTimeline.Timeline.EventsToUse.Cosmic",
        "key": "Timeline.EventsToUse.Cosmic",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.EventsToUse.Cosmic",
        "type": 3,
        "value": "[]"
      },
      "Timeline.EventsToUse.Geological": {
        "id": "stage.simTimeline.Timeline.EventsToUse.Geological",
        "key": "Timeline.EventsToUse.Geological",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.EventsToUse.Geological",
        "type": 3,
        "value": "[]"
      },
      "Timeline.EventsToUse.Special": {
        "id": "stage.simTimeline.Timeline.EventsToUse.Special",
        "key": "Timeline.EventsToUse.Special",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.EventsToUse.Special",
        "type": 3,
        "value": "[1,2]"
      },
      "Timeline.anthropologic.Enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.Enabled",
        "key": "Timeline.anthropologic.Enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.Enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA1.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA1.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.date",
        "type": 1,
        "value": -3387978
      },
      "Timeline.anthropologic.anthropologicEvents.EventA1.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA1.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA1.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA1.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA1.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA1.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA1.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA1.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.index",
        "type": 1,
        "value": 1
      },
      "Timeline.anthropologic.anthropologicEvents.EventA1.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA1.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA1.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA1.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA1.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA1.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA1.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA1.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.name",
        "type": 2,
        "value": "Earliest Use of Stone Tools by Human Ancestors"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA1.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA1.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA1.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA1.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA1.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA1.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA1.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA10.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA10.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.date",
        "type": 1,
        "value": -53
      },
      "Timeline.anthropologic.anthropologicEvents.EventA10.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA10.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA10.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA10.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA10.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA10.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA10.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA10.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.index",
        "type": 1,
        "value": 10
      },
      "Timeline.anthropologic.anthropologicEvents.EventA10.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA10.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA10.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA10.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA10.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA10.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA10.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA10.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.name",
        "type": 2,
        "value": "First Human Steps on Extraterrestrial Body"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA10.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA10.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA10.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA10.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA10.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA10.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA10.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA11.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA11.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.date",
        "type": 1,
        "value": -48
      },
      "Timeline.anthropologic.anthropologicEvents.EventA11.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA11.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA11.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA11.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA11.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA11.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA11.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA11.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.index",
        "type": 1,
        "value": 11
      },
      "Timeline.anthropologic.anthropologicEvents.EventA11.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA11.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA11.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA11.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA11.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA11.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA11.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA11.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.name",
        "type": 2,
        "value": "Arecibo Message Broadcast"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA11.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA11.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA11.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA11.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA11.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA11.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA11.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA12.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA12.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.date",
        "type": 1,
        "value": -45
      },
      "Timeline.anthropologic.anthropologicEvents.EventA12.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA12.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA12.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA12.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA12.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA12.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA12.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA12.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.index",
        "type": 1,
        "value": 12
      },
      "Timeline.anthropologic.anthropologicEvents.EventA12.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA12.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA12.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA12.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA12.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA12.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA12.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA12.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.name",
        "type": 2,
        "value": "Voyagers 1 and 2 Launched"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA12.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA12.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA12.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA12.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA12.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA12.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA12.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA13.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA13.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.date",
        "type": 1,
        "value": -32
      },
      "Timeline.anthropologic.anthropologicEvents.EventA13.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA13.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA13.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA13.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA13.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA13.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA13.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA13.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.index",
        "type": 1,
        "value": 13
      },
      "Timeline.anthropologic.anthropologicEvents.EventA13.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA13.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA13.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA13.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA13.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA13.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA13.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA13.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.name",
        "type": 2,
        "value": "Hubble Space Telescope Launched"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA13.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA13.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA13.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA13.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA13.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA13.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA13.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA14.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA14.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.date",
        "type": 1,
        "value": -10
      },
      "Timeline.anthropologic.anthropologicEvents.EventA14.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA14.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA14.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA14.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA14.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA14.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA14.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA14.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.index",
        "type": 1,
        "value": 14
      },
      "Timeline.anthropologic.anthropologicEvents.EventA14.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA14.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA14.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA14.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA14.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA14.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA14.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA14.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.name",
        "type": 2,
        "value": "Voyager 1 Left Solar System"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA14.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA14.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA14.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA14.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA14.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA14.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA14.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA16.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA16.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.date",
        "type": 1,
        "value": 22978
      },
      "Timeline.anthropologic.anthropologicEvents.EventA16.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA16.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA16.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA16.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA16.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA16.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA16.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA16.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.index",
        "type": 1,
        "value": 16
      },
      "Timeline.anthropologic.anthropologicEvents.EventA16.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA16.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA16.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA16.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA16.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA16.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA16.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA16.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.name",
        "type": 2,
        "value": "Arecibo Message Reaches M13"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA16.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA16.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA16.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA16.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA16.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA16.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA16.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA17.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA17.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.date",
        "type": 1,
        "value": 37978
      },
      "Timeline.anthropologic.anthropologicEvents.EventA17.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA17.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA17.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA17.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA17.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA17.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA17.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA17.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.index",
        "type": 1,
        "value": 17
      },
      "Timeline.anthropologic.anthropologicEvents.EventA17.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA17.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA17.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA17.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA17.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA17.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA17.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA17.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.name",
        "type": 2,
        "value": "Voyager 1 Reaches Gliese 455"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA17.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA17.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA17.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA17.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA17.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA17.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA17.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA2.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA2.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.date",
        "type": 1,
        "value": -8978
      },
      "Timeline.anthropologic.anthropologicEvents.EventA2.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA2.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA2.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA2.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA2.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA2.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA2.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA2.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.index",
        "type": 1,
        "value": 2
      },
      "Timeline.anthropologic.anthropologicEvents.EventA2.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA2.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA2.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA2.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA2.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA2.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA2.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA2.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.name",
        "type": 2,
        "value": "Agriculture Invented"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA2.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA2.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA2.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA2.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA2.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA2.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA2.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA3.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA3.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.date",
        "type": 1,
        "value": -1269
      },
      "Timeline.anthropologic.anthropologicEvents.EventA3.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA3.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA3.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA3.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA3.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA3.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA3.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA3.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.index",
        "type": 1,
        "value": 3
      },
      "Timeline.anthropologic.anthropologicEvents.EventA3.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA3.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA3.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA3.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA3.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA3.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA3.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA3.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.name",
        "type": 2,
        "value": "Rome Founded"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA3.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA3.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA3.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA3.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA3.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA3.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA3.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA4.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA4.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.date",
        "type": 1,
        "value": -1546
      },
      "Timeline.anthropologic.anthropologicEvents.EventA4.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA4.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA4.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA4.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA4.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA4.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA4.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA4.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.index",
        "type": 1,
        "value": 4
      },
      "Timeline.anthropologic.anthropologicEvents.EventA4.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA4.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA4.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA4.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA4.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA4.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA4.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA4.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.name",
        "type": 2,
        "value": "Rome Collapses"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA4.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA4.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA4.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA4.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA4.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA4.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA4.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA5.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA5.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.date",
        "type": 1,
        "value": -622
      },
      "Timeline.anthropologic.anthropologicEvents.EventA5.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA5.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA5.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA5.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA5.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA5.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA5.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA5.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.index",
        "type": 1,
        "value": 5
      },
      "Timeline.anthropologic.anthropologicEvents.EventA5.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA5.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA5.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA5.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA5.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA5.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA5.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA5.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.name",
        "type": 2,
        "value": "Renaissance"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA5.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA5.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA5.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA5.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA5.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA5.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA5.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA6.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA6.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.date",
        "type": 1,
        "value": -242
      },
      "Timeline.anthropologic.anthropologicEvents.EventA6.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA6.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA6.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA6.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA6.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA6.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA6.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA6.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.index",
        "type": 1,
        "value": 6
      },
      "Timeline.anthropologic.anthropologicEvents.EventA6.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA6.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA6.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA6.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA6.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA6.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA6.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA6.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.name",
        "type": 2,
        "value": "Industrial Revolution"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA6.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA6.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA6.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA6.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA6.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA6.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA6.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA7.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA7.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.date",
        "type": 1,
        "value": -116
      },
      "Timeline.anthropologic.anthropologicEvents.EventA7.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA7.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA7.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA7.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA7.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA7.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA7.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA7.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.index",
        "type": 1,
        "value": 7
      },
      "Timeline.anthropologic.anthropologicEvents.EventA7.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA7.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA7.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA7.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA7.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA7.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA7.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA7.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.name",
        "type": 2,
        "value": "First Radio Broadcast"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA7.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA7.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA7.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA7.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA7.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA7.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA7.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA8.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA8.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.date",
        "type": 1,
        "value": -65
      },
      "Timeline.anthropologic.anthropologicEvents.EventA8.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA8.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA8.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA8.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA8.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA8.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA8.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA8.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.index",
        "type": 1,
        "value": 8
      },
      "Timeline.anthropologic.anthropologicEvents.EventA8.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA8.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA8.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA8.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA8.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA8.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA8.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA8.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.name",
        "type": 2,
        "value": "First Satellite"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA8.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA8.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA8.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA8.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA8.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA8.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA8.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA9.date": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.date",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA9.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.date",
        "type": 1,
        "value": -61
      },
      "Timeline.anthropologic.anthropologicEvents.EventA9.discrepancy ": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.discrepancy ",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA9.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.anthropologic.anthropologicEvents.EventA9.enabled": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.enabled",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA9.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA9.forceCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.forceCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA9.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA9.index": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.index",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA9.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.index",
        "type": 1,
        "value": 9
      },
      "Timeline.anthropologic.anthropologicEvents.EventA9.isCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.isCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA9.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA9.isPlaced": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.isPlaced",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA9.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA9.locked": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.locked",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA9.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.locked",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA9.name": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.name",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA9.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.name",
        "type": 2,
        "value": "First Human in Space"
      },
      "Timeline.anthropologic.anthropologicEvents.EventA9.showCorrect": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.showCorrect",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA9.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.anthropologic.anthropologicEvents.EventA9.showRanges": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.showRanges",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA9.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.anthropologic.anthropologicEvents.EventA9.userDate": {
        "id": "stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.userDate",
        "key": "Timeline.anthropologic.anthropologicEvents.EventA9.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.anthropologic.anthropologicEvents.EventA9.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.Enabled": {
        "id": "stage.simTimeline.Timeline.biological.Enabled",
        "key": "Timeline.biological.Enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.Enabled",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB1.date": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.date",
        "key": "Timeline.biological.biologicalEvents.EventB1.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.date",
        "type": 1,
        "value": -4279999996
      },
      "Timeline.biological.biologicalEvents.EventB1.discrepancy ": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.discrepancy ",
        "key": "Timeline.biological.biologicalEvents.EventB1.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB1.enabled": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.enabled",
        "key": "Timeline.biological.biologicalEvents.EventB1.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB1.forceCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.forceCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB1.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB1.index": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.index",
        "key": "Timeline.biological.biologicalEvents.EventB1.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.index",
        "type": 1,
        "value": 1
      },
      "Timeline.biological.biologicalEvents.EventB1.isCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.isCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB1.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB1.isPlaced": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.isPlaced",
        "key": "Timeline.biological.biologicalEvents.EventB1.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB1.locked": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.locked",
        "key": "Timeline.biological.biologicalEvents.EventB1.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.locked",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB1.name": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.name",
        "key": "Timeline.biological.biologicalEvents.EventB1.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.name",
        "type": 2,
        "value": "Oldest Evidence for Life"
      },
      "Timeline.biological.biologicalEvents.EventB1.showCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.showCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB1.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB1.showRanges": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.showRanges",
        "key": "Timeline.biological.biologicalEvents.EventB1.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.biological.biologicalEvents.EventB1.userDate": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.userDate",
        "key": "Timeline.biological.biologicalEvents.EventB1.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB1.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB10.date": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.date",
        "key": "Timeline.biological.biologicalEvents.EventB10.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.date",
        "type": 1,
        "value": -242997978
      },
      "Timeline.biological.biologicalEvents.EventB10.discrepancy ": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.discrepancy ",
        "key": "Timeline.biological.biologicalEvents.EventB10.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB10.enabled": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.enabled",
        "key": "Timeline.biological.biologicalEvents.EventB10.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB10.forceCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.forceCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB10.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB10.index": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.index",
        "key": "Timeline.biological.biologicalEvents.EventB10.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.index",
        "type": 1,
        "value": 10
      },
      "Timeline.biological.biologicalEvents.EventB10.isCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.isCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB10.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB10.isPlaced": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.isPlaced",
        "key": "Timeline.biological.biologicalEvents.EventB10.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB10.locked": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.locked",
        "key": "Timeline.biological.biologicalEvents.EventB10.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.locked",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB10.name": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.name",
        "key": "Timeline.biological.biologicalEvents.EventB10.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.name",
        "type": 2,
        "value": "Oldest Dinosaur Fossil"
      },
      "Timeline.biological.biologicalEvents.EventB10.showCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.showCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB10.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB10.showRanges": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.showRanges",
        "key": "Timeline.biological.biologicalEvents.EventB10.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.biological.biologicalEvents.EventB10.userDate": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.userDate",
        "key": "Timeline.biological.biologicalEvents.EventB10.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB10.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB11.date": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.date",
        "key": "Timeline.biological.biologicalEvents.EventB11.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.date",
        "type": 1,
        "value": -65997978
      },
      "Timeline.biological.biologicalEvents.EventB11.discrepancy ": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.discrepancy ",
        "key": "Timeline.biological.biologicalEvents.EventB11.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB11.enabled": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.enabled",
        "key": "Timeline.biological.biologicalEvents.EventB11.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB11.forceCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.forceCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB11.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB11.index": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.index",
        "key": "Timeline.biological.biologicalEvents.EventB11.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.index",
        "type": 1,
        "value": 11
      },
      "Timeline.biological.biologicalEvents.EventB11.isCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.isCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB11.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB11.isPlaced": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.isPlaced",
        "key": "Timeline.biological.biologicalEvents.EventB11.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB11.locked": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.locked",
        "key": "Timeline.biological.biologicalEvents.EventB11.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.locked",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB11.name": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.name",
        "key": "Timeline.biological.biologicalEvents.EventB11.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.name",
        "type": 2,
        "value": "Dinosaur Extinction"
      },
      "Timeline.biological.biologicalEvents.EventB11.showCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.showCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB11.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB11.showRanges": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.showRanges",
        "key": "Timeline.biological.biologicalEvents.EventB11.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.biological.biologicalEvents.EventB11.userDate": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.userDate",
        "key": "Timeline.biological.biologicalEvents.EventB11.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB11.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB12.date": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.date",
        "key": "Timeline.biological.biologicalEvents.EventB12.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.date",
        "type": 1,
        "value": 899995960
      },
      "Timeline.biological.biologicalEvents.EventB12.discrepancy ": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.discrepancy ",
        "key": "Timeline.biological.biologicalEvents.EventB12.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB12.enabled": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.enabled",
        "key": "Timeline.biological.biologicalEvents.EventB12.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB12.forceCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.forceCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB12.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB12.index": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.index",
        "key": "Timeline.biological.biologicalEvents.EventB12.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.index",
        "type": 1,
        "value": 12
      },
      "Timeline.biological.biologicalEvents.EventB12.isCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.isCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB12.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB12.isPlaced": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.isPlaced",
        "key": "Timeline.biological.biologicalEvents.EventB12.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB12.locked": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.locked",
        "key": "Timeline.biological.biologicalEvents.EventB12.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.locked",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB12.name": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.name",
        "key": "Timeline.biological.biologicalEvents.EventB12.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.name",
        "type": 2,
        "value": "Biosphere Collapses"
      },
      "Timeline.biological.biologicalEvents.EventB12.showCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.showCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB12.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB12.showRanges": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.showRanges",
        "key": "Timeline.biological.biologicalEvents.EventB12.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.biological.biologicalEvents.EventB12.userDate": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.userDate",
        "key": "Timeline.biological.biologicalEvents.EventB12.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB12.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB2.date": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.date",
        "key": "Timeline.biological.biologicalEvents.EventB2.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.date",
        "type": 1,
        "value": -3699999996
      },
      "Timeline.biological.biologicalEvents.EventB2.discrepancy ": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.discrepancy ",
        "key": "Timeline.biological.biologicalEvents.EventB2.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB2.enabled": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.enabled",
        "key": "Timeline.biological.biologicalEvents.EventB2.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB2.forceCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.forceCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB2.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB2.index": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.index",
        "key": "Timeline.biological.biologicalEvents.EventB2.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.index",
        "type": 1,
        "value": 2
      },
      "Timeline.biological.biologicalEvents.EventB2.isCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.isCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB2.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB2.isPlaced": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.isPlaced",
        "key": "Timeline.biological.biologicalEvents.EventB2.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB2.locked": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.locked",
        "key": "Timeline.biological.biologicalEvents.EventB2.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.locked",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB2.name": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.name",
        "key": "Timeline.biological.biologicalEvents.EventB2.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.name",
        "type": 2,
        "value": "Oldest Stromatolites"
      },
      "Timeline.biological.biologicalEvents.EventB2.showCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.showCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB2.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB2.showRanges": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.showRanges",
        "key": "Timeline.biological.biologicalEvents.EventB2.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.biological.biologicalEvents.EventB2.userDate": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.userDate",
        "key": "Timeline.biological.biologicalEvents.EventB2.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB2.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB3.date": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.date",
        "key": "Timeline.biological.biologicalEvents.EventB3.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.date",
        "type": 1,
        "value": -3499999996
      },
      "Timeline.biological.biologicalEvents.EventB3.discrepancy ": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.discrepancy ",
        "key": "Timeline.biological.biologicalEvents.EventB3.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB3.enabled": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.enabled",
        "key": "Timeline.biological.biologicalEvents.EventB3.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB3.forceCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.forceCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB3.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB3.index": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.index",
        "key": "Timeline.biological.biologicalEvents.EventB3.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.index",
        "type": 1,
        "value": 3
      },
      "Timeline.biological.biologicalEvents.EventB3.isCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.isCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB3.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB3.isPlaced": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.isPlaced",
        "key": "Timeline.biological.biologicalEvents.EventB3.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB3.locked": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.locked",
        "key": "Timeline.biological.biologicalEvents.EventB3.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.locked",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB3.name": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.name",
        "key": "Timeline.biological.biologicalEvents.EventB3.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.name",
        "type": 2,
        "value": "Oldest Bacteria Fossils"
      },
      "Timeline.biological.biologicalEvents.EventB3.showCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.showCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB3.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB3.showRanges": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.showRanges",
        "key": "Timeline.biological.biologicalEvents.EventB3.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.biological.biologicalEvents.EventB3.userDate": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.userDate",
        "key": "Timeline.biological.biologicalEvents.EventB3.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB3.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB4.date": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.date",
        "key": "Timeline.biological.biologicalEvents.EventB4.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.date",
        "type": 1,
        "value": -1779999996
      },
      "Timeline.biological.biologicalEvents.EventB4.discrepancy ": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.discrepancy ",
        "key": "Timeline.biological.biologicalEvents.EventB4.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB4.enabled": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.enabled",
        "key": "Timeline.biological.biologicalEvents.EventB4.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB4.forceCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.forceCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB4.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB4.index": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.index",
        "key": "Timeline.biological.biologicalEvents.EventB4.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.index",
        "type": 1,
        "value": 4
      },
      "Timeline.biological.biologicalEvents.EventB4.isCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.isCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB4.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB4.isPlaced": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.isPlaced",
        "key": "Timeline.biological.biologicalEvents.EventB4.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB4.locked": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.locked",
        "key": "Timeline.biological.biologicalEvents.EventB4.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.locked",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB4.name": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.name",
        "key": "Timeline.biological.biologicalEvents.EventB4.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.name",
        "type": 2,
        "value": "Oldest Eukaryote Fossils"
      },
      "Timeline.biological.biologicalEvents.EventB4.showCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.showCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB4.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB4.showRanges": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.showRanges",
        "key": "Timeline.biological.biologicalEvents.EventB4.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.biological.biologicalEvents.EventB4.userDate": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.userDate",
        "key": "Timeline.biological.biologicalEvents.EventB4.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB4.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB5.date": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.date",
        "key": "Timeline.biological.biologicalEvents.EventB5.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.date",
        "type": 1,
        "value": -594999996
      },
      "Timeline.biological.biologicalEvents.EventB5.discrepancy ": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.discrepancy ",
        "key": "Timeline.biological.biologicalEvents.EventB5.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB5.enabled": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.enabled",
        "key": "Timeline.biological.biologicalEvents.EventB5.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB5.forceCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.forceCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB5.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB5.index": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.index",
        "key": "Timeline.biological.biologicalEvents.EventB5.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.index",
        "type": 1,
        "value": 5
      },
      "Timeline.biological.biologicalEvents.EventB5.isCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.isCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB5.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB5.isPlaced": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.isPlaced",
        "key": "Timeline.biological.biologicalEvents.EventB5.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB5.locked": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.locked",
        "key": "Timeline.biological.biologicalEvents.EventB5.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.locked",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB5.name": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.name",
        "key": "Timeline.biological.biologicalEvents.EventB5.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.name",
        "type": 2,
        "value": "Oldest Animal Fossils"
      },
      "Timeline.biological.biologicalEvents.EventB5.showCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.showCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB5.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB5.showRanges": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.showRanges",
        "key": "Timeline.biological.biologicalEvents.EventB5.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.biological.biologicalEvents.EventB5.userDate": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.userDate",
        "key": "Timeline.biological.biologicalEvents.EventB5.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB5.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB6.date": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.date",
        "key": "Timeline.biological.biologicalEvents.EventB6.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.date",
        "type": 1,
        "value": -541997978
      },
      "Timeline.biological.biologicalEvents.EventB6.discrepancy ": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.discrepancy ",
        "key": "Timeline.biological.biologicalEvents.EventB6.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB6.enabled": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.enabled",
        "key": "Timeline.biological.biologicalEvents.EventB6.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB6.forceCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.forceCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB6.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB6.index": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.index",
        "key": "Timeline.biological.biologicalEvents.EventB6.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.index",
        "type": 1,
        "value": 6
      },
      "Timeline.biological.biologicalEvents.EventB6.isCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.isCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB6.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB6.isPlaced": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.isPlaced",
        "key": "Timeline.biological.biologicalEvents.EventB6.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB6.locked": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.locked",
        "key": "Timeline.biological.biologicalEvents.EventB6.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.locked",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB6.name": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.name",
        "key": "Timeline.biological.biologicalEvents.EventB6.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.name",
        "type": 2,
        "value": "Cambrian Explosion"
      },
      "Timeline.biological.biologicalEvents.EventB6.showCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.showCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB6.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB6.showRanges": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.showRanges",
        "key": "Timeline.biological.biologicalEvents.EventB6.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.biological.biologicalEvents.EventB6.userDate": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.userDate",
        "key": "Timeline.biological.biologicalEvents.EventB6.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB6.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB7.date": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.date",
        "key": "Timeline.biological.biologicalEvents.EventB7.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.date",
        "type": 1,
        "value": -471997978
      },
      "Timeline.biological.biologicalEvents.EventB7.discrepancy ": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.discrepancy ",
        "key": "Timeline.biological.biologicalEvents.EventB7.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB7.enabled": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.enabled",
        "key": "Timeline.biological.biologicalEvents.EventB7.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB7.forceCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.forceCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB7.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB7.index": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.index",
        "key": "Timeline.biological.biologicalEvents.EventB7.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.index",
        "type": 1,
        "value": 7
      },
      "Timeline.biological.biologicalEvents.EventB7.isCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.isCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB7.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB7.isPlaced": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.isPlaced",
        "key": "Timeline.biological.biologicalEvents.EventB7.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB7.locked": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.locked",
        "key": "Timeline.biological.biologicalEvents.EventB7.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.locked",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB7.name": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.name",
        "key": "Timeline.biological.biologicalEvents.EventB7.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.name",
        "type": 2,
        "value": "Oldest Land Plant Fossils"
      },
      "Timeline.biological.biologicalEvents.EventB7.showCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.showCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB7.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB7.showRanges": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.showRanges",
        "key": "Timeline.biological.biologicalEvents.EventB7.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.biological.biologicalEvents.EventB7.userDate": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.userDate",
        "key": "Timeline.biological.biologicalEvents.EventB7.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB7.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB8.date": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.date",
        "key": "Timeline.biological.biologicalEvents.EventB8.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.date",
        "type": 1,
        "value": -427997978
      },
      "Timeline.biological.biologicalEvents.EventB8.discrepancy ": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.discrepancy ",
        "key": "Timeline.biological.biologicalEvents.EventB8.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB8.enabled": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.enabled",
        "key": "Timeline.biological.biologicalEvents.EventB8.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB8.forceCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.forceCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB8.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB8.index": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.index",
        "key": "Timeline.biological.biologicalEvents.EventB8.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.index",
        "type": 1,
        "value": 8
      },
      "Timeline.biological.biologicalEvents.EventB8.isCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.isCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB8.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB8.isPlaced": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.isPlaced",
        "key": "Timeline.biological.biologicalEvents.EventB8.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB8.locked": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.locked",
        "key": "Timeline.biological.biologicalEvents.EventB8.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.locked",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB8.name": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.name",
        "key": "Timeline.biological.biologicalEvents.EventB8.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.name",
        "type": 2,
        "value": "Oldest Land Animal Fossils"
      },
      "Timeline.biological.biologicalEvents.EventB8.showCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.showCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB8.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB8.showRanges": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.showRanges",
        "key": "Timeline.biological.biologicalEvents.EventB8.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.biological.biologicalEvents.EventB8.userDate": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.userDate",
        "key": "Timeline.biological.biologicalEvents.EventB8.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB8.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB9.date": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.date",
        "key": "Timeline.biological.biologicalEvents.EventB9.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.date",
        "type": 1,
        "value": -249997978
      },
      "Timeline.biological.biologicalEvents.EventB9.discrepancy ": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.discrepancy ",
        "key": "Timeline.biological.biologicalEvents.EventB9.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.biological.biologicalEvents.EventB9.enabled": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.enabled",
        "key": "Timeline.biological.biologicalEvents.EventB9.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB9.forceCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.forceCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB9.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB9.index": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.index",
        "key": "Timeline.biological.biologicalEvents.EventB9.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.index",
        "type": 1,
        "value": 9
      },
      "Timeline.biological.biologicalEvents.EventB9.isCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.isCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB9.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB9.isPlaced": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.isPlaced",
        "key": "Timeline.biological.biologicalEvents.EventB9.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB9.locked": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.locked",
        "key": "Timeline.biological.biologicalEvents.EventB9.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.locked",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB9.name": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.name",
        "key": "Timeline.biological.biologicalEvents.EventB9.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.name",
        "type": 2,
        "value": "Permian-Triassic Extinction"
      },
      "Timeline.biological.biologicalEvents.EventB9.showCorrect": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.showCorrect",
        "key": "Timeline.biological.biologicalEvents.EventB9.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.biological.biologicalEvents.EventB9.showRanges": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.showRanges",
        "key": "Timeline.biological.biologicalEvents.EventB9.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.biological.biologicalEvents.EventB9.userDate": {
        "id": "stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.userDate",
        "key": "Timeline.biological.biologicalEvents.EventB9.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.biological.biologicalEvents.EventB9.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.Enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.Enabled",
        "key": "Timeline.cosmic.Enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.Enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC1.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC1.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.date",
        "type": 1,
        "value": -13799997978
      },
      "Timeline.cosmic.cosmicEvents.EventC1.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC1.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC1.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC1.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC1.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC1.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC1.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC1.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.index",
        "type": 1,
        "value": 1
      },
      "Timeline.cosmic.cosmicEvents.EventC1.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC1.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC1.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC1.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC1.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC1.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC1.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC1.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.name",
        "type": 2,
        "value": "Big Bang"
      },
      "Timeline.cosmic.cosmicEvents.EventC1.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC1.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC1.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC1.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC1.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC1.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC1.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC10.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC10.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.date",
        "type": 1,
        "value": -4569697978
      },
      "Timeline.cosmic.cosmicEvents.EventC10.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC10.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC10.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC10.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC10.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC10.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC10.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC10.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.index",
        "type": 1,
        "value": 10
      },
      "Timeline.cosmic.cosmicEvents.EventC10.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC10.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC10.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC10.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC10.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC10.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC10.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC10.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.name",
        "type": 2,
        "value": "First Solid Material Forms in Solar System"
      },
      "Timeline.cosmic.cosmicEvents.EventC10.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC10.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC10.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC10.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC10.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC10.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC10.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC11.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC11.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.date",
        "type": 1,
        "value": -4549997978
      },
      "Timeline.cosmic.cosmicEvents.EventC11.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC11.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC11.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC11.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC11.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC11.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC11.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC11.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.index",
        "type": 1,
        "value": 11
      },
      "Timeline.cosmic.cosmicEvents.EventC11.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC11.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC11.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC11.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC11.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC11.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC11.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC11.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.name",
        "type": 2,
        "value": "Formation of Earth"
      },
      "Timeline.cosmic.cosmicEvents.EventC11.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC11.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC11.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC11.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC11.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC11.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC11.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC12.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC12.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.date",
        "type": 1,
        "value": -4469997978
      },
      "Timeline.cosmic.cosmicEvents.EventC12.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC12.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC12.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC12.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC12.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC12.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC12.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC12.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.index",
        "type": 1,
        "value": 12
      },
      "Timeline.cosmic.cosmicEvents.EventC12.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC12.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC12.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC12.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC12.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC12.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC12.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC12.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.name",
        "type": 2,
        "value": "Moon Forming Impact"
      },
      "Timeline.cosmic.cosmicEvents.EventC12.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC12.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC12.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC12.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC12.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC12.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC12.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC13.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC13.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.date",
        "type": 1,
        "value": -3999999996
      },
      "Timeline.cosmic.cosmicEvents.EventC13.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC13.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC13.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC13.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC13.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC13.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC13.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC13.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.index",
        "type": 1,
        "value": 13
      },
      "Timeline.cosmic.cosmicEvents.EventC13.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC13.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC13.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC13.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC13.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC13.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC13.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC13.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.name",
        "type": 2,
        "value": "Late Heavy Bombardment"
      },
      "Timeline.cosmic.cosmicEvents.EventC13.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC13.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC13.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC13.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC13.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC13.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC13.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC14.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC14.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.date",
        "type": 1,
        "value": -10999996
      },
      "Timeline.cosmic.cosmicEvents.EventC14.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC14.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC14.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC14.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC14.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC14.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC14.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC14.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.index",
        "type": 1,
        "value": 14
      },
      "Timeline.cosmic.cosmicEvents.EventC14.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC14.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC14.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC14.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC14.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC14.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC14.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC14.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.name",
        "type": 2,
        "value": "Betelgeuse Becomes a Main Sequence Star"
      },
      "Timeline.cosmic.cosmicEvents.EventC14.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC14.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC14.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC14.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC14.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC14.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC14.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC15.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC15.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.date",
        "type": 1,
        "value": -1499996
      },
      "Timeline.cosmic.cosmicEvents.EventC15.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC15.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC15.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC15.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC15.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC15.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC15.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC15.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.index",
        "type": 1,
        "value": 15
      },
      "Timeline.cosmic.cosmicEvents.EventC15.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC15.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC15.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC15.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC15.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC15.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC15.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC15.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.name",
        "type": 2,
        "value": "Betelgeuse Becomes a Red Supergiant"
      },
      "Timeline.cosmic.cosmicEvents.EventC15.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC15.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC15.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC15.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC15.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC15.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC15.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC16.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC16.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.date",
        "type": 1,
        "value": -968
      },
      "Timeline.cosmic.cosmicEvents.EventC16.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC16.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC16.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC16.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC16.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC16.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC16.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC16.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.index",
        "type": 1,
        "value": 16
      },
      "Timeline.cosmic.cosmicEvents.EventC16.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC16.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC16.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC16.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC16.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC16.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC16.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC16.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.name",
        "type": 2,
        "value": "Crab Nebula Forms"
      },
      "Timeline.cosmic.cosmicEvents.EventC16.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC16.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC16.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC16.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC16.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC16.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC16.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC17.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC17.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.date",
        "type": 1,
        "value": -35
      },
      "Timeline.cosmic.cosmicEvents.EventC17.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC17.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC17.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC17.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC17.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC17.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC17.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC17.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.index",
        "type": 1,
        "value": 17
      },
      "Timeline.cosmic.cosmicEvents.EventC17.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC17.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC17.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC17.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC17.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC17.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC17.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC17.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.name",
        "type": 2,
        "value": "Supernova in Large Magellanic Cloud"
      },
      "Timeline.cosmic.cosmicEvents.EventC17.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC17.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC17.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC17.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC17.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC17.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC17.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC18.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC18.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.date",
        "type": 1,
        "value": -27
      },
      "Timeline.cosmic.cosmicEvents.EventC18.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC18.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC18.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC18.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC18.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC18.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC18.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC18.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.index",
        "type": 1,
        "value": 18
      },
      "Timeline.cosmic.cosmicEvents.EventC18.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC18.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC18.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC18.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC18.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC18.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC18.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC18.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.name",
        "type": 2,
        "value": "Discovery of First Exoplanet around Sun-like Star"
      },
      "Timeline.cosmic.cosmicEvents.EventC18.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC18.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC18.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC18.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC18.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC18.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC18.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC19.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC19.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.date",
        "type": 1,
        "value": -4
      },
      "Timeline.cosmic.cosmicEvents.EventC19.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC19.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC19.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC19.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC19.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC19.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC19.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC19.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.index",
        "type": 1,
        "value": 19
      },
      "Timeline.cosmic.cosmicEvents.EventC19.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC19.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC19.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC19.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC19.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC19.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC19.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC19.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.name",
        "type": 2,
        "value": "Betelgeuse Goes Supernova"
      },
      "Timeline.cosmic.cosmicEvents.EventC19.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC19.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC19.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC19.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC19.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC19.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC19.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC2.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC2.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.date",
        "type": 1,
        "value": -13799617978
      },
      "Timeline.cosmic.cosmicEvents.EventC2.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC2.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC2.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC2.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC2.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC2.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC2.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC2.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.index",
        "type": 1,
        "value": 2
      },
      "Timeline.cosmic.cosmicEvents.EventC2.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC2.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC2.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC2.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC2.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC2.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC2.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC2.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.name",
        "type": 2,
        "value": "Cosmic Microwave Background Forms"
      },
      "Timeline.cosmic.cosmicEvents.EventC2.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC2.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC2.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC2.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC2.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC2.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC2.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC20.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC20.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.date",
        "type": 1,
        "value": 2999997978
      },
      "Timeline.cosmic.cosmicEvents.EventC20.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC20.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC20.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC20.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC20.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC20.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC20.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC20.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.index",
        "type": 1,
        "value": 20
      },
      "Timeline.cosmic.cosmicEvents.EventC20.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC20.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC20.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC20.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC20.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC20.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC20.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC20.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.name",
        "type": 2,
        "value": "Milky Way and Andromeda Galaxies Collide"
      },
      "Timeline.cosmic.cosmicEvents.EventC20.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC20.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC20.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC20.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC20.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC20.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC20.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC21.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC21.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.date",
        "type": 1,
        "value": 5449997978
      },
      "Timeline.cosmic.cosmicEvents.EventC21.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC21.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC21.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC21.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC21.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC21.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC21.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC21.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.index",
        "type": 1,
        "value": 21
      },
      "Timeline.cosmic.cosmicEvents.EventC21.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC21.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC21.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC21.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC21.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC21.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC21.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC21.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.name",
        "type": 2,
        "value": "Death of the Earth"
      },
      "Timeline.cosmic.cosmicEvents.EventC21.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC21.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC21.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC21.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC21.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC21.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC21.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC22.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC22.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.date",
        "type": 1,
        "value": 5519997978
      },
      "Timeline.cosmic.cosmicEvents.EventC22.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC22.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC22.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC22.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC22.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC22.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC22.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC22.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.index",
        "type": 1,
        "value": 22
      },
      "Timeline.cosmic.cosmicEvents.EventC22.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC22.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC22.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC22.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC22.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC22.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC22.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC22.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.name",
        "type": 2,
        "value": "Sun Becomes a White Dwarf"
      },
      "Timeline.cosmic.cosmicEvents.EventC22.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC22.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC22.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC22.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC22.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC22.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC22.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC3.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC3.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.date",
        "type": 1,
        "value": -13699997978
      },
      "Timeline.cosmic.cosmicEvents.EventC3.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC3.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC3.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC3.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC3.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC3.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC3.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC3.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.index",
        "type": 1,
        "value": 3
      },
      "Timeline.cosmic.cosmicEvents.EventC3.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC3.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC3.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC3.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC3.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC3.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC3.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC3.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.name",
        "type": 2,
        "value": "First Stars Form"
      },
      "Timeline.cosmic.cosmicEvents.EventC3.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC3.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC3.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC3.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC3.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC3.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC3.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC4.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC4.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.date",
        "type": 1,
        "value": -12999997978
      },
      "Timeline.cosmic.cosmicEvents.EventC4.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC4.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC4.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC4.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC4.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC4.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC4.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC4.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.index",
        "type": 1,
        "value": 4
      },
      "Timeline.cosmic.cosmicEvents.EventC4.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC4.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC4.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC4.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC4.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC4.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC4.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC4.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.name",
        "type": 2,
        "value": "Milky Way Galaxy Forms"
      },
      "Timeline.cosmic.cosmicEvents.EventC4.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC4.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC4.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC4.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC4.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC4.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC4.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC5.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC5.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.date",
        "type": 1,
        "value": -10299997978
      },
      "Timeline.cosmic.cosmicEvents.EventC5.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC5.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC5.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC5.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC5.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC5.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC5.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC5.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.index",
        "type": 1,
        "value": 5
      },
      "Timeline.cosmic.cosmicEvents.EventC5.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC5.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC5.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC5.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC5.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC5.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC5.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC5.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.name",
        "type": 2,
        "value": "Peak Star Formation"
      },
      "Timeline.cosmic.cosmicEvents.EventC5.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC5.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC5.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC5.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC5.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC5.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC5.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC6.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC6.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.date",
        "type": 1,
        "value": -9999997978
      },
      "Timeline.cosmic.cosmicEvents.EventC6.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC6.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC6.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC6.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC6.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC6.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC6.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC6.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.index",
        "type": 1,
        "value": 6
      },
      "Timeline.cosmic.cosmicEvents.EventC6.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC6.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC6.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC6.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC6.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC6.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC6.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC6.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.name",
        "type": 2,
        "value": "Andromeda Galaxy Forms"
      },
      "Timeline.cosmic.cosmicEvents.EventC6.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC6.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC6.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC6.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC6.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC6.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC6.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC7.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC7.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.date",
        "type": 1,
        "value": -8749997978
      },
      "Timeline.cosmic.cosmicEvents.EventC7.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC7.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC7.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC7.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC7.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC7.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC7.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC7.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.index",
        "type": 1,
        "value": 7
      },
      "Timeline.cosmic.cosmicEvents.EventC7.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC7.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC7.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC7.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC7.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC7.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC7.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC7.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.name",
        "type": 2,
        "value": "Spiral Arms Form in Milky Way"
      },
      "Timeline.cosmic.cosmicEvents.EventC7.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC7.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC7.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC7.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC7.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC7.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC7.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC8.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC8.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.date",
        "type": 1,
        "value": -5999997978
      },
      "Timeline.cosmic.cosmicEvents.EventC8.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC8.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC8.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC8.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC8.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC8.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC8.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC8.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.index",
        "type": 1,
        "value": 8
      },
      "Timeline.cosmic.cosmicEvents.EventC8.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC8.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC8.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC8.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC8.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC8.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC8.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC8.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.name",
        "type": 2,
        "value": "Alpha Centauri Binary Star System Forms"
      },
      "Timeline.cosmic.cosmicEvents.EventC8.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC8.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC8.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC8.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC8.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC8.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC8.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC9.date": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.date",
        "key": "Timeline.cosmic.cosmicEvents.EventC9.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.date",
        "type": 1,
        "value": -4599997978
      },
      "Timeline.cosmic.cosmicEvents.EventC9.discrepancy ": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.discrepancy ",
        "key": "Timeline.cosmic.cosmicEvents.EventC9.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.cosmic.cosmicEvents.EventC9.enabled": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.enabled",
        "key": "Timeline.cosmic.cosmicEvents.EventC9.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC9.forceCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.forceCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC9.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC9.index": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.index",
        "key": "Timeline.cosmic.cosmicEvents.EventC9.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.index",
        "type": 1,
        "value": 9
      },
      "Timeline.cosmic.cosmicEvents.EventC9.isCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.isCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC9.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC9.isPlaced": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.isPlaced",
        "key": "Timeline.cosmic.cosmicEvents.EventC9.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC9.locked": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.locked",
        "key": "Timeline.cosmic.cosmicEvents.EventC9.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.locked",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC9.name": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.name",
        "key": "Timeline.cosmic.cosmicEvents.EventC9.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.name",
        "type": 2,
        "value": "Solar Nebula Begins to Form"
      },
      "Timeline.cosmic.cosmicEvents.EventC9.showCorrect": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.showCorrect",
        "key": "Timeline.cosmic.cosmicEvents.EventC9.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.cosmic.cosmicEvents.EventC9.showRanges": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.showRanges",
        "key": "Timeline.cosmic.cosmicEvents.EventC9.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.cosmic.cosmicEvents.EventC9.userDate": {
        "id": "stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.userDate",
        "key": "Timeline.cosmic.cosmicEvents.EventC9.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.cosmic.cosmicEvents.EventC9.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.geological.Enabled": {
        "id": "stage.simTimeline.Timeline.geological.Enabled",
        "key": "Timeline.geological.Enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.Enabled",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG1.date": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.date",
        "key": "Timeline.geological.geologicalEvents.EventG1.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.date",
        "type": 1,
        "value": -4299999996
      },
      "Timeline.geological.geologicalEvents.EventG1.discrepancy ": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.discrepancy ",
        "key": "Timeline.geological.geologicalEvents.EventG1.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.geological.geologicalEvents.EventG1.enabled": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.enabled",
        "key": "Timeline.geological.geologicalEvents.EventG1.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG1.forceCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.forceCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG1.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG1.index": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.index",
        "key": "Timeline.geological.geologicalEvents.EventG1.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.index",
        "type": 1,
        "value": 1
      },
      "Timeline.geological.geologicalEvents.EventG1.isCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.isCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG1.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG1.isPlaced": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.isPlaced",
        "key": "Timeline.geological.geologicalEvents.EventG1.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG1.locked": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.locked",
        "key": "Timeline.geological.geologicalEvents.EventG1.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.locked",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG1.name": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.name",
        "key": "Timeline.geological.geologicalEvents.EventG1.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.name",
        "type": 2,
        "value": "Oldest Evidence for Oceans and Continents"
      },
      "Timeline.geological.geologicalEvents.EventG1.showCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.showCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG1.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG1.showRanges": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.showRanges",
        "key": "Timeline.geological.geologicalEvents.EventG1.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.geological.geologicalEvents.EventG1.userDate": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.userDate",
        "key": "Timeline.geological.geologicalEvents.EventG1.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG1.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.geological.geologicalEvents.EventG2.date": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.date",
        "key": "Timeline.geological.geologicalEvents.EventG2.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.date",
        "type": 1,
        "value": -2499999996
      },
      "Timeline.geological.geologicalEvents.EventG2.discrepancy ": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.discrepancy ",
        "key": "Timeline.geological.geologicalEvents.EventG2.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.geological.geologicalEvents.EventG2.enabled": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.enabled",
        "key": "Timeline.geological.geologicalEvents.EventG2.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG2.forceCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.forceCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG2.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG2.index": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.index",
        "key": "Timeline.geological.geologicalEvents.EventG2.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.index",
        "type": 1,
        "value": 2
      },
      "Timeline.geological.geologicalEvents.EventG2.isCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.isCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG2.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG2.isPlaced": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.isPlaced",
        "key": "Timeline.geological.geologicalEvents.EventG2.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG2.locked": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.locked",
        "key": "Timeline.geological.geologicalEvents.EventG2.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.locked",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG2.name": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.name",
        "key": "Timeline.geological.geologicalEvents.EventG2.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.name",
        "type": 2,
        "value": "Rise of Oxygen"
      },
      "Timeline.geological.geologicalEvents.EventG2.showCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.showCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG2.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG2.showRanges": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.showRanges",
        "key": "Timeline.geological.geologicalEvents.EventG2.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.geological.geologicalEvents.EventG2.userDate": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.userDate",
        "key": "Timeline.geological.geologicalEvents.EventG2.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG2.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.geological.geologicalEvents.EventG3.date": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.date",
        "key": "Timeline.geological.geologicalEvents.EventG3.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.date",
        "type": 1,
        "value": -714999996
      },
      "Timeline.geological.geologicalEvents.EventG3.discrepancy ": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.discrepancy ",
        "key": "Timeline.geological.geologicalEvents.EventG3.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.geological.geologicalEvents.EventG3.enabled": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.enabled",
        "key": "Timeline.geological.geologicalEvents.EventG3.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG3.forceCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.forceCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG3.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG3.index": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.index",
        "key": "Timeline.geological.geologicalEvents.EventG3.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.index",
        "type": 1,
        "value": 3
      },
      "Timeline.geological.geologicalEvents.EventG3.isCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.isCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG3.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG3.isPlaced": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.isPlaced",
        "key": "Timeline.geological.geologicalEvents.EventG3.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG3.locked": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.locked",
        "key": "Timeline.geological.geologicalEvents.EventG3.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.locked",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG3.name": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.name",
        "key": "Timeline.geological.geologicalEvents.EventG3.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.name",
        "type": 2,
        "value": "Snowball Earth"
      },
      "Timeline.geological.geologicalEvents.EventG3.showCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.showCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG3.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG3.showRanges": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.showRanges",
        "key": "Timeline.geological.geologicalEvents.EventG3.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.geological.geologicalEvents.EventG3.userDate": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.userDate",
        "key": "Timeline.geological.geologicalEvents.EventG3.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG3.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.geological.geologicalEvents.EventG4.date": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.date",
        "key": "Timeline.geological.geologicalEvents.EventG4.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.date",
        "type": 1,
        "value": -2585978
      },
      "Timeline.geological.geologicalEvents.EventG4.discrepancy ": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.discrepancy ",
        "key": "Timeline.geological.geologicalEvents.EventG4.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.geological.geologicalEvents.EventG4.enabled": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.enabled",
        "key": "Timeline.geological.geologicalEvents.EventG4.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG4.forceCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.forceCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG4.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG4.index": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.index",
        "key": "Timeline.geological.geologicalEvents.EventG4.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.index",
        "type": 1,
        "value": 4
      },
      "Timeline.geological.geologicalEvents.EventG4.isCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.isCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG4.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG4.isPlaced": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.isPlaced",
        "key": "Timeline.geological.geologicalEvents.EventG4.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG4.locked": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.locked",
        "key": "Timeline.geological.geologicalEvents.EventG4.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.locked",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG4.name": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.name",
        "key": "Timeline.geological.geologicalEvents.EventG4.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.name",
        "type": 2,
        "value": "Ice Age Begins"
      },
      "Timeline.geological.geologicalEvents.EventG4.showCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.showCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG4.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG4.showRanges": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.showRanges",
        "key": "Timeline.geological.geologicalEvents.EventG4.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.geological.geologicalEvents.EventG4.userDate": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.userDate",
        "key": "Timeline.geological.geologicalEvents.EventG4.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG4.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.geological.geologicalEvents.EventG5.date": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.date",
        "key": "Timeline.geological.geologicalEvents.EventG5.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.date",
        "type": 1,
        "value": -19996
      },
      "Timeline.geological.geologicalEvents.EventG5.discrepancy ": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.discrepancy ",
        "key": "Timeline.geological.geologicalEvents.EventG5.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.geological.geologicalEvents.EventG5.enabled": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.enabled",
        "key": "Timeline.geological.geologicalEvents.EventG5.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG5.forceCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.forceCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG5.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG5.index": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.index",
        "key": "Timeline.geological.geologicalEvents.EventG5.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.index",
        "type": 1,
        "value": 5
      },
      "Timeline.geological.geologicalEvents.EventG5.isCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.isCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG5.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG5.isPlaced": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.isPlaced",
        "key": "Timeline.geological.geologicalEvents.EventG5.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG5.locked": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.locked",
        "key": "Timeline.geological.geologicalEvents.EventG5.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.locked",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG5.name": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.name",
        "key": "Timeline.geological.geologicalEvents.EventG5.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.name",
        "type": 2,
        "value": "Last Glacial Maximum"
      },
      "Timeline.geological.geologicalEvents.EventG5.showCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.showCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG5.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG5.showRanges": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.showRanges",
        "key": "Timeline.geological.geologicalEvents.EventG5.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.geological.geologicalEvents.EventG5.userDate": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.userDate",
        "key": "Timeline.geological.geologicalEvents.EventG5.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG5.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.geological.geologicalEvents.EventG6.date": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.date",
        "key": "Timeline.geological.geologicalEvents.EventG6.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.date",
        "type": 1,
        "value": 1499995960
      },
      "Timeline.geological.geologicalEvents.EventG6.discrepancy ": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.discrepancy ",
        "key": "Timeline.geological.geologicalEvents.EventG6.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.geological.geologicalEvents.EventG6.enabled": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.enabled",
        "key": "Timeline.geological.geologicalEvents.EventG6.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.enabled",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG6.forceCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.forceCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG6.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG6.index": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.index",
        "key": "Timeline.geological.geologicalEvents.EventG6.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.index",
        "type": 1,
        "value": 6
      },
      "Timeline.geological.geologicalEvents.EventG6.isCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.isCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG6.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG6.isPlaced": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.isPlaced",
        "key": "Timeline.geological.geologicalEvents.EventG6.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.isPlaced",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG6.locked": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.locked",
        "key": "Timeline.geological.geologicalEvents.EventG6.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.locked",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG6.name": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.name",
        "key": "Timeline.geological.geologicalEvents.EventG6.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.name",
        "type": 2,
        "value": "Evaporation of the Oceans"
      },
      "Timeline.geological.geologicalEvents.EventG6.showCorrect": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.showCorrect",
        "key": "Timeline.geological.geologicalEvents.EventG6.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.geological.geologicalEvents.EventG6.showRanges": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.showRanges",
        "key": "Timeline.geological.geologicalEvents.EventG6.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.geological.geologicalEvents.EventG6.userDate": {
        "id": "stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.userDate",
        "key": "Timeline.geological.geologicalEvents.EventG6.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.geological.geologicalEvents.EventG6.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.special.Enabled": {
        "id": "stage.simTimeline.Timeline.special.Enabled",
        "key": "Timeline.special.Enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.Enabled",
        "type": 4,
        "value": true
      },
      "Timeline.special.specialEvents.EventS1.date": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS1.date",
        "key": "Timeline.special.specialEvents.EventS1.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS1.date",
        "type": 1,
        "value": 0
      },
      "Timeline.special.specialEvents.EventS1.discrepancy ": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS1.discrepancy ",
        "key": "Timeline.special.specialEvents.EventS1.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS1.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.special.specialEvents.EventS1.enabled": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS1.enabled",
        "key": "Timeline.special.specialEvents.EventS1.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS1.enabled",
        "type": 4,
        "value": true
      },
      "Timeline.special.specialEvents.EventS1.forceCorrect": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS1.forceCorrect",
        "key": "Timeline.special.specialEvents.EventS1.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS1.forceCorrect",
        "type": 4,
        "value": true
      },
      "Timeline.special.specialEvents.EventS1.index": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS1.index",
        "key": "Timeline.special.specialEvents.EventS1.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS1.index",
        "type": 1,
        "value": 1
      },
      "Timeline.special.specialEvents.EventS1.isCorrect": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS1.isCorrect",
        "key": "Timeline.special.specialEvents.EventS1.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS1.isCorrect",
        "type": 4,
        "value": true
      },
      "Timeline.special.specialEvents.EventS1.isPlaced": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS1.isPlaced",
        "key": "Timeline.special.specialEvents.EventS1.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS1.isPlaced",
        "type": 4,
        "value": true
      },
      "Timeline.special.specialEvents.EventS1.locked": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS1.locked",
        "key": "Timeline.special.specialEvents.EventS1.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS1.locked",
        "type": 4,
        "value": false
      },
      "Timeline.special.specialEvents.EventS1.name": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS1.name",
        "key": "Timeline.special.specialEvents.EventS1.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS1.name",
        "type": 2,
        "value": "Today"
      },
      "Timeline.special.specialEvents.EventS1.showCorrect": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS1.showCorrect",
        "key": "Timeline.special.specialEvents.EventS1.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS1.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.special.specialEvents.EventS1.showRanges": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS1.showRanges",
        "key": "Timeline.special.specialEvents.EventS1.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS1.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.special.specialEvents.EventS1.userDate": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS1.userDate",
        "key": "Timeline.special.specialEvents.EventS1.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS1.userDate",
        "type": 1,
        "value": 0
      },
      "Timeline.special.specialEvents.EventS2.date": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS2.date",
        "key": "Timeline.special.specialEvents.EventS2.date",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS2.date",
        "type": 1,
        "value": null
      },
      "Timeline.special.specialEvents.EventS2.discrepancy ": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS2.discrepancy ",
        "key": "Timeline.special.specialEvents.EventS2.discrepancy ",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS2.discrepancy ",
        "type": 1,
        "value": 0
      },
      "Timeline.special.specialEvents.EventS2.enabled": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS2.enabled",
        "key": "Timeline.special.specialEvents.EventS2.enabled",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS2.enabled",
        "type": 4,
        "value": true
      },
      "Timeline.special.specialEvents.EventS2.forceCorrect": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS2.forceCorrect",
        "key": "Timeline.special.specialEvents.EventS2.forceCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS2.forceCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.special.specialEvents.EventS2.index": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS2.index",
        "key": "Timeline.special.specialEvents.EventS2.index",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS2.index",
        "type": 1,
        "value": 2
      },
      "Timeline.special.specialEvents.EventS2.isCorrect": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS2.isCorrect",
        "key": "Timeline.special.specialEvents.EventS2.isCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS2.isCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.special.specialEvents.EventS2.isPlaced": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS2.isPlaced",
        "key": "Timeline.special.specialEvents.EventS2.isPlaced",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS2.isPlaced",
        "type": 4,
        "value": true
      },
      "Timeline.special.specialEvents.EventS2.locked": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS2.locked",
        "key": "Timeline.special.specialEvents.EventS2.locked",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS2.locked",
        "type": 4,
        "value": false
      },
      "Timeline.special.specialEvents.EventS2.name": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS2.name",
        "key": "Timeline.special.specialEvents.EventS2.name",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS2.name",
        "type": 2,
        "value": "Your Birth"
      },
      "Timeline.special.specialEvents.EventS2.showCorrect": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS2.showCorrect",
        "key": "Timeline.special.specialEvents.EventS2.showCorrect",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS2.showCorrect",
        "type": 4,
        "value": false
      },
      "Timeline.special.specialEvents.EventS2.showRanges": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS2.showRanges",
        "key": "Timeline.special.specialEvents.EventS2.showRanges",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS2.showRanges",
        "type": 4,
        "value": true
      },
      "Timeline.special.specialEvents.EventS2.userDate": {
        "id": "stage.simTimeline.Timeline.special.specialEvents.EventS2.userDate",
        "key": "Timeline.special.specialEvents.EventS2.userDate",
        "path": "q:1391798251257:189|stage.simTimeline.Timeline.special.specialEvents.EventS2.userDate",
        "type": 1,
        "value": 0
      }
    },
    "section_slug": "ast_111_introsolar_systems_ast_19wb6"
  }
  """

  def flame_graphs(conn, _params) do
    flame_graphs =
      FlameGraph.list()
      |> Enum.map(&FlameGraph.to_svg(&1))

    render(conn, "flame_graphs.html", flame_graphs: flame_graphs)
  end

  def json_jason(conn, _params) do
    {result, _} =
      :timer.tc(fn ->
        1..100
        |> Enum.to_list()
        |> Enum.each(fn _ ->
          result = Jason.encode!(@test)
          Jason.decode!(result)
        end)

        :ok
      end)

    render(conn, "json_test.html", result: result)
  end

  def json_nif(conn, _params) do
    {result, _} =
      :timer.tc(fn ->
        1..100
        |> Enum.to_list()
        |> Enum.each(fn _ ->
          result = Jsonrs.encode!(@test)
          Jsonrs.decode!(result)
        end)

        :ok
      end)

    render(conn, "json_test.html", result: result)
  end
end
