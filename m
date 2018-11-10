From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108651] Screen flickering when using compositor with
 OpenGL backend
Date: Sat, 10 Nov 2018 18:44:17 +0000
Message-ID: <bug-108651-8800-AJ3yAxNneD@http.bugs.freedesktop.org/>
References: <bug-108651-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1969573238=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108651-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1969573238==
Content-Type: multipart/alternative; boundary="15418754570.Dec4DB.23135"
Content-Transfer-Encoding: 7bit


--15418754570.Dec4DB.23135
Date: Sat, 10 Nov 2018 18:44:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108651

--- Comment #5 from John Lindgren <john-ytntcHzVV1kcWVvVuXF20w@public.gmane.org> ---
This probably isn't specific to nouveau.  I am using Intel graphics
(modesetting driver) and I was also bitten by screen flickering in compton
after the switch to XCB (commits 43f3744fea07 and 7af815a0aaaf).

It is specific to DRI2.  With DRI3 or software rendering
(LIBGL_ALWAYS_SOFTWARE=3D1), the flickering goes away.

Looking at mesa source (src/glx/dri2.c), DRI2 seems to be incompatible with=
 xcb
event processing due to usage of XESetWireToEvent()/XESetEventToWire(), whi=
ch
hook into the traditional Xlib event processing.  Without Xlib in the loop,
DRI2 misses its Invalidate events and the result is that glXSwapBuffers()
doesn't work as expected.  (Take a look at src/glx/dri2_glx.c -
dri2XcbSwapBuffers() contains an explicit XSync() call to wait for Invalida=
te
events, which it never gets.)

One workaround I found is to change the following line in src/glx/dri2_glx.=
c:

   pdp->invalidateAvailable =3D (pdp->driMinor >=3D 3);

To this:

   pdp->invalidateAvailable =3D 0;

This causes mesa to think it's using an older X Server that doesn't send
Invalidate events and use some kind of internal fallback.  It's enough to m=
ake
the flickering go away, but I don't know what other side effects it has.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15418754570.Dec4DB.23135
Date: Sat, 10 Nov 2018 18:44:17 +0000
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
   title=3D"NEW - Screen flickering when using compositor with OpenGL backe=
nd"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108651#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering when using compositor with OpenGL backe=
nd"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108651">bug 10865=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
john&#64;jlindgren.net" title=3D"John Lindgren &lt;john&#64;jlindgren.net&g=
t;"> <span class=3D"fn">John Lindgren</span></a>
</span></b>
        <pre>This probably isn't specific to nouveau.  I am using Intel gra=
phics
(modesetting driver) and I was also bitten by screen flickering in compton
after the switch to XCB (commits 43f3744fea07 and 7af815a0aaaf).

It is specific to DRI2.  With DRI3 or software rendering
(LIBGL_ALWAYS_SOFTWARE=3D1), the flickering goes away.

Looking at mesa source (src/glx/dri2.c), DRI2 seems to be incompatible with=
 xcb
event processing due to usage of XESetWireToEvent()/XESetEventToWire(), whi=
ch
hook into the traditional Xlib event processing.  Without Xlib in the loop,
DRI2 misses its Invalidate events and the result is that glXSwapBuffers()
doesn't work as expected.  (Take a look at src/glx/dri2_glx.c -
dri2XcbSwapBuffers() contains an explicit XSync() call to wait for Invalida=
te
events, which it never gets.)

One workaround I found is to change the following line in src/glx/dri2_glx.=
c:

   pdp-&gt;invalidateAvailable =3D (pdp-&gt;driMinor &gt;=3D 3);

To this:

   pdp-&gt;invalidateAvailable =3D 0;

This causes mesa to think it's using an older X Server that doesn't send
Invalidate events and use some kind of internal fallback.  It's enough to m=
ake
the flickering go away, but I don't know what other side effects it has.</p=
re>
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

--15418754570.Dec4DB.23135--

--===============1969573238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1969573238==--
