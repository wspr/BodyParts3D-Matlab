
<h1>
<a id="bodyparts3d-in-matlab" class="anchor" href="#bodyparts3d-in-matlab" aria-hidden="true"><span aria-hidden="true" class="octicon octicon-link"></span></a>BodyParts3D in Matlab</h1>

<p>This small collection of functions can be used to load and plot items from the BodyParts3D database.
This database is used for the <a href="http://lifesciencedb.jp/bp3d/?lng=en">Anatomography website</a>. </p>

<h2>
<a id="download-bodyparts3d" class="anchor" href="#download-bodyparts3d" aria-hidden="true"><span aria-hidden="true" class="octicon octicon-link"></span></a>Download BodyParts3D</h2>

<p>To use this code, the BodyParts3D database must first be downloaded: <a href="https://dbarchive.biosciencedbc.jp/en/bodyparts3d/download.html">https://dbarchive.biosciencedbc.jp/en/bodyparts3d/download.html</a></p>

<p>Download the IS-A Tree version of the "Polygon Mesh Data" collections (<code>isa_BP3D_4.0_obj_99.zip</code>);
it has a larger number of files which corresponds to the list included in the file <code>isa_element_parts.txt</code>.
A direct download link is: ftp://ftp.biosciencedbc.jp/archive/bodyparts3d/LATEST/isa_BP3D_4.0_obj_99.zip (136MB)</p>

<h2>
<a id="configuration" class="anchor" href="#configuration" aria-hidden="true"><span aria-hidden="true" class="octicon octicon-link"></span></a>Configuration</h2>

<p>The file <code>displ_body_parts.m</code> must have two paths changed to be specific for your system.
Wherever you put the folder containing the <code>.obj</code> files, change <code>OBJ_PATH</code> to that location.
Then change <code>CACHE_PATH</code> anywhere else on your computer; this folder will be used to store
cache files so that the <code>.obj</code> files don't need to be imported (a slow process) every time.</p>

<pre><code>OBJ_PATH   = '/Users/will/Local/Biomech/BodyParts3D/v4obj/';
CACHE_PATH = '/Users/will/Local/Biomech/BodyParts3D/v4cache/';
</code></pre>

<p>After adding the <code>BodyParts3D-matlab</code> directory to your Matlab path, run <code>load_parts_list.m</code>
in the same directory to save the <code>parts_list.mat</code> file. Otherwise it will be added to
whichever directory you're in when you run the code, which would waste a little time and disk space.</p>

<h2>
<a id="usage" class="anchor" href="#usage" aria-hidden="true"><span aria-hidden="true" class="octicon octicon-link"></span></a>Usage</h2>

<p>It's pretty easy — check out the example file <code>example_body_parts.m</code>.
Basically, run the command <code>find_body_parts(regex)</code> to search for body parts in the database; e.g.,</p>

<pre><code>find_body_parts('bone organ .* vertebra')
find_body_parts('vocalis')
</code></pre>

<p>When that returns the part(s) you wish to display, add an output as so:</p>

<pre><code>parts = find_body_parts('/ cervical vertebra /');
displ_body_parts(parts)
</code></pre>

<p>Colour and opacity can be selected using additional options to <code>displ_body_parts()</code> as shown in the example file, which produces the rather attractive image following.</p>

<p><img src="spine.png"></p>

