From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98030] Stuttering video playback in totem after
 update to 1.19-rc1
Date: Thu, 13 Oct 2016 21:39:49 +0000
Message-ID: <bug-98030-8800-CD6Kkfx196@http.bugs.freedesktop.org/>
References: <bug-98030-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1799453055=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98030-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1799453055==
Content-Type: multipart/alternative; boundary="14763947891.559e348.11715";
 charset="UTF-8"


--14763947891.559e348.11715
Date: Thu, 13 Oct 2016 21:39:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98030

--- Comment #3 from Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> ---
Ok, i think this is related: On 1.19-rc1 (current git master) under DRI2,
windowed OpenGL apps like glxgears get stuck unless i press keys on the
keyboard or move the mouse to create input events. KDE Plasma 5, being Open=
GL
driven afaik, has the same problem.

If otoh i run applications which use fullscreen kms page-flipped windows, e=
.g.,
Gnome shell, or regular fullscreen GL apps, they work fine under DRI2. If i=
 use
DRI3/Present everything works fine. This both with a server built to use the
new input-threads and also built without input-threads. This happens at lea=
st
on nouveau-ddx and ati/amdgpu-ddx.

I just retested glxgears, my own app and totem under gdb, and without me
providing mouse/keyboard input, they all get stuck in the
DRI2GetBuffersWithFormat request to the X-Server, waiting for a reply. That
gets called when Mesa needs new renderbuffers for a new frame after a
swapbuffers request, e.g., when glxgears or totem calls glClear().

So far so bad. So something gets stuck in the servers dispatch loop, but
"external" input events from the kernel (evdev, kms-pageflip completion
events?) gets it unstuck?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14763947891.559e348.11715
Date: Thu, 13 Oct 2016 21:39:49 +0000
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
   title=3D"NEW - Stuttering video playback in totem after update to 1.19-r=
c1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98030#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Stuttering video playback in totem after update to 1.19-r=
c1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98030">bug 98030<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mario.kleiner&#64;tuebingen.mpg.de" title=3D"Mario Kleiner &lt;mario.kleine=
r&#64;tuebingen.mpg.de&gt;"> <span class=3D"fn">Mario Kleiner</span></a>
</span></b>
        <pre>Ok, i think this is related: On 1.19-rc1 (current git master) =
under DRI2,
windowed OpenGL apps like glxgears get stuck unless i press keys on the
keyboard or move the mouse to create input events. KDE Plasma 5, being Open=
GL
driven afaik, has the same problem.

If otoh i run applications which use fullscreen kms page-flipped windows, e=
.g.,
Gnome shell, or regular fullscreen GL apps, they work fine under DRI2. If i=
 use
DRI3/Present everything works fine. This both with a server built to use the
new input-threads and also built without input-threads. This happens at lea=
st
on nouveau-ddx and ati/amdgpu-ddx.

I just retested glxgears, my own app and totem under gdb, and without me
providing mouse/keyboard input, they all get stuck in the
DRI2GetBuffersWithFormat request to the X-Server, waiting for a reply. That
gets called when Mesa needs new renderbuffers for a new frame after a
swapbuffers request, e.g., when glxgears or totem calls glClear().

So far so bad. So something gets stuck in the servers dispatch loop, but
&quot;external&quot; input events from the kernel (evdev, kms-pageflip comp=
letion
events?) gets it unstuck?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14763947891.559e348.11715--

--===============1799453055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1799453055==--
