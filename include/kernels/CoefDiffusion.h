//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html

#ifndef COEFDIFFUSION_H
#define COEFDIFFUSION_H

#include "Diffusion.h"

// Forward Declarations
class CoefDiffusion;

template <>
InputParameters validParams<CoefDiffusion>();

/**
 * Note: This class is named HeatConductionKernel instead of HeatConduction
 * to avoid a clash with the HeatConduction namespace.  It is registered
 * as HeatConduction, which means it can be used by that name in the input
 * file.
 */
class CoefDiffusion : public Diffusion
{
public:
  CoefDiffusion(const InputParameters & parameters);

protected:
  virtual Real computeQpResidual();

  virtual Real computeQpJacobian();

private:
  Real _kinematic_viscosity;
};

#endif // HEATCONDUCTIONKERNEL_H
