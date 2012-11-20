From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57278] [xf86-video-nouveau] flightgear crash when
 loading scenary
Date: Tue, 20 Nov 2012 17:17:29 +0000
Message-ID: <bug-57278-8800-yeEf7ee5Tl@http.bugs.freedesktop.org/>
References: <bug-57278-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0175441572=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-57278-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0175441572==
Content-Type: multipart/alternative; boundary="1353431849.e5021.13242"; charset="us-ascii"


--1353431849.e5021.13242
Date: Tue, 20 Nov 2012 17:17:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=57278

--- Comment #1 from comer352l-S0/GAf8tV78@public.gmane.org ---
The same happens to me, except that it also crashes the X-server.

When starting FlightGear from the console, I get the following output before it
crashes:

nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 30
nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 30
nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 55
nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 56
nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 59
nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 58
nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 30
KI266 dme indicator #0 initialized
loading scenarion 'nimitz_demo'
AL lib: alc_initconfig: Failed to initialize backend "pulse"
nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 30
Initializing Nasal Electrical System
fgfs: nouveau_pushbuf.c:274: nouveau_pushbuf_flush: Assertion `0' failed.


Then
- the machine freezes for some seconds
- terminal appears with lines fragmented/shifted (X-server crashed ?)
- the machine freezes again for some seconds
- switches back to X, but screen is garbled
- switches back to terminal after a few seconds

100% reproducable.

Hardware: GeForce 6150SE (NV4C)
Distro: openSUSE 12.2
Kernel: 3.6.7 vanilla (can't test 3.7-rc due to a regression)
Mesa: 8.0.4
libdrm: 2.4.33
FlightGear: 2.8.0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1353431849.e5021.13242
Date: Tue, 20 Nov 2012 17:17:29 +0000
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
   title="NEW --- - [xf86-video-nouveau] flightgear crash when loading scenary"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57278#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [xf86-video-nouveau] flightgear crash when loading scenary"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=57278">bug 57278</a>
              from <span class="vcard"><a class="email" href="mailto:comer352l&#64;web.de" title="comer352l&#64;web.de">comer352l&#64;web.de</a>
</span></b>
        <pre>The same happens to me, except that it also crashes the X-server.

When starting FlightGear from the console, I get the following output before it
crashes:

nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 30
nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 30
nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 55
nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 56
nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 59
nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 58
nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 30
KI266 dme indicator #0 initialized
loading scenarion 'nimitz_demo'
AL lib: alc_initconfig: Failed to initialize backend &quot;pulse&quot;
nvfx_screen_get_param:95 -  Warning: unknown PIPE_CAP 30
Initializing Nasal Electrical System
fgfs: nouveau_pushbuf.c:274: nouveau_pushbuf_flush: Assertion `0' failed.


Then
- the machine freezes for some seconds
- terminal appears with lines fragmented/shifted (X-server crashed ?)
- the machine freezes again for some seconds
- switches back to X, but screen is garbled
- switches back to terminal after a few seconds

100% reproducable.

Hardware: GeForce 6150SE (NV4C)
Distro: openSUSE 12.2
Kernel: 3.6.7 vanilla (can't test 3.7-rc due to a regression)
Mesa: 8.0.4
libdrm: 2.4.33
FlightGear: 2.8.0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1353431849.e5021.13242--

--===============0175441572==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0175441572==--
