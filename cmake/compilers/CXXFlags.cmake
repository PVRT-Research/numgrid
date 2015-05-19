if(NOT DEFINED DEFAULT_CXX_FLAGS_SET)

if(CMAKE_CXX_COMPILER_ID MATCHES Intel)
    add_definitions(-DVAR_INTEL_CXX)
    if(HAS_CXX11_SUPPORT)
        set(CMAKE_CXX_FLAGS "${CXX11_COMPILER_FLAGS}")
    else()
        set(CMAKE_CXX_FLAGS "-std=gnu++98")
    endif()
    set(CMAKE_CXX_FLAGS         "-g -Wall -Wcheck -Wmissing-prototypes -Wpointer-arith -Wuninitialized -Wdeprecated -Wunknown-pragmas -Wreturn-type -O3 -restrict -xHost")
    set(CMAKE_CXX_FLAGS_DEBUG   "")
    set(CMAKE_CXX_FLAGS_RELEASE "")
    if(ENABLE_OMP)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -openmp")
    endif()
    if(DEFINED MKL_FLAG)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${MKL_FLAG}")
    endif()
endif()

if(CMAKE_CXX_COMPILER_ID MATCHES GNU)
    if(HAS_CXX11_SUPPORT)
        set(CMAKE_CXX_FLAGS "${CXX11_COMPILER_FLAGS}")
    else()
        set(CMAKE_CXX_FLAGS "-std=gnu++98")
    endif()
    set(CMAKE_CXX_FLAGS         "-Wall -Wno-unknown-pragmas -Wno-sign-compare -Woverloaded-virtual -Wwrite-strings -Wno-unused")
    set(CMAKE_CXX_FLAGS_DEBUG   "-O0 -g3")
  # # radovan: problem on OSX
  # set(CMAKE_CXX_FLAGS_RELEASE "-Ofast -march=native")
    set(CMAKE_CXX_FLAGS_RELEASE "-O3")
    if(ENABLE_OMP)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fopenmp")
    endif()
    if(ENABLE_COVERAGE)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fprofile-arcs -ftest-coverage")
    endif()
endif()

if(CMAKE_CXX_COMPILER_ID MATCHES Clang)
    if(HAS_CXX11_SUPPORT)
        set(CMAKE_CXX_FLAGS "${CXX11_COMPILER_FLAGS}")
    else()
        set(CMAKE_CXX_FLAGS "-std=gnu++98")
    endif()
    set(CMAKE_CXX_FLAGS         "-Wall -Wno-unknown-pragmas -Wno-sign-compare -Woverloaded-virtual -Wwrite-strings -Wno-unused")
    set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g3 -DDEBUG -Wall -Wextra -Winit-self -Woverloaded-virtual -Wuninitialized -Wmissing-declarations -Wwrite-strings -Weffc++ -Wdocumentation")
  # # radovan: problem on OSX
  # set(CMAKE_CXX_FLAGS_RELEASE "-Ofast -march=native")
    set(CMAKE_CXX_FLAGS_RELEASE "-O3")
    if(ENABLE_OMP)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fopenmp")
    endif()
endif()

set(CMAKE_CXX_FLAGS_PROFILE "${CMAKE_CXX_FLAGS_RELEASE} -g -pg")

if(DEFINED EXTRA_CXX_FLAGS)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${EXTRA_CXX_FLAGS}")
endif()

save_compiler_flags(CXX)
endif()
