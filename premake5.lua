project "ImGui"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
    staticruntime "on"

	targetdir ("bin/" .. outputDir .. "/%{prj.name}")
	objdir ("bin/intermediate/" .. outputDir .. "/%{prj.name}")

	files {
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
		"imgui_demo.cpp",
        "misc/cpp/imgui_stdlib.cpp",
		"misc/cpp/imgui_stdlib.h"
	}

	filter "system:windows"
		systemversion "latest"
        defines {
            "_CRT_SECURE_CPP_OVERLOAD_STANDARD_NAMES"
        }

	filter "system:linux"
		pic "On"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
