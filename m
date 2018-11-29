From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108651] Screen flickering when using compositor with
 OpenGL backend
Date: Thu, 29 Nov 2018 10:51:24 +0000
Message-ID: <bug-108651-8800-61SayH694B@http.bugs.freedesktop.org/>
References: <bug-108651-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1463047179=="
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


--===============1463047179==
Content-Type: multipart/alternative; boundary="15434886830.7346d.2573"
Content-Transfer-Encoding: 7bit


--15434886830.7346d.2573
Date: Thu, 29 Nov 2018 10:51:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108651

--- Comment #7 from Yuxuan Shui <yshuiv7-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
So the problem is actually a incompatibility between using xcb event loop a=
nd
mesa DRI2.

It is hacked around in compton.

More details in bug 108705

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15434886830.7346d.2573
Date: Thu, 29 Nov 2018 10:51:23 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108651#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering when using compositor with OpenGL backe=
nd"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108651">bug 10865=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
yshuiv7&#64;gmail.com" title=3D"Yuxuan Shui &lt;yshuiv7&#64;gmail.com&gt;">=
 <span class=3D"fn">Yuxuan Shui</span></a>
</span></b>
        <pre>So the problem is actually a incompatibility between using xcb=
 event loop and
mesa DRI2.

It is hacked around in compton.

More details in <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GLX with DRI2 doesn't work properly when xcb is owning th=
e event queue"
   href=3D"show_bug.cgi?id=3D108705">bug 108705</a></pre>
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

--15434886830.7346d.2573--

--===============1463047179==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1463047179==--
