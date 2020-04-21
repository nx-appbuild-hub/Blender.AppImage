SOURCE="https://ftp.halifax.rwth-aachen.de/blender/release/Blender2.82/blender-2.82-linux64.tar.xz"
DESTINATION="build.tar.xz"
OUTPUT="Blender.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)

	mkdir -p build
	tar -xJf $(DESTINATION) --directory build

	mkdir --parents AppDir/opt/application
	cp -r build/blender-*/* AppDir/opt/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)

	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/opt
	rm -rf build
