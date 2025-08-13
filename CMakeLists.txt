cmake_minimum_required(VERSION 3.16)

project(InstrumentCluster VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTORCC ON) # MUST BE ADDED MANUALLY
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)
find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Core)

# ADDED BY ME
pkg_check_modules(GPIOD REQUIRED libgpiod)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appInstrumentCluster
    main.cpp
)

set_source_files_properties(
    ui/ThemeSettings/ThemeSettings.qml
    PROPERTIES QT_QML_SINGLETON_TYPE TRUE
)

qt_add_qml_module(appInstrumentCluster
    URI InstrumentCluster
    VERSION 1.0
    QML_FILES
        Main.qml
        RESOURCES resources.qrc
        QML_FILES ui/TopBar/TopBar.qml
        QML_FILES ui/FooterBar/FooterBar.qml
        QML_FILES ui/StyleTheme/StyleTheme.qml
        QML_FILES ui/Logo/Logo.qml
        QML_FILES ui/MusicPlayer/MusicPlayer.qml
        QML_FILES ui/CarSpeed/CarSpeed.qml
        QML_FILES ui/GearShiftBar/GearShiftBar.qml
        QML_FILES ui/LightControlBar/LightControlBar.qml
        QML_FILES ui/CarModel/CarModel.qml
        QML_FILES ui/MainScreen/MainScreen.qml
        QML_FILES ui/SpeedometerPlusSign/SpeedometerPlusSign.qml
        QML_FILES ui/Indicators/Indicators.qml
        QML_FILES ui/SpeedUnit/SpeedUnit.qml
        QML_FILES ui/Speed/Speed.qml
        QML_FILES ui/BottomLine/BottomLine.qml
        QML_FILES ui/IconButton/IconButton.qml
        QML_FILES ui/ThemeSettings/ThemeSettings.qml
        SOURCES Controllers/system.h Controllers/system.cpp
        SOURCES Controllers/lightcontrol.h Controllers/lightcontrol.cpp
        SOURCES Controllers/indicators.h Controllers/indicators.cpp
        SOURCES Controllers/readingscommportal.h Controllers/readingscommportal.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appInstrumentCluster PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appInstrumentCluster
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appInstrumentCluster
    PRIVATE Qt6::Quick
)
target_link_libraries(appInstrumentCluster PRIVATE Qt6::Core)
target_link_libraries(appInstrumentCluster PRIVATE Qt6::Core)

# ADDED BY ME
target_link_libraries(appInstrumentCluster PRIVATE ${GPIOD_LIBRARIES})
target_include_directories(appInstrumentCluster PRIVATE ${GPIOD_INCLUDE_DIRS})

include(GNUInstallDirs)
install(TARGETS appInstrumentCluster
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
