project "FLAC"
    language "C"
    kind "StaticLib"

	staticruntime "off"

	targetdir ("%{wks.location}/bin/" .. outputDir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputDir .. "/%{prj.name}")

    files {
        "src/libFLAC/**.c",
        "src/libFLAC/**.h"
    }

    defines {
        "FLAC__NO_DLL",
        'PACKAGE_VERSION="1.4.3"'
    }

    includedirs {
        "src/libFLAC/include",
        "include"
    }

    excludes {
        "src/libFLAC/deduplication/**.c"
    }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

    filter "system:windows"
        systemversion "latest"