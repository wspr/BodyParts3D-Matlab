# BodyParts3D in Matlab

This small collection of functions can be used to load and plot items from the BodyParts3D database.
This database is used for the [Anatomography website](http://lifesciencedb.jp/bp3d/?lng=en). 

You are currently reading the README. The nice ‘project page’ is located [here](http://wspr.github.io/BodyParts3D-Matlab/).

## Download BodyParts3D

To use this code, the BodyParts3D database must first be downloaded: <https://dbarchive.biosciencedbc.jp/en/bodyparts3d/download.html>

Download the IS-A Tree version of the "Polygon Mesh Data" collections (`isa_BP3D_4.0_obj_99.zip`);
it has a larger number of files which corresponds to the list included in the file `isa_element_parts.txt`.
A direct download link is: <ftp://ftp.biosciencedbc.jp/archive/bodyparts3d/LATEST/isa_BP3D_4.0_obj_99.zip> (136MB)


## Configuration

The file `displ_body_parts.m` must have two paths changed to be specific for your system.
Wherever you put the folder containing the `.obj` files, change `OBJ_PATH` to that location.
Then change `CACHE_PATH` anywhere else on your computer; this folder will be used to store
cache files so that the `.obj` files don't need to be imported (a slow process) every time.

    OBJ_PATH   = '/Users/will/Local/Biomech/BodyParts3D/v4obj/';
    CACHE_PATH = '/Users/will/Local/Biomech/BodyParts3D/v4cache/';

After adding the `BodyParts3D-matlab` directory to your Matlab path, run `load_parts_list.m`
in the same directory to save the `parts_list.mat` file. Otherwise it will be added to
whichever directory you're in when you run the code, which would waste a little time and disk space.


## Usage

It's pretty easy — check out the example file `example_body_parts.m`.
Basically, run the command `find_body_parts(regex)` to search for body parts in the database; e.g.,

    find_body_parts('bone organ .* vertebra')
    find_body_parts('vocalis')
 
When that returns the part(s) you wish to display, add an output as so:

    parts = find_body_parts('/ cervical vertebra /');
    displ_body_parts(parts)

Colour and opacity can be selected using additional options to `displ_body_parts()`.


## Copyright and licence

Copyright 2016 Will Robertson and The University of Adelaide.

Distributed under the [Apache License v2](http://www.apache.org/licenses/LICENSE-2.0).

The following files are redistributed from other work:

### `isa_element_parts.txt`

This file is copied verbatim from BodyParts3D. 
The BodyParts3D database is licensed by *BodyParts3D, © The Database Center for Life Science*
under the *CC Attribution-Share Alike 2.1 Japan* license.

### `read_wobj.m`

This repository also contains the `read_wobj.m` file, which has been extracted from the
["Wavefront OBJ toolbox"](http://au.mathworks.com/matlabcentral/fileexchange/27982-wavefront-obj-toolbox).

The file has been edited to include its complete license information.
