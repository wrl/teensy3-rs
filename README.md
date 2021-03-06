# Rust on Teensy3

This is a repo for development on the Teensy3 in Rust. This repo is bootstrapped
with Teensyduino bindings, generated by servo's branch of bindgen

## Goals

* Turn this repo into a module that can be included as a Crate.
* Not force people to fork this repo to work on their own applications
* Minimize the amount of unsafe calls that are necessary for normal application level programming
* Maybe switch to a less Arduino oriented API in the future, or at least learn enough lessons here to make that possible in another project
* Low priority/Non-Goal: Reimplement generated components with native rust

## Current state:

Should build, and get a blinky led. No other promises

## Thanks, Citiations

This code is nearly entirely thanks to these resources:

[PJRC's Teensyduino libraries](https://github.com/PaulStoffregen/cores) for the Teensy3, which are used as bindings.

[Simon's teensy3-clock repo](https://github.com/SimonSapin/teensy-clock) for the rust main, build scripts, bindgen knowledge, et. al.

[Servo's fork of bindgen](https://github.com/servo/rust-bindgen)

## Dependencies

* A somewhat current Nightly Build of Rust (currently tested on `rustc 1.13.0-nightly (6ffdda1ba 2016-09-14)`)
* [Japaric's Xargo Tool](https://github.com/japaric/xargo) - used to cross compile libcore
* A somewhat current arm-none-eabi-gcc toolchain.
    * 4.9.3 seems to work with a slight linker hack
    * 6.x.x seems to work without hacks.

Sorry for the lack of definite documents. More to come.

## License

MIT License, unless otherwise specified
