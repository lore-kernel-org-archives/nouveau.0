From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102349] nv4x crashing with plasmashell - gdb log
	included
Date: Thu, 24 Aug 2017 16:00:04 +0000
Message-ID: <bug-102349-8800-OfsqvvmrcG@http.bugs.freedesktop.org/>
References: <bug-102349-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2050954079=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102349-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2050954079==
Content-Type: multipart/alternative; boundary="15035904030.79Aaa.17070";
 charset="UTF-8"


--15035904030.79Aaa.17070
Date: Thu, 24 Aug 2017 16:00:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102349

--- Comment #6 from caguduzexi-ybJNiJ/GDrisTnJN9+BGXg@public.gmane.org ---
The
" push->user_priv =3D &nv30->bufctx;

Somewhere towards the top of nv30_clear (before it calls nv30_state_validat=
e)"

patch worked. I got into the desktop screen.
In the desktop screen i have now again the known errors with colored rectan=
gles
beginning in one of the corners and stretching over the whole screen. Shoul=
d i
open for those a new bugreport? How can those be properly reported?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15035904030.79Aaa.17070
Date: Thu, 24 Aug 2017 16:00:03 +0000
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
   title=3D"NEW - nv4x crashing with plasmashell - gdb log included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102349#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x crashing with plasmashell - gdb log included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102349">bug 10234=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
caguduzexi&#64;go2vpn.net" title=3D"caguduzexi&#64;go2vpn.net">caguduzexi&#=
64;go2vpn.net</a>
</span></b>
        <pre>The
&quot; push-&gt;user_priv =3D &amp;nv30-&gt;bufctx;

Somewhere towards the top of nv30_clear (before it calls nv30_state_validat=
e)&quot;

patch worked. I got into the desktop screen.
In the desktop screen i have now again the known errors with colored rectan=
gles
beginning in one of the corners and stretching over the whole screen. Shoul=
d i
open for those a new bugreport? How can those be properly reported?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15035904030.79Aaa.17070--

--===============2050954079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2050954079==--
