From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111213] VA-API nouveau SIGSEGV and asserts
Date: Thu, 25 Jul 2019 17:22:22 +0000
Message-ID: <bug-111213-8800-nF8LTf3nmR@http.bugs.freedesktop.org/>
References: <bug-111213-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0104756998=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111213-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0104756998==
Content-Type: multipart/alternative; boundary="15640753421.24c6.26365"
Content-Transfer-Encoding: 7bit


--15640753421.24c6.26365
Date: Thu, 25 Jul 2019 17:22:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111213

--- Comment #3 from KJ Liew <liewkj-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> ---
(In reply to LoneVVolf from comment #1)
> Problem started with mesa 19.1.x and is also present in git master

I am not quite sure if this started with mesa 19.1.x. On GT730 I downgraded
mesa=20
back to 19.0.6 and gstreamer is still broken. The vainfo/vdpauinfo SIGSEGV
started with mesa 19.1.x. But that was just the simplest VA-API sanity check
and I found that h264 video decoding remains broken.

$ pacman -Qs mesa | grep ^[a-z]
local/glu 9.0.0-5
local/libva-mesa-driver 19.0.6-1
local/mesa 19.0.6-1
local/mesa-demos 8.4.0-1
local/mesa-vdpau 19.0.6-1

$ gst-launch-1.0 playbin uri=3Dfile:///path/to/MP4=20
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
Got context from element 'vaapipostproc0': gst.gl.GLDisplay=3Dcontext,
gst.gl.GLDisplay=3D(GstGLDisplay)"\(GstGLDisplayWayland\)\ gldisplaywayland=
0";
Got context from element 'vaapipostproc0': gst.vaapi.Display=3Dcontext,
gst.vaapi.Display=3D(GstVaapiDisplay)"\(GstVaapiDisplayEGL\)\ vaapidisplaye=
gl0";
Caught SIGSEGV
Spinning.  Please run 'gdb gst-launch-1.0 1280' to continue debugging, Ctrl=
-C
to quit, or Ctrl-\ to dump core.

# gdb gst-launch-1.0 1280
(gdb) bt
#0  0x00007fa2e8de1667 in poll () from /usr/lib/libc.so.6
#1  0x00007fa2e8b1aa80 in ?? () from /usr/lib/libglib-2.0.so.0
#2  0x00007fa2e8b1ba63 in g_main_loop_run () from /usr/lib/libglib-2.0.so.0
#3  0x00007fa2e8c73f52 in gst_bus_poll () from /usr/lib/libgstreamer-1.0.so=
.0
#4  0x0000563693c9f974 in ?? ()
#5  0x0000563693c9e85c in ?? ()
#6  0x00007fa2e8d16ee3 in __libc_start_main () from /usr/lib/libc.so.6
#7  0x0000563693c9ed0e in _start ()

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15640753421.24c6.26365
Date: Thu, 25 Jul 2019 17:22:22 +0000
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
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213">bug 11121=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
liewkj&#64;yahoo.com" title=3D"KJ Liew &lt;liewkj&#64;yahoo.com&gt;"> <span=
 class=3D"fn">KJ Liew</span></a>
</span></b>
        <pre>(In reply to LoneVVolf from <a href=3D"show_bug.cgi?id=3D11121=
3#c1">comment #1</a>)
<span class=3D"quote">&gt; Problem started with mesa 19.1.x and is also pre=
sent in git master</span >

I am not quite sure if this started with mesa 19.1.x. On GT730 I downgraded
mesa=20
back to 19.0.6 and gstreamer is still broken. The vainfo/vdpauinfo SIGSEGV
started with mesa 19.1.x. But that was just the simplest VA-API sanity check
and I found that h264 video decoding remains broken.

$ pacman -Qs mesa | grep ^[a-z]
local/glu 9.0.0-5
local/libva-mesa-driver 19.0.6-1
local/mesa 19.0.6-1
local/mesa-demos 8.4.0-1
local/mesa-vdpau 19.0.6-1

$ gst-launch-1.0 playbin uri=3Dfile:///path/to/MP4=20
Setting pipeline to PAUSED ...
Pipeline is PREROLLING ...
Got context from element 'vaapipostproc0': gst.gl.GLDisplay=3Dcontext,
gst.gl.GLDisplay=3D(GstGLDisplay)&quot;\(GstGLDisplayWayland\)\ gldisplaywa=
yland0&quot;;
Got context from element 'vaapipostproc0': gst.vaapi.Display=3Dcontext,
gst.vaapi.Display=3D(GstVaapiDisplay)&quot;\(GstVaapiDisplayEGL\)\ vaapidis=
playegl0&quot;;
Caught SIGSEGV
Spinning.  Please run 'gdb gst-launch-1.0 1280' to continue debugging, Ctrl=
-C
to quit, or Ctrl-\ to dump core.

# gdb gst-launch-1.0 1280
(gdb) bt
#0  0x00007fa2e8de1667 in poll () from /usr/lib/libc.so.6
#1  0x00007fa2e8b1aa80 in ?? () from /usr/lib/libglib-2.0.so.0
#2  0x00007fa2e8b1ba63 in g_main_loop_run () from /usr/lib/libglib-2.0.so.0
#3  0x00007fa2e8c73f52 in gst_bus_poll () from /usr/lib/libgstreamer-1.0.so=
.0
#4  0x0000563693c9f974 in ?? ()
#5  0x0000563693c9e85c in ?? ()
#6  0x00007fa2e8d16ee3 in __libc_start_main () from /usr/lib/libc.so.6
#7  0x0000563693c9ed0e in _start ()</pre>
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

--15640753421.24c6.26365--

--===============0104756998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0104756998==--
