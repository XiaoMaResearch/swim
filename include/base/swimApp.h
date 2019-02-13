//* This file is part of the MOOSE framework
//* https://www.mooseframework.org
//*
//* All rights reserved, see COPYRIGHT for full restrictions
//* https://github.com/idaholab/moose/blob/master/COPYRIGHT
//*
//* Licensed under LGPL 2.1, please see LICENSE for details
//* https://www.gnu.org/licenses/lgpl-2.1.html
#ifndef SWIMAPP_H
#define SWIMAPP_H

#include "MooseApp.h"

class swimApp;

template <>
InputParameters validParams<swimApp>();

class swimApp : public MooseApp
{
public:
  swimApp(InputParameters parameters);
  virtual ~swimApp();

  static void registerApps();
  static void registerAll(Factory & f, ActionFactory & af, Syntax & s);
};

#endif /* SWIMAPP_H */
