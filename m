From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97537] nvc0 occasionally crashes in glDrawArrays in
 a multi-threaded/multi-context app
Date: Thu, 01 Sep 2016 22:19:31 +0000
Message-ID: <bug-97537-8800-YqlV55EsSV@http.bugs.freedesktop.org/>
References: <bug-97537-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0209160552=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97537-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0209160552==
Content-Type: multipart/alternative; boundary="14727683701.a4F7bEcE.2004";
 charset="UTF-8"


--14727683701.a4F7bEcE.2004
Date: Thu, 1 Sep 2016 22:19:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97537

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to shinji.suzuki from comment #3)
> I managed to have glxinfo run with newly built libs through the use of
> LIBGL_DRIVERS_PATH and LD_LIBRARY_PATH env-vars. But once I copy them to =
the
> system dir (/usr/lib/x86_64_linux_gnu/{|mesa|dri}) and reboot then
> ibus-ui-gtk3 fails to load due to segfault. Since the libs also have an
> issue that glxinfo shows incorrect values for "Max core profile version" =
and
> "Max compat profile version", "OpenGL shading language version string", I
> guess I'd give Ubuntu 16.10 a try.

Just run the application in question with LD_LIBRARY_PATH=3D... (note - usi=
ng
LIBGL_DRIVERS_PATH is highly unadvisable unless you *really* know what you'=
re
doing. Just build with some prefix, install, and point LD_LIBRARY_PATH at
that.)

Anyways, if doing your own mesa build is beyond your powers that's fine. We=
 can
keep this open and I can assume it'll magically get fixed when I get around=
 to
finishing up those locking patches.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14727683701.a4F7bEcE.2004
Date: Thu, 1 Sep 2016 22:19:30 +0000
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
   title=3D"NEW - nvc0 occasionally crashes in glDrawArrays in a multi-thre=
aded/multi-context app"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97537#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nvc0 occasionally crashes in glDrawArrays in a multi-thre=
aded/multi-context app"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97537">bug 97537<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to shinji.suzuki from <a href=3D"show_bug.cgi?id=3D9=
7537#c3">comment #3</a>)
<span class=3D"quote">&gt; I managed to have glxinfo run with newly built l=
ibs through the use of
&gt; LIBGL_DRIVERS_PATH and LD_LIBRARY_PATH env-vars. But once I copy them =
to the
&gt; system dir (/usr/lib/x86_64_linux_gnu/{|mesa|dri}) and reboot then
&gt; ibus-ui-gtk3 fails to load due to segfault. Since the libs also have an
&gt; issue that glxinfo shows incorrect values for &quot;Max core profile v=
ersion&quot; and
&gt; &quot;Max compat profile version&quot;, &quot;OpenGL shading language =
version string&quot;, I
&gt; guess I'd give Ubuntu 16.10 a try.</span >

Just run the application in question with LD_LIBRARY_PATH=3D... (note - usi=
ng
LIBGL_DRIVERS_PATH is highly unadvisable unless you *really* know what you'=
re
doing. Just build with some prefix, install, and point LD_LIBRARY_PATH at
that.)

Anyways, if doing your own mesa build is beyond your powers that's fine. We=
 can
keep this open and I can assume it'll magically get fixed when I get around=
 to
finishing up those locking patches.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14727683701.a4F7bEcE.2004--

--===============0209160552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0209160552==--
