//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#include "SetValue.h"

registerMooseObject("swimApp", SetValue);

template <>
InputParameters
validParams<SetValue>()
{
  InputParameters params = validParams<Kernel>();
  params.addClassDescription("Set value to the Aux Variable Value");
  params.addRequiredCoupledVar("coupled","Couple Aux Variable");
  return params;
}

SetValue::SetValue(const InputParameters & parameters)
  : Kernel(parameters),
  //_coupled(coupledValue("coupled"))
  _coupled(coupledDot("coupled"))


{
}

Real
SetValue::computeQpResidual()
{
  return (_coupled[_qp])*_test[_i][_qp];
}


Real
SetValue::computeQpJacobian()
{
  Real jac =_test[_i][_qp];
  return jac;
}
