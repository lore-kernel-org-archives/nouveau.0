From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75279] XCloseDisplay() takes one minute around
 nouveau_dri.so, freezing Firefox startup
Date: Sat, 01 Mar 2014 15:26:09 +0000
Message-ID: <bug-75279-8800-3eelcbztzC@http.bugs.freedesktop.org/>
References: <bug-75279-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2032950137=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75279-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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


--===============2032950137==
Content-Type: multipart/alternative; boundary="1393687569.7aE8ae42.15921"; charset="us-ascii"


--1393687569.7aE8ae42.15921
Date: Sat, 1 Mar 2014 15:26:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75279

--- Comment #28 from Frederic Bezies <fredbezies-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Some progress with debug packages. But I think I'll need xf86-video-nouveau
debug package too.

At least, here is the log :

(gdb) bt full
#0  0x00007f364503a337 in sched_yield () from /usr/lib/libc.so.6
No symbol table info available.
#1  0x00007f3632d0e411 in nouveau_fence_wait (fence=0x7f3630760550)
    at nouveau_fence.c:212
        screen = 0x7f3639e76c00
        spins = 329500464
#2  0x00007f3632d9e115 in nv50_screen_destroy (pscreen=0x7f3639e76c00)
    at nv50/nv50_screen.c:286
No locals.
#3  0x00007f3632c019c1 in vl_screen_destroy (vscreen=0x7f3639e5c980)
    at ../../../../src/gallium/auxiliary/vl/vl_winsys_dri.c:414
        scrn = 0x7f3639e5c980
#4  0x00007f3632d069c1 in vlVdpDeviceDestroy (device=1) at device.c:174
        dev = 0x7f3639eaf2d0
#5  0x00007f3637a252a8 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#6  0x00007f36376871b5 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#7  0x00007f3637688000 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#8  0x00007f3637c167c8 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#9  0x00007f3637c1cf7d in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#10 0x00007f3637c1ea6b in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#11 0x00007f3637c1ed8a in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#12 0x00007f3637880601 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#13 0x00007f36379e5d31 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#14 0x00007f36379e60b5 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#15 0x00007f36379e4efd in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#16 0x00007f36379edae2 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#17 0x00007f364751c347 in ?? () from /home/fred/Applications/firefox/libxul.so
No symbol table info available.
#18 0x00007f3646d94720 in ?? () from /home/fred/Applications/firefox/libxul.so
No symbol table info available.
#19 0x00007f3646d955bd in ?? () from /home/fred/Applications/firefox/libxul.so
No symbol table info available.
#20 0x00007f3646caff3c in ?? () from /home/fred/Applications/firefox/libxul.so
No symbol table info available.
#21 0x00007f3646cb12da in ?? () from /home/fred/Applications/firefox/libxul.so
No symbol table info available.
Cannot access memory at address 0x7fff90a93308

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1393687569.7aE8ae42.15921
Date: Sat, 1 Mar 2014 15:26:09 +0000
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
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279#c28">Comment # 28</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - XCloseDisplay() takes one minute around nouveau_dri.so, freezing Firefox startup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75279">bug 75279</a>
              from <span class="vcard"><a class="email" href="mailto:fredbezies&#64;gmail.com" title="Frederic Bezies &lt;fredbezies&#64;gmail.com&gt;"> <span class="fn">Frederic Bezies</span></a>
</span></b>
        <pre>Some progress with debug packages. But I think I'll need xf86-video-nouveau
debug package too.

At least, here is the log :

(gdb) bt full
#0  0x00007f364503a337 in sched_yield () from /usr/lib/libc.so.6
No symbol table info available.
#1  0x00007f3632d0e411 in nouveau_fence_wait (fence=0x7f3630760550)
    at nouveau_fence.c:212
        screen = 0x7f3639e76c00
        spins = 329500464
#2  0x00007f3632d9e115 in nv50_screen_destroy (pscreen=0x7f3639e76c00)
    at nv50/nv50_screen.c:286
No locals.
#3  0x00007f3632c019c1 in vl_screen_destroy (vscreen=0x7f3639e5c980)
    at ../../../../src/gallium/auxiliary/vl/vl_winsys_dri.c:414
        scrn = 0x7f3639e5c980
#4  0x00007f3632d069c1 in vlVdpDeviceDestroy (device=1) at device.c:174
        dev = 0x7f3639eaf2d0
#5  0x00007f3637a252a8 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#6  0x00007f36376871b5 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#7  0x00007f3637688000 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#8  0x00007f3637c167c8 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#9  0x00007f3637c1cf7d in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#10 0x00007f3637c1ea6b in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#11 0x00007f3637c1ed8a in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#12 0x00007f3637880601 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#13 0x00007f36379e5d31 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#14 0x00007f36379e60b5 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#15 0x00007f36379e4efd in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#16 0x00007f36379edae2 in ?? () from /usr/lib/mozilla/plugins/libflashplayer.so
No symbol table info available.
#17 0x00007f364751c347 in ?? () from /home/fred/Applications/firefox/libxul.so
No symbol table info available.
#18 0x00007f3646d94720 in ?? () from /home/fred/Applications/firefox/libxul.so
No symbol table info available.
#19 0x00007f3646d955bd in ?? () from /home/fred/Applications/firefox/libxul.so
No symbol table info available.
#20 0x00007f3646caff3c in ?? () from /home/fred/Applications/firefox/libxul.so
No symbol table info available.
#21 0x00007f3646cb12da in ?? () from /home/fred/Applications/firefox/libxul.so
No symbol table info available.
Cannot access memory at address 0x7fff90a93308</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1393687569.7aE8ae42.15921--

--===============2032950137==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2032950137==--
