#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: Workflow
inputs:
  gt: File
  ocr: File
  xmx: string?
outputs:
  character_data:
    type: File
    outputSource: ocrevaluation-extract/character_data
  global_data:
    type: File
    outputSource: ocrevaluation-extract/global_data
steps:
  ocrevaluation:
    run: https://raw.githubusercontent.com/nlppln/ocrevaluation-docker/master/ocrevaluation.cwl
    in:
      ocr: ocr
      gt: gt
      xmx: xmx
    out:
    - out_file
  ocrevaluation-extract:
    run: ocrevaluation-extract.cwl
    in:
      in_file: ocrevaluation/out_file
    out:
    - character_data
    - global_data
