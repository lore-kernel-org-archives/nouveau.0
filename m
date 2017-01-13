From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92077] nouveau graphics freeze when using KDE Plasma
 5; PGR engine fault
Date: Fri, 13 Jan 2017 22:17:55 +0000
Message-ID: <bug-92077-8800-a5ZRRhEYsv@http.bugs.freedesktop.org/>
References: <bug-92077-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0189627135=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92077-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0189627135==
Content-Type: multipart/alternative; boundary="14843458752.a5A6D.15985";
 charset="UTF-8"


--14843458752.a5A6D.15985
Date: Fri, 13 Jan 2017 22:17:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D92077

--- Comment #30 from Andrey Mazo <ahippo-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #29)
> Can someone see whether sticking
>=20
> QSG_RENDER_LOOP=3Dbasic
>=20
> into /etc/environment helps anything?

I could try, but looks like it's used by default already:

$ QT_LOGGING_RULES=3D"qt.scenegraph.general=3Dtrue" plasmawindowed
org.kde.plasma.systemmonitor.net
qt.scenegraph.general: QSG: basic render loop
qt.scenegraph.general: texture atlas dimensions: 1024x512
qt.scenegraph.general: R/G/B/A Buffers:    8 8 8 8
qt.scenegraph.general: Depth Buffer:       24
qt.scenegraph.general: Stencil Buffer:     8
qt.scenegraph.general: Samples:            -1
qt.scenegraph.general: GL_VENDOR:          nouveau
qt.scenegraph.general: GL_RENDERER:        Gallium 0.4 on NVD9
qt.scenegraph.general: GL_VERSION:         3.0 Mesa 12.0.1
...


I don't know for sure, which one was used when I reported the problem
originally (comment 17) or when captured an apitrace (comment 23).
But I would guess, that it was the same based on the following [1]:
"""
The non-threaded render loop is currently used by default ... Linux with Me=
sa
drivers.
"""

[1]
http://doc.qt.io/qt-5/qtquick-visualcanvas-scenegraph.html#non-threaded-ren=
der-loops-basic-and-windows

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14843458752.a5A6D.15985
Date: Fri, 13 Jan 2017 22:17:55 +0000
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
   title=3D"NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engi=
ne fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92077#c30">Commen=
t # 30</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau graphics freeze when using KDE Plasma 5; PGR engi=
ne fault"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92077">bug 92077<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ahippo&#64;yandex.ru" title=3D"Andrey Mazo &lt;ahippo&#64;yandex.ru&gt;"> <=
span class=3D"fn">Andrey Mazo</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D920=
77#c29">comment #29</a>)
<span class=3D"quote">&gt; Can someone see whether sticking
&gt;=20
&gt; QSG_RENDER_LOOP=3Dbasic
&gt;=20
&gt; into /etc/environment helps anything?</span >

I could try, but looks like it's used by default already:

$ QT_LOGGING_RULES=3D&quot;qt.scenegraph.general=3Dtrue&quot; plasmawindowed
org.kde.plasma.systemmonitor.net
qt.scenegraph.general: QSG: basic render loop
qt.scenegraph.general: texture atlas dimensions: 1024x512
qt.scenegraph.general: R/G/B/A Buffers:    8 8 8 8
qt.scenegraph.general: Depth Buffer:       24
qt.scenegraph.general: Stencil Buffer:     8
qt.scenegraph.general: Samples:            -1
qt.scenegraph.general: GL_VENDOR:          nouveau
qt.scenegraph.general: GL_RENDERER:        Gallium 0.4 on NVD9
qt.scenegraph.general: GL_VERSION:         3.0 Mesa 12.0.1
...


I don't know for sure, which one was used when I reported the problem
originally (<a href=3D"show_bug.cgi?id=3D92077#c17">comment 17</a>) or when=
 captured an apitrace (<a href=3D"show_bug.cgi?id=3D92077#c23">comment 23</=
a>).
But I would guess, that it was the same based on the following [1]:
&quot;&quot;&quot;
The non-threaded render loop is currently used by default ... Linux with Me=
sa
drivers.
&quot;&quot;&quot;

[1]
<a href=3D"http://doc.qt.io/qt-5/qtquick-visualcanvas-scenegraph.html#non-t=
hreaded-render-loops-basic-and-windows">http://doc.qt.io/qt-5/qtquick-visua=
lcanvas-scenegraph.html#non-threaded-render-loops-basic-and-windows</a></pr=
e>
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

--14843458752.a5A6D.15985--

--===============0189627135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0189627135==--
