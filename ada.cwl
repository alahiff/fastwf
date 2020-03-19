#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: ada
hints:
  DockerRequirement:
    dockerPull: alahiff/mast-ada:4
requirements:
  EnvVarRequirement:
    envDef:
      UDA_SERVER_HOST: $(inputs.uda_server)
      UDA_HOST: $(inputs.uda_server)
baseCommand: /run.sh
arguments: [$(runtime.outdir), "/background/rca/bin0", "/opt/data/rca030470.nc"]
inputs:
  shot_no:
    type: int
    inputBinding:
      position: 1
  pass_no:
    type: int
    inputBinding:
      position: 2
  uda_server:
    type: string
    inputBinding:
      position: 3
  in_amc:
    type: int
    inputBinding:
      position: 4
outputs:
  value: int
