//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef SETVALUE_H
#define SETVALUE_H

#include "Kernel.h"

class SetValue;

template <>
InputParameters validParams<SetValue>();

/**
 * Gravity computes the body force (force/volume) given the acceleration of gravity (value) and the
 * density
 */
class SetValue : public Kernel
{
public:
  SetValue(const InputParameters & parameters);

  virtual ~SetValue() {}

protected:
  virtual Real computeQpResidual();
  virtual Real computeQpJacobian();
  const VariableValue &_coupled;
};

#endif // GRAVITY_H
