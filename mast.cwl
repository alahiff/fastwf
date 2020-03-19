#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
inputs:
  shot_no: int
  pass_no: int
  uda_server: string

outputs:
  amc_file:
    type: int
    outputSource: amc/value
  ada_file:
    type: int
    outputSource: ada/value
  adg_file:
    type: int
    outputSource: adg/value

steps:
  amc:
    run: amc.cwl
    in:
      shot_no: shot_no
      pass_no: pass_no
      uda_server: uda_server
    out: [value]
  ada:
    run: ada.cwl
    in:
      shot_no: shot_no
      pass_no: pass_no
      uda_server: uda_server
      in_amc: amc/value
    out: [value]
  adg:
    run: adg.cwl
    in:
      shot_no: shot_no
      pass_no: pass_no
      uda_server: uda_server
      in_ada: ada/value
    out: [value]
