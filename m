From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101220] xorg-server-1.19.3 crashes when trying to
 enable HDMI output
Date: Tue, 30 May 2017 01:38:31 +0000
Message-ID: <bug-101220-8800-gMsdrC0t4L@http.bugs.freedesktop.org/>
References: <bug-101220-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0117473603=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101220-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0117473603==
Content-Type: multipart/alternative; boundary="14961083110.dF4D.17051";
 charset="UTF-8"


--14961083110.dF4D.17051
Date: Tue, 30 May 2017 01:38:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101220

--- Comment #6 from Michel D=C3=A4nzer <michel-otUistvHUpPR7s880joybQ@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #5)
> I wonder if this is due to the fact that it's running in NoAccel mode.

Possibly, you might want something like

https://cgit.freedesktop.org/xorg/driver/xf86-video-ati/commit/?id=3Db19417=
e2fddf4df725951aea5ad5e9558338f59e

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14961083110.dF4D.17051
Date: Tue, 30 May 2017 01:38:31 +0000
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
   title=3D"NEW - xorg-server-1.19.3 crashes when trying to enable HDMI out=
put"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101220#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - xorg-server-1.19.3 crashes when trying to enable HDMI out=
put"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101220">bug 10122=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D101=
220#c5">comment #5</a>)
<span class=3D"quote">&gt; I wonder if this is due to the fact that it's ru=
nning in NoAccel mode.</span >

Possibly, you might want something like

<a href=3D"https://cgit.freedesktop.org/xorg/driver/xf86-video-ati/commit/?=
id=3Db19417e2fddf4df725951aea5ad5e9558338f59e">https://cgit.freedesktop.org=
/xorg/driver/xf86-video-ati/commit/?id=3Db19417e2fddf4df725951aea5ad5e95583=
38f59e</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14961083110.dF4D.17051--

--===============0117473603==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0117473603==--
