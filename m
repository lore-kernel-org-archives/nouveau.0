From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103946] [nouveau] Slowish and rough graphical
 interface with GTX 1060
Date: Tue, 28 Nov 2017 16:08:20 +0000
Message-ID: <bug-103946-8800-8C35hNeHIx@http.bugs.freedesktop.org/>
References: <bug-103946-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0500088203=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103946-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0500088203==
Content-Type: multipart/alternative; boundary="15118853000.8FdFE56.14957";
 charset="UTF-8"


--15118853000.8FdFE56.14957
Date: Tue, 28 Nov 2017 16:08:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103946

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Issue is far before anything called DRI comes to play. Some of the HW units
dealing with acceleration fail to init, hence everything is rendered by the=
 CPU
and slow.

Karol has posted a workaround [1] which seems mildly related. You can try i=
t by
rebuilding the kernel with the patch applied.=20


[1] https://patchwork.freedesktop.org/patch/190668/

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15118853000.8FdFE56.14957
Date: Tue, 28 Nov 2017 16:08:20 +0000
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
   title=3D"NEW - [nouveau] Slowish and rough graphical interface with GTX =
1060"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103946#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] Slowish and rough graphical interface with GTX =
1060"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103946">bug 10394=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
emil.l.velikov&#64;gmail.com" title=3D"Emil Velikov &lt;emil.l.velikov&#64;=
gmail.com&gt;"> <span class=3D"fn">Emil Velikov</span></a>
</span></b>
        <pre>Issue is far before anything called DRI comes to play. Some of=
 the HW units
dealing with acceleration fail to init, hence everything is rendered by the=
 CPU
and slow.

Karol has posted a workaround [1] which seems mildly related. You can try i=
t by
rebuilding the kernel with the patch applied.=20


[1] <a href=3D"https://patchwork.freedesktop.org/patch/190668/">https://pat=
chwork.freedesktop.org/patch/190668/</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15118853000.8FdFE56.14957--

--===============0500088203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0500088203==--
