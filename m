From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108500] Crash when creating a depth buffer on
 GeForce 320M
Date: Thu, 16 May 2019 18:31:30 +0000
Message-ID: <bug-108500-8800-lS3oGnU43j@http.bugs.freedesktop.org/>
References: <bug-108500-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0564990776=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108500-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0564990776==
Content-Type: multipart/alternative; boundary="15580314900.a5DdA0f5.31134"
Content-Transfer-Encoding: 7bit


--15580314900.a5DdA0f5.31134
Date: Thu, 16 May 2019 18:31:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108500

--- Comment #10 from Timo Wiren <timo.wiren-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Since Lubuntu 19.04 the crash has disappeared but I get broken depth testing
instead in all GL applications, including glxgears. My workaround (disabling
depth compression) still works.

Current kernel: 5.0.0-13-generic
Mesa: 19.0.2

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15580314900.a5DdA0f5.31134
Date: Thu, 16 May 2019 18:31:30 +0000
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
   title=3D"NEW - Crash when creating a depth buffer on GeForce 320M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108500#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash when creating a depth buffer on GeForce 320M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108500">bug 10850=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
timo.wiren&#64;gmail.com" title=3D"Timo Wiren &lt;timo.wiren&#64;gmail.com&=
gt;"> <span class=3D"fn">Timo Wiren</span></a>
</span></b>
        <pre>Since Lubuntu 19.04 the crash has disappeared but I get broken=
 depth testing
instead in all GL applications, including glxgears. My workaround (disabling
depth compression) still works.

Current kernel: 5.0.0-13-generic
Mesa: 19.0.2</pre>
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

--15580314900.a5DdA0f5.31134--

--===============0564990776==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0564990776==--
