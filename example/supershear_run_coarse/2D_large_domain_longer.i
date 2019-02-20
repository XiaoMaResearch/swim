[Mesh]
    type = GeneratedMesh
    dim = 2
    xmin = -15e3
    xmax = 15e3
    ymin = -20e3
    ymax = 20e3
    nx = 75
    ny = 100
    uniform_refine = 1

[]

[Variables]
  [./h]
    order = FIRST
    family = LAGRANGE
    scaling = 0.005
    initial_condition = 0
  [../]
  [./u]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
  [../]
  [./v]
    order = FIRST
    family = LAGRANGE
    initial_condition = 0.0
  [../]
[]
[AuxVariables]
    [./H_f]
        order = FIRST
        family = LAGRANGE
    [../]
    [./H]
        order = FIRST
        family = LAGRANGE
    [../]
[]
[AuxKernels]
    [./cal_sea_floor_level]
        type = ReverseAuxValue
        variable = H_f
        coupled = H
        value = 0
        execute_on = 'INITIAL TIMESTEP_BEGIN'
    [../]
    [./current_sea_floor_profile]
        type = SolutionAux
        solution = soln
        variable = H
        add_factor = 0.0
        scale_factor = 1.0
        execute_on = 'INITIAL TIMESTEP_BEGIN'
    [../]
[]

[UserObjects]
  [./soln]
    type = SolutionUserObject
    mesh = H_input_150_250_right.e
    system_variables = H


  [../]
[]


[Functions]

[]

[ICs]
[]

[Kernels]
    # h equation
    [./h_dot]
      type = TimeDerivative
      variable = h
    [../]
    [./h_source_H]
        type = SetValue
        variable = h
        coupled = H
    [../]
    [./H_du_dx]
        type = CoupleGradCouple
        variable = h
        grad_coupled = u
        coupled = H
        component = '1.0 0.0 0.0'
    [../]
    [./H_dv_dy]
      type = CoupleGradCouple
      variable = h
      grad_coupled = v
      coupled = H
      component = '0.0 1.0 0.0'
    [../]
    [./u_dH_dx]
      type = CoupleGradCouple
      variable = h
      grad_coupled = H
      coupled = u
      component = '1.0 0.0 0.0'
    [../]
    [./v_dH_dy]
      type = CoupleGradCouple
      variable = h
      grad_coupled = H
      coupled = v
      component = '0.0 1.0 0.0'
    [../]
    [./u_dh_dx]
      type = CoupleGradVar
      variable = h
      coupled = u
      component = '1.0 0.0 0.0'
    [../]
    [./v_dh_dy]
      type = CoupleGradVar
      variable = h
      coupled = v
      component = '0.0 1.0 0.0'
    [../]
    [./h_du_dx]
      type = CoupleGradCouple
      variable = h
      grad_coupled = u
      coupled = h
      component = '1.0 0.0 0.0'
    [../]
    [./h_dv_dy]
      type = CoupleGradCouple
      variable = h
      grad_coupled = v
      coupled = h
      component = '0.0 1.0 0.0'
    [../]

    # u equation
    [./u_dot]
        type = TimeDerivative
        variable = u
    [../]
    [./u_du_dx]
        type = VarGradVar
        variable = u
        component = '1.0 0.0 0.0'
    [../]
    [./v_du_dy]
        type = CoupleGradVar
        variable = u
        coupled = v
        component = '0.0 1.0 0.0'
    [../]

    ## CHECK if it works ?
    [./g_dh_dx]
        type = CoupleGradCouple
        variable = u
        grad_coupled = h
        coupled = 9.81
        component = '1.0 0.0 0.0'
    [../]

    [./u_diffusion]
        type = CoefDiffusion
        variable = u
        kinematic_viscosity = 0.0
    [../]


    # v_y equation
    [./v_dot]
        type = TimeDerivative
        variable = v
    [../]
    [./u_dv_dx]
        type = CoupleGradVar
        variable = v
        coupled = u
        component = '1.0 0.0 0.0'
    [../]
    [./v_dv_dy]
        type = VarGradVar
        variable = v
        component = '0.0 1.0 0.0'
    [../]
    # Check if it works ?
    [./g_dh_dy]
        type = CoupleGradCouple
        variable = v
        grad_coupled = h
        coupled = 9.81
        component = '0.0 1.0 0.0'
    [../]
    [./v_diffusion]
        type = CoefDiffusion
        variable = v
        kinematic_viscosity = 0.0
    [../]

[]

[BCs]
    [./h_right]
        type = DirichletBC
        boundary = right
        value = 0.0
        variable = h
    [../]
    [./h_left]
        type = DirichletBC
        boundary = left
        value = 0.0
        variable = h
    [../]
[]

[Postprocessors]
[]

[Executioner]
  type = Transient
  num_steps = 6000
  l_max_its = 50
  dt = 0.01
  solve_type = 'PJFNK'

[]
[Outputs]
  execute_on = 'INITIAL TIMESTEP_END'
  exodus = true
[]
[Debug]
  show_var_residual_norms = true
[]
