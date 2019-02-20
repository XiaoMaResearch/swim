# PiecewiseMultilinear function tests in 2D
# The spatial grid is 1<=x<=5 and 1<=y<=5
# At t<=1 a disk of radius 0.5 sits at (x,y)=(1.45,1.45): it has f=1.  Elsewhere f=0
# At t>=0 a disk of radius 0.5 sits at (x,y)=(4,55,4,55): it has f=1.  Elsewhere f=0
# The disks' centers were chosen specially so that the disk partially sits outside the grid
# which illustrates the extrapolation process used by GriddedData and PiecewiseMultilinear
[Mesh]
  type = GeneratedMesh
  dim = 2
  ymin = -15e3
  ymax = 15e3
  xmin = -20e3
  xmax = 20e3
  nx = 400
  ny = 300
[]

[Variables]
  [./dummy]
  [../]
[]

[Kernels]
  [./dummy_u]
    type = TimeDerivative
    variable = dummy
  [../]
[]


[AuxVariables]
  [./moving_disk_var]
  [../]
[]

[AuxKernels]
  [./moving_disk_AuxK]
    type = FunctionAux
    variable = moving_disk_var
    function = moving_disk_fcn
  [../]
[]


[Functions]
  [./moving_disk_fcn]
    type = PiecewiseMultilinear
    data_file = new_input.txt
  [../]
[]


[Executioner]
  type = Transient
  dt = 1.0
  num_steps = 4
[]

[Outputs]
  execute_on = 'INITIAL TIMESTEP_END'
  exodus = true
  csv = true
[]
