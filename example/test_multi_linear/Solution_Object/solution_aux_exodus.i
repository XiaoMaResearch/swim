[Mesh]
    type = GeneratedMesh
    dim = 2
    xmin = -15e3
    xmax = 15e3
    ymin = -20e3
    ymax = 20e3
    nx = 300
    ny = 400
[]

[Variables]
  [./dummy]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
  [../]
[]

[AuxVariables]
  [./nn]
    order = FIRST
    family = LAGRANGE
  [../]
[]

[Kernels]
  [./diff]
    type = Diffusion
    variable = dummy
  [../]
[]

[AuxKernels]
  [./nn]
    type = SolutionAux
    solution = soln
    variable = nn
    scale_factor = 2.0
  [../]
[]

[UserObjects]
  [./soln]
    type = SolutionUserObject
    mesh = test.e
    system_variables = source_nodal
    timestep = 0
  [../]
[]

[BCs]
  [./stuff]
    type = DirichletBC
    variable = dummy
    boundary = '1 2'
    value = 0.0
  [../]

[]

[Executioner]
  type = Transient

  solve_type = 'NEWTON'

  num_steps = 1
  dt = 0.5
[]

[Outputs]
  execute_on = 'timestep_end'
  exodus = true
[]
