# trace generated using paraview version 5.5.1

#### import the simple module from the paraview
from paraview.simple import *
#### disable automatic camera reset on 'Show'
paraview.simple._DisableFirstRenderCameraReset()

# create a new 'Legacy VTK Reader'
t_ = LegacyVTKReader(FileNames=['/Users/max/project/swim/example/test_multi_linear/z_pos_input/t_0.vtk', '/Users/max/project/swim/example/test_multi_linear/z_pos_input/t_1.vtk', '/Users/max/project/swim/example/test_multi_linear/z_pos_input/t_2.vtk'])

# get animation scene
animationScene1 = GetAnimationScene()

# update animation scene based on data timesteps
animationScene1.UpdateAnimationUsingDataTimeSteps()

# get active view
renderView1 = GetActiveViewOrCreate('RenderView')
# uncomment following to set a specific view size
# renderView1.ViewSize = [994, 664]

# show data in view
t_Display = Show(t_, renderView1)

# trace defaults for the display properties.
t_Display.Representation = 'Surface'
t_Display.ColorArrayName = [None, '']
t_Display.OSPRayScaleArray = 'displacement'
t_Display.OSPRayScaleFunction = 'PiecewiseFunction'
t_Display.SelectOrientationVectors = 'displacement'
t_Display.ScaleFactor = 4000.0
t_Display.SelectScaleArray = 'None'
t_Display.GlyphType = 'Arrow'
t_Display.GlyphTableIndexArray = 'None'
t_Display.GaussianRadius = 200.0
t_Display.SetScaleArray = ['POINTS', 'displacement']
t_Display.ScaleTransferFunction = 'PiecewiseFunction'
t_Display.OpacityArray = ['POINTS', 'displacement']
t_Display.OpacityTransferFunction = 'PiecewiseFunction'
t_Display.DataAxesGrid = 'GridAxesRepresentation'
t_Display.SelectionCellLabelFontFile = ''
t_Display.SelectionPointLabelFontFile = ''
t_Display.PolarAxes = 'PolarAxesRepresentation'
t_Display.ScalarOpacityUnitDistance = 952.3570952044797

# init the 'PiecewiseFunction' selected for 'ScaleTransferFunction'
t_Display.ScaleTransferFunction.Points = [-0.02094664, 0.0, 0.5, 0.0, 0.02094664, 1.0, 0.5, 0.0]

# init the 'PiecewiseFunction' selected for 'OpacityTransferFunction'
t_Display.OpacityTransferFunction.Points = [-0.02094664, 0.0, 0.5, 0.0, 0.02094664, 1.0, 0.5, 0.0]

# init the 'GridAxesRepresentation' selected for 'DataAxesGrid'
t_Display.DataAxesGrid.XTitleFontFile = ''
t_Display.DataAxesGrid.YTitleFontFile = ''
t_Display.DataAxesGrid.ZTitleFontFile = ''
t_Display.DataAxesGrid.XLabelColor = [0.0, 0.0, 0.0]
t_Display.DataAxesGrid.XLabelFontFamily = 'Times'
t_Display.DataAxesGrid.XLabelFontFile = ''
t_Display.DataAxesGrid.XLabelFontSize = 16
t_Display.DataAxesGrid.YLabelColor = [0.0, 0.0, 0.0]
t_Display.DataAxesGrid.YLabelFontFamily = 'Times'
t_Display.DataAxesGrid.YLabelFontFile = ''
t_Display.DataAxesGrid.YLabelFontSize = 16
t_Display.DataAxesGrid.ZLabelFontFile = ''
t_Display.DataAxesGrid.XAxisUseCustomLabels = 1
t_Display.DataAxesGrid.XAxisLabels = [0.0, 2000.0, 5000.0, 10000.0, 15000.0, 20000.0, 25000.0, 30000.0, -2000.0, -5000.0, -10000.0]
t_Display.DataAxesGrid.YAxisUseCustomLabels = 1
t_Display.DataAxesGrid.YAxisLabels = [0.0, -5000.0, 5000.0, 10000.0, -10000.0]

# init the 'PolarAxesRepresentation' selected for 'PolarAxes'
t_Display.PolarAxes.PolarAxisTitleFontFile = ''
t_Display.PolarAxes.PolarAxisLabelFontFile = ''
t_Display.PolarAxes.LastRadialAxisTextFontFile = ''
t_Display.PolarAxes.SecondaryRadialAxesTextFontFile = ''

# reset view to fit data
renderView1.ResetCamera()

#changing interaction mode based on data extents
renderView1.InteractionMode = '2D'
renderView1.CameraPosition = [0.0, 0.0, 10000.0]

# update the view to ensure updated data information
renderView1.Update()

# set scalar coloring
ColorBy(t_Display, ('POINTS', 'displacement', 'Magnitude'))

# rescale color and/or opacity maps used to include current data range
t_Display.RescaleTransferFunctionToDataRange(True, False)

# show color bar/color legend
t_Display.SetScalarBarVisibility(renderView1, True)

# get color transfer function/color map for 'displacement'
displacementLUT = GetColorTransferFunction('displacement')

# set scalar coloring
ColorBy(t_Display, ('POINTS', 'displacement', 'Z'))

# rescale color and/or opacity maps used to exactly fit the current data range
t_Display.RescaleTransferFunctionToDataRange(False, False)

# Update a scalar bar component title.
UpdateScalarBarsComponentTitle(displacementLUT, t_Display)

# rescale color and/or opacity maps used to exactly fit the current data range
t_Display.RescaleTransferFunctionToDataRange(False, True)

# Apply a preset using its name. Note this may not work as expected when presets have duplicate names.
displacementLUT.ApplyPreset('Grayscale', True)

# hide color bar/color legend
t_Display.SetScalarBarVisibility(renderView1, False)

# Properties modified on renderView1
renderView1.OrientationAxesVisibility = 0

# current camera placement for renderView1
renderView1.InteractionMode = '2D'
renderView1.CameraPosition = [0.0, 0.0, 10000.0]
renderView1.CameraViewUp = [-1.0, 2.220446049250313e-16, 0.0]
renderView1.CameraParallelScale = 25000.0

# save screenshot
SaveScreenshot('/Users/max/project/swim/example/test_multi_linear/z_pos_input/temp_1.png', renderView1, ImageResolution=[994, 664],
    TransparentBackground=1, 
    # PNG options
    CompressionLevel='0')

# Rescale transfer function
t_Display.ScaleTransferFunction.RescaleTransferFunction(-0.2949401, 0.2949408)

# Rescale transfer function
t_Display.OpacityTransferFunction.RescaleTransferFunction(-0.2949401, 0.2949408)

animationScene1.GoToNext()

# rescale color and/or opacity maps used to exactly fit the current data range
t_Display.RescaleTransferFunctionToDataRange(False, True)

# current camera placement for renderView1
renderView1.InteractionMode = '2D'
renderView1.CameraPosition = [0.0, 0.0, 10000.0]
renderView1.CameraViewUp = [-1.0, 2.220446049250313e-16, 0.0]
renderView1.CameraParallelScale = 25000.0

# save screenshot
SaveScreenshot('/Users/max/project/swim/example/test_multi_linear/z_pos_input/temp_2.png', renderView1, ImageResolution=[994, 664],
    TransparentBackground=1, 
    # PNG options
    CompressionLevel='0')

# Rescale transfer function
t_Display.ScaleTransferFunction.RescaleTransferFunction(-0.3657665, 0.3657686)

# Rescale transfer function
t_Display.OpacityTransferFunction.RescaleTransferFunction(-0.3657665, 0.3657686)

animationScene1.GoToNext()

# rescale color and/or opacity maps used to exactly fit the current data range
t_Display.RescaleTransferFunctionToDataRange(False, True)

# current camera placement for renderView1
renderView1.InteractionMode = '2D'
renderView1.CameraPosition = [0.0, 0.0, 10000.0]
renderView1.CameraViewUp = [-1.0, 2.220446049250313e-16, 0.0]
renderView1.CameraParallelScale = 25000.0

# save screenshot
SaveScreenshot('/Users/max/project/swim/example/test_multi_linear/z_pos_input/temp_3.png', renderView1, ImageResolution=[994, 664],
    TransparentBackground=1, 
    # PNG options
    CompressionLevel='0')

#### saving camera placements for all active views

# current camera placement for renderView1
renderView1.InteractionMode = '2D'
renderView1.CameraPosition = [0.0, 0.0, 10000.0]
renderView1.CameraViewUp = [-1.0, 2.220446049250313e-16, 0.0]
renderView1.CameraParallelScale = 25000.0

#### uncomment the following to render all views
# RenderAllViews()
# alternatively, if you want to write images, you can use SaveScreenshot(...).