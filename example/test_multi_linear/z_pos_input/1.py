import sys
import os

print("Running batchExport.py ...")

# set current path as case path
casePath = os.getcwd()

# extract caseName from path
caseName = casePath.replace('/', 'X', casePath.count('/') - 1)
caseName = caseName[(caseName.find('/') + 1):]

# add trailing slash
casePath = casePath + '/'

# first argument contains number of frames
frames = int(sys.argv[1])

# second argument contains time step
step = float(sys.argv[2])

try: paraview.simple
except: from paraview.simple import *
paraview.simple._DisableFirstRenderCameraReset()

AnimationScene1 = GetAnimationScene()
AnimationScene1.EndTime = (frames-1)*step
AnimationScene1.PlayMode = 'Snap To TimeSteps'

RenderView1 = GetRenderView()

# declare list for filenames
files = []

for i in range(frames):
   # define file names
   file = casePath + 'VTK/' + caseName + '_' + str(int(i*step)) + ".vtk"
   # append file name to list for VTKReader
   files.append(file)

#read files
reader = LegacyVTKReader( FileNames=files )
