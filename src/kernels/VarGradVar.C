//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "VarGradVar.h"

/**
 * All MOOSE based object classes you create must be registered using this macro.  The first
 * argument is the name of the App you entered in when running the stork.sh script with an "App"
 * suffix. If you ran "stork.sh Example", then the argument here becomes "ExampleApp". The second
 * argument is the name of the C++ class you created.
 */
registerMooseObject("swimApp", VarGradVar);

/**
 * This function defines the valid parameters for
 * this Kernel and their default values
 */
template <>
InputParameters
validParams<VarGradVar>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Var Grad Var");
  params.addRequiredParam<RealVectorValue>("component", "component vector");

  return params;
}

VarGradVar::VarGradVar(const InputParameters & parameters)
  : // You must call the constructor of the base class first
    Kernel(parameters),
    _component(getParam<RealVectorValue>("component"))

{
}

Real
VarGradVar::computeQpResidual()
{
  // velocity * _grad_u[_qp] is actually doing a dot product
 // std::cout<<"qp = "<<_qp<<"_grad_couple[_qp]="<<_test[_i][_qp]*_grad_coupled[_qp](1)<<std::endl;

  return _test[_i][_qp] * (_u[_qp]*_component * _grad_u[_qp]);
}

Real
VarGradVar::computeQpJacobian()
{
  // the partial derivative of _grad_u is just _grad_phi[_j]
 // return _test[_i][_qp] * (_constant * _grad_phi[_j][_qp]);
  return _test[_i][_qp] * (_component * _grad_u[_qp]);
}
