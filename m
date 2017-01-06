From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98980] GTX 980 (GM204) displays only a black screen.
Date: Fri, 06 Jan 2017 16:32:20 +0000
Message-ID: <bug-98980-8800-iFQtWTv5mM@http.bugs.freedesktop.org/>
References: <bug-98980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1917494722=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1917494722==
Content-Type: multipart/alternative; boundary="14837203400.eBf04255.20319";
 charset="UTF-8"


--14837203400.eBf04255.20319
Date: Fri, 6 Jan 2017 16:32:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98980

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Kernel 4.4 did not have any acceleration support for GM20x, that support was
added in Kernel 4.6, in the presence of the nvidia-supplied firmware.

Nothing in your original logs seems wrong to me. Perhaps you never configur=
ed
offloading properly? (Sometimes the desktop manager will do it for you, dep=
ends
on ... the desktop manager, version, and, I'm sure, its configuration.)

See https://nouveau.freedesktop.org/wiki/Optimus/ specifically the bit about
"using outputs on discrete gpu".

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14837203400.eBf04255.20319
Date: Fri, 6 Jan 2017 16:32:20 +0000
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
   title=3D"NEW - GTX 980 (GM204) displays only a black screen."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98980#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GTX 980 (GM204) displays only a black screen."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98980">bug 98980<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Kernel 4.4 did not have any acceleration support for GM20x, th=
at support was
added in Kernel 4.6, in the presence of the nvidia-supplied firmware.

Nothing in your original logs seems wrong to me. Perhaps you never configur=
ed
offloading properly? (Sometimes the desktop manager will do it for you, dep=
ends
on ... the desktop manager, version, and, I'm sure, its configuration.)

See <a href=3D"https://nouveau.freedesktop.org/wiki/Optimus/">https://nouve=
au.freedesktop.org/wiki/Optimus/</a> specifically the bit about
&quot;using outputs on discrete gpu&quot;.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14837203400.eBf04255.20319--

--===============1917494722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1917494722==--
