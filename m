From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 79823] [NV30/gallium] Mozilla apps freeze on startup
 with nouveau-dri-10.2.1 libs on dual-screen
Date: Wed, 18 Jun 2014 22:23:08 +0000
Message-ID: <bug-79823-8800-4VUJv1x0cT@http.bugs.freedesktop.org/>
References: <bug-79823-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2080713124=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-79823-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2080713124==
Content-Type: multipart/alternative; boundary="1403130188.4871E12A1.13144"; charset="us-ascii"


--1403130188.4871E12A1.13144
Date: Wed, 18 Jun 2014 22:23:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=79823

--- Comment #23 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, well, I can't repro this, but clearly the device is getting closed
_somehow_. It appears that you're relatively able at debugging things, let me
know if I've misunderstood.

Can you load up glxtest in gdb (with my fixes), and do

break main
r
break close
break nv30_screen_destroy
c

and look at what happens. The first couple of closes will actually be at
creation time because it opens/closes some config files, continue past those.

This is what I see:

(gdb) c
Continuing.

Breakpoint 2, nv50_screen_destroy (pscreen=0x633c60) at nv50/nv50_screen.c:295
295        struct nv50_screen *screen = nv50_screen(pscreen);
(gdb) n
297        if (!nouveau_drm_screen_unref(&screen->base))
(gdb) p screen->base.device->fd
$1 = 8
(gdb) c
Continuing.

Breakpoint 3, 0x00007ffff6db23d0 in close () from /lib64/libc.so.6
(gdb) bt
#0  0x00007ffff6db23d0 in close () from /lib64/libc.so.6
#1  0x00007ffff643797a in dri2DestroyScreen (base=0x618c50) at dri2_glx.c:712
#2  0x00007ffff63fcdb5 in FreeScreenConfigs (priv=0x615600) at glxext.c:208
#3  0x00007ffff63fce3f in glx_display_free (priv=0x615600) at glxext.c:231
#4  0x00007ffff63fd01a in __glXCloseDisplay (dpy=0x6070f0, codes=0x615688)
    at glxext.c:279
#5  0x00007ffff78bc0c2 in XCloseDisplay () from /usr/lib64/libX11.so.6
#6  0x00000000004011be in glxtest () at glxtest.cpp:202
#7  0x000000000040120a in main (argc=1, argv=0x7fffffffdda8) at glxtest.cpp:211
(gdb) up
#1  0x00007ffff643797a in dri2DestroyScreen (base=0x618c50) at dri2_glx.c:712
712        close(psc->fd);
(gdb) p psc->fd
$2 = 8
(gdb) c
Continuing.

Breakpoint 3, 0x00007ffff6db23d0 in close () from /lib64/libc.so.6
(gdb) bt
#0  0x00007ffff6db23d0 in close () from /lib64/libc.so.6
#1  0x00007ffff6abddee in xcb_disconnect () from /usr/lib64/libxcb.so.1
#2  0x00007ffff78bc0f7 in XCloseDisplay () from /usr/lib64/libX11.so.6
#3  0x00000000004011be in glxtest () at glxtest.cpp:202
#4  0x000000000040120a in main (argc=1, argv=0x7fffffffdda8) at glxtest.cpp:211
(gdb) c

[this is actually with nv50, but the nv30 flow should be no different]

You must be getting something else, otherwise how is that fd getting closed
already.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403130188.4871E12A1.13144
Date: Wed, 18 Jun 2014 22:23:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823#c23">Comment # 23</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV30/gallium] Mozilla apps freeze on startup with nouveau-dri-10.2.1 libs on dual-screen"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=79823">bug 79823</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, well, I can't repro this, but clearly the device is getting closed
_somehow_. It appears that you're relatively able at debugging things, let me
know if I've misunderstood.

Can you load up glxtest in gdb (with my fixes), and do

break main
r
break close
break nv30_screen_destroy
c

and look at what happens. The first couple of closes will actually be at
creation time because it opens/closes some config files, continue past those.

This is what I see:

(gdb) c
Continuing.

Breakpoint 2, nv50_screen_destroy (pscreen=0x633c60) at nv50/nv50_screen.c:295
295        struct nv50_screen *screen = nv50_screen(pscreen);
(gdb) n
297        if (!nouveau_drm_screen_unref(&amp;screen-&gt;base))
(gdb) p screen-&gt;base.device-&gt;fd
$1 = 8
(gdb) c
Continuing.

Breakpoint 3, 0x00007ffff6db23d0 in close () from /lib64/libc.so.6
(gdb) bt
#0  0x00007ffff6db23d0 in close () from /lib64/libc.so.6
#1  0x00007ffff643797a in dri2DestroyScreen (base=0x618c50) at dri2_glx.c:712
#2  0x00007ffff63fcdb5 in FreeScreenConfigs (priv=0x615600) at glxext.c:208
#3  0x00007ffff63fce3f in glx_display_free (priv=0x615600) at glxext.c:231
#4  0x00007ffff63fd01a in __glXCloseDisplay (dpy=0x6070f0, codes=0x615688)
    at glxext.c:279
#5  0x00007ffff78bc0c2 in XCloseDisplay () from /usr/lib64/libX11.so.6
#6  0x00000000004011be in glxtest () at glxtest.cpp:202
#7  0x000000000040120a in main (argc=1, argv=0x7fffffffdda8) at glxtest.cpp:211
(gdb) up
#1  0x00007ffff643797a in dri2DestroyScreen (base=0x618c50) at dri2_glx.c:712
712        close(psc-&gt;fd);
(gdb) p psc-&gt;fd
$2 = 8
(gdb) c
Continuing.

Breakpoint 3, 0x00007ffff6db23d0 in close () from /lib64/libc.so.6
(gdb) bt
#0  0x00007ffff6db23d0 in close () from /lib64/libc.so.6
#1  0x00007ffff6abddee in xcb_disconnect () from /usr/lib64/libxcb.so.1
#2  0x00007ffff78bc0f7 in XCloseDisplay () from /usr/lib64/libX11.so.6
#3  0x00000000004011be in glxtest () at glxtest.cpp:202
#4  0x000000000040120a in main (argc=1, argv=0x7fffffffdda8) at glxtest.cpp:211
(gdb) c

[this is actually with nv50, but the nv30 flow should be no different]

You must be getting something else, otherwise how is that fd getting closed
already.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403130188.4871E12A1.13144--

--===============2080713124==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2080713124==--
