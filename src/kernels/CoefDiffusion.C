//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "CoefDiffusion.h"
#include "MooseMesh.h"

registerMooseObject("swimApp", CoefDiffusion);

template <>
InputParameters
validParams<CoefDiffusion>()
{
  InputParameters params = validParams<Diffusion>();
  params.addClassDescription(
      "Computes residual/Jacobian contribution for viscosity Diffusion term.");
  params.addParam<Real>("kinematic_viscosity", 0.0, "kinematic Viscosity term for the diffusion term");
  return params;
}

CoefDiffusion::CoefDiffusion(const InputParameters & parameters)
  : Diffusion(parameters),
    _kinematic_viscosity(getParam<Real>("kinematic_viscosity"))
{
}

Real
CoefDiffusion::computeQpResidual()
{
  return -_kinematic_viscosity * Diffusion::computeQpResidual();
}

Real
CoefDiffusion::computeQpJacobian()
{
  Real jac =-_kinematic_viscosity * Diffusion::computeQpJacobian();
  return jac;
}
