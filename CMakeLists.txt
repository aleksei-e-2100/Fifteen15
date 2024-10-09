cmake_minimum_required(VERSION 3.20)

project(Fifteen15 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Multimedia)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(${PROJECT_NAME}
    main.cpp
    gamecontrol.h
    gamecontrol.cpp
)

qt_add_qml_module(${PROJECT_NAME}
    URI qmlpath
    VERSION 1.0
    QML_FILES
        Main.qml
        Game.qml
        Settings.qml
        Credits.qml
        RESOURCES
            Sounds/Click.mp3
            Sounds/Funky-Chase.mp3
        RESOURCES
            Images/game.png
            Images/info.png
            Images/settings.png
            Images/stack.png
        RESOURCES
            android/AndroidManifest.xml
            android/build.gradle
            android/res/values/libs.xml
            android/res/xml/qtprovider_paths.xml
            android/gradle/wrapper/gradle-wrapper.jar
            android/gradle/wrapper/gradle-wrapper.properties
            android/gradle.properties
            android/gradlew
            android/gradlew.bat
)

set_property(TARGET ${PROJECT_NAME}
    PROPERTY
        QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
)

set_target_properties(${PROJECT_NAME}
    PROPERTIES
        WIN32_EXECUTABLE TRUE
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
        Qt6::Quick
        Qt6::Multimedia
)

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
