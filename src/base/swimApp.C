#include "swimApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "ModulesApp.h"
#include "MooseSyntax.h"

template <>
InputParameters
validParams<swimApp>()
{
  InputParameters params = validParams<MooseApp>();
  return params;
}

swimApp::swimApp(InputParameters parameters) : MooseApp(parameters)
{
  swimApp::registerAll(_factory, _action_factory, _syntax);
}

swimApp::~swimApp() {}

void
swimApp::registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  ModulesApp::registerAll(f, af, s);
  Registry::registerObjectsTo(f, {"swimApp"});
  Registry::registerActionsTo(af, {"swimApp"});

  /* register custom execute flags, action syntax, etc. here */
}

void
swimApp::registerApps()
{
  registerApp(swimApp);
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
extern "C" void
swimApp__registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  swimApp::registerAll(f, af, s);
}
extern "C" void
swimApp__registerApps()
{
  swimApp::registerApps();
}
