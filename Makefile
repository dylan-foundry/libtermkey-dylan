MELANGE=melange

all: build

.PHONY: build clean

tickit.dylan: tickit.intr
	$(MELANGE) -Tc-ffi tickit.intr tickit.dylan

build: tickit.dylan
	dylan-compiler -build tickit

clean:
	rm -f tickit.dylan
	rm -rf _build/bin/tickit*
	rm -rf _build/lib/*tickit*
	rm -rf _build/build/tickit*
