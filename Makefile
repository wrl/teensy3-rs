SERIAL_DEVICE = /dev/ttyACM0

hex: rust
	@make --no-print-directory -C teensy3 NO_ARDUINO=1

flash: hex
	teensy-loader-cli -w -s --mcu=mk20dx256 teensy3/main.hex

rust:
	@xargo build --release

bindgen:
	PATH="/home/simon/projects/servo/ports/geckolib/binding_tools/rust-bindgen/target/debug:$$PATH" \
	bindgen --no-type-renaming --match teensy3 bindings.h -o src/bindings.rs -- \
	-I/usr/lib/clang/3.8.1/include -x c++ -std=gnu++11 -target thumbv7em-none-eabi \
	-DF_CPU=48000000 -DUSB_SERIAL -DLAYOUT_US_ENGLISH -DUSING_MAKEFILE \
	-D__MK20DX256__ -DARDUINO=10600 -DTEENSYDUINO=121

cat:
	while true; do [ -r $(SERIAL_DEVICE) ] && cat $(SERIAL_DEVICE); inotifywait -qq -e create -e attrib /dev; done

get:
	(sleep .01; echo g > $(SERIAL_DEVICE)) &
	head -n1 $(SERIAL_DEVICE)

sync:
	date --utc '+s%Y-%m-%d %H:%M:%S' > $(SERIAL_DEVICE)

clean:
	git clean -Xf
