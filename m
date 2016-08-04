From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97192] SuperTuxkart graphic errors [NVE4 - GK104]
Date: Thu, 04 Aug 2016 12:46:51 +0000
Message-ID: <bug-97192-8800-VxLJb2NMp3@http.bugs.freedesktop.org/>
References: <bug-97192-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1289377272=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97192-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1289377272==
Content-Type: multipart/alternative; boundary="14703148100.1e2337.15903";
 charset="UTF-8"


--14703148100.1e2337.15903
Date: Thu, 4 Aug 2016 12:46:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97192

--- Comment #11 from Alejandro <alejandrohp-1Ww2luigxekRVMDPamJrIw@public.gmane.org> ---
I run this:=20
apitrace trace supertuxkart >apitracesupertuxkart


The console shows:
apitrace: warning: glMapBufferRange: MAP_PERSISTENT_BIT w/o FLUSH_EXPLICIT_=
BIT
unsupported (https://github.com/apitrace/apitrace/issues/232)


And the 'apitracesupertuxkart':
?[2;37m[verbose  ] main: Error messages and other text output will be logge=
d to
/home/alejandro/.config/supertuxkart/0.8.2/stdout.log.?[0;;m
?[0m[info   ] [FileManager]: Data files will be fetched from:
'/usr/share/supertuxkart/data/'?[0;;m
?[0m[info   ] [FileManager]: User directory is
'/home/alejandro/.config/supertuxkart/0.8.2/'.?[0;;m
?[0m[info   ] [FileManager]: Addons files will be stored in
'/home/alejandro/.local/share/supertuxkart/addons/'.?[0;;m
?[0m[info   ] [FileManager]: Screenshots will be stored in
'/home/alejandro/.cache/supertuxkart/screenshots/'.?[0;;m
?[0m[info   ] [FileManager]: User-defined grand prix will be stored in
'/home/alejandro/.local/share/supertuxkart/grandprix/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 0 will be loaded from
'/usr/share/supertuxkart/data/challenges/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 1 will be loaded from
'/usr/share/supertuxkart/data/gfx/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 2 will be loaded from
'/usr/share/supertuxkart/data/grandprix/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 3 will be loaded from
'/usr/share/supertuxkart/data/gui/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 4 will be loaded from
'/usr/share/supertuxkart/data/library/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 5 will be loaded from
'/usr/share/supertuxkart/data/models/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 6 will be loaded from
'/usr/share/supertuxkart/data/music/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 7 will be loaded from
'/usr/share/supertuxkart/data/replay/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 8 will be loaded from
'/usr/share/supertuxkart/data/tracks/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 9 will be loaded from
'/usr/share/supertuxkart/data/sfx/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 10 will be loaded from
'/usr/share/supertuxkart/data/shaders/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 11 will be loaded from
'/usr/share/supertuxkart/data/skins/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 12 will be loaded from
'/usr/share/supertuxkart/data/textures/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 13 will be loaded from
'/usr/share/supertuxkart/data/ttf/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 14 will be loaded from
'/usr/share/supertuxkart/data/po/'.?[0;;m
?[2;37m[verbose  ] translation: Env var LANGUAGE =3D 'es'.?[0;;m
?[2;37m[verbose  ] translation: Language 'Spanish'.?[0;;m
Irrlicht Engine version 1.8.0
Linux 4.6.5-gnu-1 #1 SMP PREEMPT Mon Aug 1 06:31:31 UYT 2016 x86_64
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 3: Vertex shader compilation
failed at position -1:

?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 3: Pixel shader compilation
failed at position -1:

?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 3: Vertex shader compilation
failed at position -1:

?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 3: Pixel shader compilation
failed at position -1:

?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 3: Vertex shader compilation
failed at position -1:

?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 3: Pixel shader compilation
failed at position -1:

?[0;;m
?[0m[info   ] IrrDriver: OpenGL version: 4.3?[0;;m
?[0m[info   ] IrrDriver: OpenGL vendor: nouveau?[0;;m
?[0m[info   ] IrrDriver: OpenGL renderer: Gallium 0.4 on NVE4?[0;;m
?[0m[info   ] IrrDriver: OpenGL version string: 4.3 (Core Profile) Mesa
12.0.1?[0;;m
?[0m[info   ] GLDriver: ARB Buffer Storage Present?[0;;m
?[0m[info   ] GLDriver: ARB Base Instance Present?[0;;m
?[0m[info   ] GLDriver: ARB Draw Indirect Present?[0;;m
?[0m[info   ] GLDriver: ARB Compute Shader Present?[0;;m
?[0m[info   ] GLDriver: ARB Arrays of Arrays Present?[0;;m
?[0m[info   ] GLDriver: ARB Texture Storage Present?[0;;m
?[0m[info   ] GLDriver: ARB Texture View Present?[0;;m
?[0m[info   ] GLDriver: ARB Image Load Store Present?[0;;m
?[0m[info   ] GLDriver: ARB Shader Atomic Counters Present?[0;;m
?[0m[info   ] GLDriver: ARB Shader Storage Buffer Object Present?[0;;m
?[0m[info   ] GLDriver: ARB Multi Draw Indirect Present?[0;;m
?[0m[info   ] GLDriver: EXT Texture Compression S3TC Present?[0;;m
?[0m[info   ] GLDriver: ARB Uniform Buffer Object Present?[0;;m
?[0m[info   ] GLDriver: ARB Explicit Attrib Location Present?[0;;m
?[0m[info   ] GLDriver: Geometry Shaders Present?[0;;m
?[0m[info   ] irr_driver: GLSL supported.?[0;;m
?[0m[info   ] Freetype Environment: Loading fonts...?[0;;m
?[0m[info   ] Freetype Environment: DPI for Normal Font is 31.?[0;;m
?[0m[info   ] Freetype Environment: DPI for Title Font is 78.?[0;;m
?[0m[info   ] Freetype Environment: DPI for Digit Font is 46.?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 2: PNG warning: iCCP: known
incorrect sRGB profile
?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 2: PNG warning: iCCP: known
incorrect sRGB profile
?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 2: PNG warning: iCCP: known
incorrect sRGB profile
?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 2: PNG warning: iCCP: known
incorrect sRGB profile
?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 2: PNG warning: iCCP: known
incorrect sRGB profile
?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 2: PNG warning: iCCP: known
incorrect sRGB profile
?[0;;m
?[0m[info   ] ScalableFont::loadTTF: Created 15 glyphs supporting 16 charac=
ters
for high-res digits font Sigmar using 1 glyph page(s).?[0;;m
?[0m[info   ] ScalableFont::loadTTF: Created 94 glyphs supporting 152
characters for bold title font Ubuntu using 2 glyph page(s).?[0;;m
?[0m[info   ] ScalableFont::loadTTF: Created 98 glyphs supporting 101
characters for normal font Ubuntu using 1 glyph page(s).?[0;;m
?[0m[info   ] shader: Compiling shader : texturedquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : texturedquad.frag?[0;;m
?[0m[info   ] shader: Compiling shader : texturedquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : uniformcolortexturedquad.frag?[0;;m
?[0m[info   ] shader: Compiling shader : colortexturedquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : colortexturedquad.frag?[0;;m
?[0m[info   ] HTTPRequest: Downloading
http://addons.supertuxkart.net/dl/xml/news.xml?[0;;m
?[0m[info   ] GrandPrixManager: Loading Grand Prix files from
/usr/share/supertuxkart/data/grandprix/?[0;;m
?[0m[info   ] GrandPrixManager: Loading Grand Prix files from
/home/alejandro/.local/share/supertuxkart/grandprix/?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Adiumy':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Emule':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'Photoshop ICC profil=
e':
'RGB ': RGB color space not permitted on grayscale PNG?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'Photoshop ICC profil=
e':
'RGB ': RGB color space not permitted on grayscale PNG?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Hexley':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Konqi':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'Photoshop ICC profil=
e':
'RGB ': RGB color space not permitted on grayscale PNG?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Konqi':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Konqi':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Konqi':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'Photoshop ICC profil=
e':
'RGB ': RGB color space not permitted on grayscale PNG?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Konqi':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Konqi':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'Photoshop ICC profil=
e':
'RGB ': RGB color space not permitted on grayscale PNG?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Konqi':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[0m[info   ] addons: Using cached addons.xml.?[0;;m
?[0m[info   ] HTTPRequest: Downloading
https://addons.supertuxkart.net/dl/images/857358965734d813e4cd1.jpg?[0;;m
?[2;37m[verbose  ] RaceManager: Nb of karts=3D1, ghost karts:0 ai:0 players=
:1
?[0;;m
?[2;31m[warn   ] EventHandler: While loading track
'/usr/share/supertuxkart/data/tracks/overworld/track.xml'?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass1.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : objectref_pass1.frag?[0;;m
?[0m[info   ] shader: Compiling shader : grass_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : objectref_pass1.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : normalmap.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass1.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_objectref_pass1.frag?[0;=
;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_grass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_objectref_pass1.frag?[0;=
;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_normalmap.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/decodeNormal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/DiffuseIBL.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/SpecularIBL.frag?[0;;m
?[0m[info   ] shader: Compiling shader : IBL.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/decodeNormal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/SpecularBRDF.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/DiffuseBRDF.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/SunMRP.frag?[0;;m
?[0m[info   ] shader: Compiling shader : sunlight.frag?[0;;m
?[0m[info   ] shader: Compiling shader : pointlight.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/decodeNormal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/SpecularBRDF.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/DiffuseBRDF.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : pointlight.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : linearizedepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/decodeNormal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : ssao.frag?[0;;m
?[0m[info   ] shader: Compiling shader : bilateralH.comp?[0;;m
?[0m[info   ] shader: Compiling shader : bilateralV.comp?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : objectref_pass2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : object_unlit.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : splatting.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : objectpass_spheremap.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : detailed_object_pass2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : grass_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : grass_pass2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_objectref_pass2.frag?[0;=
;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_unlit.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader :
instanced_objectpass_spheremap.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader :
instanced_detailed_object_pass2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_grass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_grass_pass2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : glow_object.vert?[0;;m
?[0m[info   ] shader: Compiling shader : glow_object.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : glow.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : transparent.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : passthrough.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getRGBfromCIEXxy.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getCIEXYZ.frag?[0;;m
?[0m[info   ] shader: Compiling shader : tonemap.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : mlaa_color1.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : mlaa_blend2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : mlaa_neigh3.frag?[0;;m
?[0m[info   ] Singleton: Destroyed singleton.?[0;;m
?[2;31m[warn   ] material: Track uses deprecated texture 'grass.jpg'?[0;;m
?[2;31m[warn   ] EventHandler: While loading track
'/usr/share/supertuxkart/data/tracks/overworld/track.xml'?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[1;31m[error  ] EventHandler: While loading track
'/usr/share/supertuxkart/data/tracks/overworld/track.xml'?[0;;m
?[1;31m[error  ] Irrlicht: Could not load mesh, because file could not be
opened: : bubble_solid5.b3d?[0;;m
?[1;31m[error  ] irr_driver: Cannot load mesh <bubble_solid5.b3d>
?[0;;m
?[2;31m[warn   ] TrackObjectManager: Could not load track object. Reason :
Model 'bubble_solid5.b3d' cannot be found?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader :
importance_sampling_specular.frag?[0;;m
?[0m[info   ] shader: Compiling shader : shadow.vert?[0;;m
?[0m[info   ] shader: Compiling shader : shadow.geom?[0;;m
?[0m[info   ] shader: Compiling shader : shadow.frag?[0;;m
?[0m[info   ] shader: Compiling shader : shadow.vert?[0;;m
?[0m[info   ] shader: Compiling shader : shadow.geom?[0;;m
?[0m[info   ] shader: Compiling shader : shadowref.frag?[0;;m
?[0m[info   ] shader: Compiling shader : shadow_grass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : shadow.geom?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_shadowref.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanciedshadow.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_shadow.geom?[0;;m
?[0m[info   ] shader: Compiling shader : shadow.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanciedshadow.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_shadow.geom?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_shadowref.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanciedgrassshadow.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_shadow.geom?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_shadowref.frag?[0;;m
?[0m[info   ] shader: Compiling shader : rsm.vert?[0;;m
?[0m[info   ] shader: Compiling shader : rsm.frag?[0;;m
?[0m[info   ] shader: Compiling shader : rsm.vert?[0;;m
?[0m[info   ] shader: Compiling shader : splatting_rsm.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_rsm.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_rsm.frag?[0;;m
?[0m[info   ] shader: Compiling shader : slicedscreenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : rhpassthrough.geom?[0;;m
?[0m[info   ] shader: Compiling shader : rh.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/decodeNormal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : gi.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/decodeNormal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/SpecularBRDF.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/DiffuseBRDF.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/SunMRP.frag?[0;;m
?[0m[info   ] shader: Compiling shader : sunlightshadow.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : fog.frag?[0;;m
?[0m[info   ] shader: Compiling shader : sky.vert?[0;;m
?[0m[info   ] shader: Compiling shader : sky.frag?[0;;m
?[0m[info   ] shader: Compiling shader : pointlight.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : pointlightscatter.frag?[0;;m
?[0m[info   ] shader: Compiling shader : gaussian6v.comp?[0;;m
?[0m[info   ] shader: Compiling shader : gaussian6h.comp?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : transparentfog.frag?[0;;m
?[0m[info   ] shader: Compiling shader : billboard.vert?[0;;m
?[0m[info   ] shader: Compiling shader : billboard.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : dof.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getCIEXYZ.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getRGBfromCIEXxy.frag?[0;;m
?[0m[info   ] shader: Compiling shader : bloom.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : gaussian6h.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : bloomblend.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : lensblend.frag?[0;;m
?[0m[info   ] shader: Compiling shader : pointemitter.vert?[0;;m
?[0m[info   ] shader: Compiling shader : particle.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : particle.frag?[0;;m
?[0m[info   ] shader: Compiling shader : coloredquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : coloredquad.frag?[0;;m
?[0m[info   ] Singleton: Destroyed singleton.?[0;;m
?[2;37m[verbose  ] RaceManager: Nb of karts=3D5, ghost karts:0 ai:4 players=
:1
?[0;;m
?[0m[info   ] Singleton: Destroyed singleton.?[0;;m
?[2;31m[warn   ] EventHandler: While loading track
'/usr/share/supertuxkart/data/tracks/olivermath/track.xml'?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: While loading track
'/usr/share/supertuxkart/data/tracks/olivermath/track.xml'?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : colorize.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : godfade.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : gaussian3v.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : gaussian3h.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : godray.frag?[0;;m
?[0m[info   ] shader: Compiling shader : primitive2dlist.vert?[0;;m
?[0m[info   ] shader: Compiling shader : transparent.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : motion_blur.frag?[0;;m
?[0m[info   ] Singleton: Destroyed singleton.?[0;;m
?[2;37m[verbose  ] RaceManager: Nb of karts=3D1, ghost karts:0 ai:0 players=
:1
?[0;;m
?[0m[info   ] Singleton: Destroyed singleton.?[0;;m
?[2;31m[warn   ] material: Track uses deprecated texture 'grass.jpg'?[0;;m
?[1;31m[error  ] EventHandler: While loading track
'/usr/share/supertuxkart/data/tracks/overworld/track.xml'?[0;;m
?[1;31m[error  ] Irrlicht: Could not load mesh, because file could not be
opened: : bubble_solid5.b3d?[0;;m
?[1;31m[error  ] irr_driver: Cannot load mesh <bubble_solid5.b3d>
?[0;;m
?[2;31m[warn   ] TrackObjectManager: Could not load track object. Reason :
Model 'bubble_solid5.b3d' cannot be found?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] Singleton: Destroyed singleton.?[0;;m

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14703148100.1e2337.15903
Date: Thu, 4 Aug 2016 12:46:50 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - SuperTuxkart graphic errors [NVE4 - GK104]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97192#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - SuperTuxkart graphic errors [NVE4 - GK104]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97192">bug 97192<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alejandrohp&#64;openmailbox.org" title=3D"Alejandro &lt;alejandrohp&#64;ope=
nmailbox.org&gt;"> <span class=3D"fn">Alejandro</span></a>
</span></b>
        <pre>I run this:=20
apitrace trace supertuxkart &gt;apitracesupertuxkart


The console shows:
apitrace: warning: glMapBufferRange: MAP_PERSISTENT_BIT w/o FLUSH_EXPLICIT_=
BIT
unsupported (<a href=3D"https://github.com/apitrace/apitrace/issues/232">ht=
tps://github.com/apitrace/apitrace/issues/232</a>)


And the 'apitracesupertuxkart':
?[2;37m[verbose  ] main: Error messages and other text output will be logge=
d to
/home/alejandro/.config/supertuxkart/0.8.2/stdout.log.?[0;;m
?[0m[info   ] [FileManager]: Data files will be fetched from:
'/usr/share/supertuxkart/data/'?[0;;m
?[0m[info   ] [FileManager]: User directory is
'/home/alejandro/.config/supertuxkart/0.8.2/'.?[0;;m
?[0m[info   ] [FileManager]: Addons files will be stored in
'/home/alejandro/.local/share/supertuxkart/addons/'.?[0;;m
?[0m[info   ] [FileManager]: Screenshots will be stored in
'/home/alejandro/.cache/supertuxkart/screenshots/'.?[0;;m
?[0m[info   ] [FileManager]: User-defined grand prix will be stored in
'/home/alejandro/.local/share/supertuxkart/grandprix/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 0 will be loaded from
'/usr/share/supertuxkart/data/challenges/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 1 will be loaded from
'/usr/share/supertuxkart/data/gfx/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 2 will be loaded from
'/usr/share/supertuxkart/data/grandprix/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 3 will be loaded from
'/usr/share/supertuxkart/data/gui/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 4 will be loaded from
'/usr/share/supertuxkart/data/library/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 5 will be loaded from
'/usr/share/supertuxkart/data/models/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 6 will be loaded from
'/usr/share/supertuxkart/data/music/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 7 will be loaded from
'/usr/share/supertuxkart/data/replay/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 8 will be loaded from
'/usr/share/supertuxkart/data/tracks/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 9 will be loaded from
'/usr/share/supertuxkart/data/sfx/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 10 will be loaded from
'/usr/share/supertuxkart/data/shaders/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 11 will be loaded from
'/usr/share/supertuxkart/data/skins/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 12 will be loaded from
'/usr/share/supertuxkart/data/textures/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 13 will be loaded from
'/usr/share/supertuxkart/data/ttf/'.?[0;;m
?[0m[info   ] [FileManager]: Asset 14 will be loaded from
'/usr/share/supertuxkart/data/po/'.?[0;;m
?[2;37m[verbose  ] translation: Env var LANGUAGE =3D 'es'.?[0;;m
?[2;37m[verbose  ] translation: Language 'Spanish'.?[0;;m
Irrlicht Engine version 1.8.0
Linux 4.6.5-gnu-1 #1 SMP PREEMPT Mon Aug 1 06:31:31 UYT 2016 x86_64
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 3: Vertex shader compilation
failed at position -1:

?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 3: Pixel shader compilation
failed at position -1:

?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 3: Vertex shader compilation
failed at position -1:

?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 3: Pixel shader compilation
failed at position -1:

?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 3: Vertex shader compilation
failed at position -1:

?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 3: Pixel shader compilation
failed at position -1:

?[0;;m
?[0m[info   ] IrrDriver: OpenGL version: 4.3?[0;;m
?[0m[info   ] IrrDriver: OpenGL vendor: nouveau?[0;;m
?[0m[info   ] IrrDriver: OpenGL renderer: Gallium 0.4 on NVE4?[0;;m
?[0m[info   ] IrrDriver: OpenGL version string: 4.3 (Core Profile) Mesa
12.0.1?[0;;m
?[0m[info   ] GLDriver: ARB Buffer Storage Present?[0;;m
?[0m[info   ] GLDriver: ARB Base Instance Present?[0;;m
?[0m[info   ] GLDriver: ARB Draw Indirect Present?[0;;m
?[0m[info   ] GLDriver: ARB Compute Shader Present?[0;;m
?[0m[info   ] GLDriver: ARB Arrays of Arrays Present?[0;;m
?[0m[info   ] GLDriver: ARB Texture Storage Present?[0;;m
?[0m[info   ] GLDriver: ARB Texture View Present?[0;;m
?[0m[info   ] GLDriver: ARB Image Load Store Present?[0;;m
?[0m[info   ] GLDriver: ARB Shader Atomic Counters Present?[0;;m
?[0m[info   ] GLDriver: ARB Shader Storage Buffer Object Present?[0;;m
?[0m[info   ] GLDriver: ARB Multi Draw Indirect Present?[0;;m
?[0m[info   ] GLDriver: EXT Texture Compression S3TC Present?[0;;m
?[0m[info   ] GLDriver: ARB Uniform Buffer Object Present?[0;;m
?[0m[info   ] GLDriver: ARB Explicit Attrib Location Present?[0;;m
?[0m[info   ] GLDriver: Geometry Shaders Present?[0;;m
?[0m[info   ] irr_driver: GLSL supported.?[0;;m
?[0m[info   ] Freetype Environment: Loading fonts...?[0;;m
?[0m[info   ] Freetype Environment: DPI for Normal Font is 31.?[0;;m
?[0m[info   ] Freetype Environment: DPI for Title Font is 78.?[0;;m
?[0m[info   ] Freetype Environment: DPI for Digit Font is 46.?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 2: PNG warning: iCCP: known
incorrect sRGB profile
?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 2: PNG warning: iCCP: known
incorrect sRGB profile
?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 2: PNG warning: iCCP: known
incorrect sRGB profile
?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 2: PNG warning: iCCP: known
incorrect sRGB profile
?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 2: PNG warning: iCCP: known
incorrect sRGB profile
?[0;;m
?[2;31m[warn   ] [IrrDriver Temp Logger]: Level 2: PNG warning: iCCP: known
incorrect sRGB profile
?[0;;m
?[0m[info   ] ScalableFont::loadTTF: Created 15 glyphs supporting 16 charac=
ters
for high-res digits font Sigmar using 1 glyph page(s).?[0;;m
?[0m[info   ] ScalableFont::loadTTF: Created 94 glyphs supporting 152
characters for bold title font Ubuntu using 2 glyph page(s).?[0;;m
?[0m[info   ] ScalableFont::loadTTF: Created 98 glyphs supporting 101
characters for normal font Ubuntu using 1 glyph page(s).?[0;;m
?[0m[info   ] shader: Compiling shader : texturedquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : texturedquad.frag?[0;;m
?[0m[info   ] shader: Compiling shader : texturedquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : uniformcolortexturedquad.frag?[0;;m
?[0m[info   ] shader: Compiling shader : colortexturedquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : colortexturedquad.frag?[0;;m
?[0m[info   ] HTTPRequest: Downloading
<a href=3D"http://addons.supertuxkart.net/dl/xml/news.xml?[0;;m">http://add=
ons.supertuxkart.net/dl/xml/news.xml?[0;;m</a>
?[0m[info   ] GrandPrixManager: Loading Grand Prix files from
/usr/share/supertuxkart/data/grandprix/?[0;;m
?[0m[info   ] GrandPrixManager: Loading Grand Prix files from
/home/alejandro/.local/share/supertuxkart/grandprix/?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Adiumy':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Amanda':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Emule':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'Photoshop ICC profil=
e':
'RGB ': RGB color space not permitted on grayscale PNG?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'Photoshop ICC profil=
e':
'RGB ': RGB color space not permitted on grayscale PNG?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Gavroche':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Hexley':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Konqi':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'Photoshop ICC profil=
e':
'RGB ': RGB color space not permitted on grayscale PNG?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Konqi':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Konqi':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Konqi':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'Photoshop ICC profil=
e':
'RGB ': RGB color space not permitted on grayscale PNG?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Konqi':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Konqi':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'Photoshop ICC profil=
e':
'RGB ': RGB color space not permitted on grayscale PNG?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Konqi':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: Error while loading kart 'Tux':?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[0m[info   ] addons: Using cached addons.xml.?[0;;m
?[0m[info   ] HTTPRequest: Downloading
<a href=3D"https://addons.supertuxkart.net/dl/images/857358965734d813e4cd1.=
jpg?[0;;m">https://addons.supertuxkart.net/dl/images/857358965734d813e4cd1.=
jpg?[0;;m</a>
?[2;37m[verbose  ] RaceManager: Nb of karts=3D1, ghost karts:0 ai:0 players=
:1
?[0;;m
?[2;31m[warn   ] EventHandler: While loading track
'/usr/share/supertuxkart/data/tracks/overworld/track.xml'?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass1.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : objectref_pass1.frag?[0;;m
?[0m[info   ] shader: Compiling shader : grass_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : objectref_pass1.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : normalmap.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass1.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_objectref_pass1.frag?[0;=
;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_grass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_objectref_pass1.frag?[0;=
;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/encode_normal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_normalmap.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/decodeNormal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/DiffuseIBL.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/SpecularIBL.frag?[0;;m
?[0m[info   ] shader: Compiling shader : IBL.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/decodeNormal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/SpecularBRDF.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/DiffuseBRDF.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/SunMRP.frag?[0;;m
?[0m[info   ] shader: Compiling shader : sunlight.frag?[0;;m
?[0m[info   ] shader: Compiling shader : pointlight.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/decodeNormal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/SpecularBRDF.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/DiffuseBRDF.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : pointlight.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : linearizedepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/decodeNormal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : ssao.frag?[0;;m
?[0m[info   ] shader: Compiling shader : bilateralH.comp?[0;;m
?[0m[info   ] shader: Compiling shader : bilateralV.comp?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : objectref_pass2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : object_unlit.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : splatting.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : objectpass_spheremap.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : detailed_object_pass2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : grass_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : grass_pass2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_objectref_pass2.frag?[0;=
;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_unlit.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader :
instanced_objectpass_spheremap.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader :
instanced_detailed_object_pass2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_grass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getLightFactor.frag?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_grass_pass2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : glow_object.vert?[0;;m
?[0m[info   ] shader: Compiling shader : glow_object.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : glow.frag?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : transparent.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : passthrough.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getRGBfromCIEXxy.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getCIEXYZ.frag?[0;;m
?[0m[info   ] shader: Compiling shader : tonemap.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : mlaa_color1.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : mlaa_blend2.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : mlaa_neigh3.frag?[0;;m
?[0m[info   ] Singleton: Destroyed singleton.?[0;;m
?[2;31m[warn   ] material: Track uses deprecated texture 'grass.jpg'?[0;;m
?[2;31m[warn   ] EventHandler: While loading track
'/usr/share/supertuxkart/data/tracks/overworld/track.xml'?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[1;31m[error  ] EventHandler: While loading track
'/usr/share/supertuxkart/data/tracks/overworld/track.xml'?[0;;m
?[1;31m[error  ] Irrlicht: Could not load mesh, because file could not be
opened: : bubble_solid5.b3d?[0;;m
?[1;31m[error  ] irr_driver: Cannot load mesh &lt;bubble_solid5.b3d&gt;
?[0;;m
?[2;31m[warn   ] TrackObjectManager: Could not load track object. Reason :
Model 'bubble_solid5.b3d' cannot be found?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader :
importance_sampling_specular.frag?[0;;m
?[0m[info   ] shader: Compiling shader : shadow.vert?[0;;m
?[0m[info   ] shader: Compiling shader : shadow.geom?[0;;m
?[0m[info   ] shader: Compiling shader : shadow.frag?[0;;m
?[0m[info   ] shader: Compiling shader : shadow.vert?[0;;m
?[0m[info   ] shader: Compiling shader : shadow.geom?[0;;m
?[0m[info   ] shader: Compiling shader : shadowref.frag?[0;;m
?[0m[info   ] shader: Compiling shader : shadow_grass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : shadow.geom?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_shadowref.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanciedshadow.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_shadow.geom?[0;;m
?[0m[info   ] shader: Compiling shader : shadow.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanciedshadow.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_shadow.geom?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_shadowref.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanciedgrassshadow.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_shadow.geom?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_shadowref.frag?[0;;m
?[0m[info   ] shader: Compiling shader : rsm.vert?[0;;m
?[0m[info   ] shader: Compiling shader : rsm.frag?[0;;m
?[0m[info   ] shader: Compiling shader : rsm.vert?[0;;m
?[0m[info   ] shader: Compiling shader : splatting_rsm.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getworldmatrix.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_rsm.vert?[0;;m
?[0m[info   ] shader: Compiling shader : instanced_rsm.frag?[0;;m
?[0m[info   ] shader: Compiling shader : slicedscreenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : rhpassthrough.geom?[0;;m
?[0m[info   ] shader: Compiling shader : rh.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/decodeNormal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : gi.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/decodeNormal.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/SpecularBRDF.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/DiffuseBRDF.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/SunMRP.frag?[0;;m
?[0m[info   ] shader: Compiling shader : sunlightshadow.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : fog.frag?[0;;m
?[0m[info   ] shader: Compiling shader : sky.vert?[0;;m
?[0m[info   ] shader: Compiling shader : sky.frag?[0;;m
?[0m[info   ] shader: Compiling shader : pointlight.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : pointlightscatter.frag?[0;;m
?[0m[info   ] shader: Compiling shader : gaussian6v.comp?[0;;m
?[0m[info   ] shader: Compiling shader : gaussian6h.comp?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : transparentfog.frag?[0;;m
?[0m[info   ] shader: Compiling shader : billboard.vert?[0;;m
?[0m[info   ] shader: Compiling shader : billboard.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : dof.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getCIEXYZ.frag?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getRGBfromCIEXxy.frag?[0;;m
?[0m[info   ] shader: Compiling shader : bloom.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : gaussian6h.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : bloomblend.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : lensblend.frag?[0;;m
?[0m[info   ] shader: Compiling shader : pointemitter.vert?[0;;m
?[0m[info   ] shader: Compiling shader : particle.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : particle.frag?[0;;m
?[0m[info   ] shader: Compiling shader : coloredquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : coloredquad.frag?[0;;m
?[0m[info   ] Singleton: Destroyed singleton.?[0;;m
?[2;37m[verbose  ] RaceManager: Nb of karts=3D5, ghost karts:0 ai:4 players=
:1
?[0;;m
?[0m[info   ] Singleton: Destroyed singleton.?[0;;m
?[2;31m[warn   ] EventHandler: While loading track
'/usr/share/supertuxkart/data/tracks/olivermath/track.xml'?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: known incorrect sRGB
profile?[0;;m
?[2;31m[warn   ] EventHandler: While loading track
'/usr/share/supertuxkart/data/tracks/olivermath/track.xml'?[0;;m
?[2;31m[warn   ] Irrlicht: PNG warning: iCCP: profile 'ICC profile': 100000=
0h:
invalid rendering intent?[0;;m
?[0m[info   ] shader: Compiling shader : object_pass.vert?[0;;m
?[0m[info   ] shader: Compiling shader : colorize.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : godfade.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : gaussian3v.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : gaussian3h.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : godray.frag?[0;;m
?[0m[info   ] shader: Compiling shader : primitive2dlist.vert?[0;;m
?[0m[info   ] shader: Compiling shader : transparent.frag?[0;;m
?[0m[info   ] shader: Compiling shader : screenquad.vert?[0;;m
?[0m[info   ] shader: Compiling shader : utils/getPosFromUVDepth.frag?[0;;m
?[0m[info   ] shader: Compiling shader : motion_blur.frag?[0;;m
?[0m[info   ] Singleton: Destroyed singleton.?[0;;m
?[2;37m[verbose  ] RaceManager: Nb of karts=3D1, ghost karts:0 ai:0 players=
:1
?[0;;m
?[0m[info   ] Singleton: Destroyed singleton.?[0;;m
?[2;31m[warn   ] material: Track uses deprecated texture 'grass.jpg'?[0;;m
?[1;31m[error  ] EventHandler: While loading track
'/usr/share/supertuxkart/data/tracks/overworld/track.xml'?[0;;m
?[1;31m[error  ] Irrlicht: Could not load mesh, because file could not be
opened: : bubble_solid5.b3d?[0;;m
?[1;31m[error  ] irr_driver: Cannot load mesh &lt;bubble_solid5.b3d&gt;
?[0;;m
?[2;31m[warn   ] TrackObjectManager: Could not load track object. Reason :
Model 'bubble_solid5.b3d' cannot be found?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] Script: allchallenges: unlocked_challenges=3D2, challenges=3D=
26?[0;;m
?[0m[info   ] Singleton: Destroyed singleton.?[0;;m</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14703148100.1e2337.15903--

--===============1289377272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1289377272==--
