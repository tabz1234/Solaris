tplayer - Linux terminal video player
=====================================
![example](https://github.com/tabz1234/tplayer/blob/master/resource/example.jpg)
Terminal support
----------------
Its better to use "fast" terminals like alacritty or kitty, 
but all of wide-used supported

Build dependencies
------------------
- git
- gcc or clang with c++20 support
- cmake
- findpkg
- OpenAL
- FFmpeg
- Intel Threading Building Blocks(tbb)

Build instructions
------------------

    $ git clone https://github.com/tabz1234/tplayer.git
    && cd tplayer/
    && cmake .
    && cmake --build .
    
