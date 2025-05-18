+++
title = "C++ Programming: Starting with Simple DirectMedia Library (SDL 3)"
date = 2025-05-17T19:04:00-07:00
tags = ["SDL"]
categories = ["Graphics"]
draft = false
+++

<div class="ox-hugo-toc toc">

<div class="heading">Table of Contents</div>

- [Motivation](#motivation)
- [About SDL](#about-sdl)
- [Following Tutorial and Projects](#following-tutorial-and-projects)

</div>
<!--endtoc-->


## Motivation {#motivation}

I decided to become a better programmer. I think that coding to make CRUD apps is a path to being replaceable. Plus, as I'm heading to major Computer Science and Engineering at UCI, I have decided to begin creating C++ projects that reinforce the fundamentals of programming fields. With my current resources, I think I can do graphics, and make a game from scratch. Once I finish messing around with [Simple DirectMedia Layer](https://www.libsdl.org/) (SDL), I am probably going to create a web socket.


## About SDL {#about-sdl}

SDL is a cross-platform development library for graphical application that needs low level access to hardware. It is used as a library for several game engines and therefore for many games. I also heard that SDL is known for being a layer of abstraction so that I won't have to mess with specific lower level graphics API such as vulkan or d3d11. SDL is a library to make cross platform computer graphics application. As well, learning to use this library means knowing the fundamentals of computer graphics.
I proceed to dive head first into the documentation, which I realize I have no idea what I am looking at: A series of C functions organized into categories that I can't put together and don't understand. Indeed, purely looking at documentation is only possible when you're used to the documentation have well established a basic understanding of what the library do and the underlying concepts around it. Luckily, being a popular library, there are tutorials. I decide to take things slow to become competent. Right now, I am nothing. I am worthless.


## Following Tutorial and Projects {#following-tutorial-and-projects}

I've made [SDLTrial](https://github.com/minh-p/SDLTrial), my GitHub repository to learn C/C++ tooling and as well the SDL library. I hope that this will build my resume and of course help anyone who's also learning the SDL library as well. As of the moment of creating this post, I have succesfully completed "Hello World", or showing a triangle on screen! Check out [Triangle](https://github.com/minh-p/SDLTrial/tree/main/Triangle).
As well, I am using [NixOS](https://nixos.org/). The repository features setting development and compilation up the nix way with [default.nix](https://github.com/minh-p/SDLTrial/blob/main/Triangle/default.nix) and [flake.nix](https://github.com/minh-p/SDLTrial/blob/main/flake.nix) alongside [CMake](https://github.com/minh-p/SDLTrial/blob/main/Triangle/CMakeLists.txt).
