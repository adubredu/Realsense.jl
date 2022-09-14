module Realsense

wspath = joinpath(@__DIR__, "ws") 
run(`catkin_make -C $wspath`) 

using PythonCall

const camera = PythonCall.pynew()

function __init__()
    packagepath = dirname(@__DIR__)
    camerapath = joinpath(packagepath, "src")
    rospath = joinpath(packagepath, "src/ws/devel/lib/python2.7/dist-packages")
    sys = pyimport("sys")
    sys.path.append(rospath)
    sys.path.append(camerapath)
    PythonCall.pycopy!(camera, pyimport("pointcloud_server"))
end

export camera

end # module 
