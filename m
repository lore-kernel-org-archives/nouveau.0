From: Robert Millan <rmh-pC/4jmrOO5FBDgjK7y7TUQ@public.gmane.org>
Subject: missing GLX extension
Date: Mon, 24 Sep 2007 18:22:18 +0200
Message-ID: <20070924162218.GA31546@thorin>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


It seems renouveau doesn't cope well with missing GLX extension, unlike
e.g. glxgears:

rmh@cesc:~/renouveau$ glxgears
Xlib:  extension "GLX" missing on display ":0.0".
Error: couldn't get an RGB, Double-buffered visual
rmh@cesc:~/renouveau$ ./renouveau
detect_devices: Creating probe window failed.
We tried to create a window by using SDL.
Our OpenGL tests require a stencil buffer whichusually
is not available with 16-bit desktop colordepth. If you are
using 16-bit colors, please try24-bit instead.
Device detection failed.
Segmentation fault
rmh@cesc:~/renouveau$ gdb ./renouveau
[...]
(gdb) r
[...]
(gdb) bt
#0  0xb79b694f in glXChannelRectSyncSGIX () from /usr/lib/libGL.so.1
#1  0x09e48838 in ?? ()
#2  0xb79ec660 in ?? () from /usr/lib/libGL.so.1
#3  0x09e48838 in ?? ()
#4  0xb79b51a6 in glXChannelRectSyncSGIX () from /usr/lib/libGL.so.1
#5  0x09e48838 in ?? ()
#6  0x09e48838 in ?? ()
#7  0xb7ce2b24 in ?? () from /usr/lib/libX11.so.6
#8  0x09e56080 in ?? ()
#9  0xb7c10746 in XCloseDisplay (dpy=0x9e48838) at ../../src/ClDisplay.c:67
#10 0xb7e7c8fe in XCloseDisplay (a=0x9e48838)
    at ../../src/video/x11/SDL_x11sym.h:33
#11 0xb7e8607b in X11_VideoQuit (this=0x9e43790)
    at ../../src/video/x11/SDL_x11video.c:1388
#12 0xb7e75890 in SDL_VideoQuit () at ../../src/video/SDL_video.c:1344
#13 0xb7e4a544 in SDL_QuitSubSystem (flags=65535) at ../../src/SDL.c:200
#14 0xb7e4a5be in SDL_Quit () at ../../src/SDL.c:220
#15 0x08057ccd in cleanup () at main.c:182
#16 0xb7d13514 in exit () from /lib/i686/cmov/libc.so.6
#17 0xb7cfc058 in __libc_start_main () from /lib/i686/cmov/libc.so.6
#18 0x0804a311 in _start ()
(gdb)

Sorry for not providing a patch, but I'm quite novice at X programming and
run out of time.  Hope that helps anyway.

-- 
Robert Millan

<GPLv2> I know my rights; I want my phone call!
<DRM> What use is a phone call, if you are unable to speak?
(as seen on /.)
