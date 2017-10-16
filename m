From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103284] Unable to handle kernel NULL pointer
 dereference on 4.13.0-1-sparc64-smp
Date: Mon, 16 Oct 2017 22:30:20 +0000
Message-ID: <bug-103284-8800-RUY17pCFwr@http.bugs.freedesktop.org/>
References: <bug-103284-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1168577426=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103284-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1168577426==
Content-Type: multipart/alternative; boundary="15081930202.D94bB13.21178";
 charset="UTF-8"


--15081930202.D94bB13.21178
Date: Mon, 16 Oct 2017 22:30:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103284

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so looks like it very successfully creates a GT214_DISP object, and then
proceeds to call nv50_display_create. This then does not trigger *any* furt=
her
traces, and errors out. It errors out before the dmac is initialized, and I
think something in the list head thing fails.

Now, as I recall, SPARC has 8k pages. You could try bumping some of those 4=
096
values up to 8192 and see if that magically makes it work, at least a little
(like the nouveau_bo_new).

If you're sufficiently interested, you could add a lot more prints througho=
ut
that file to see exactly what fails, and then try to resolve it.

It might be an uphill battle though - a bunch of stuff is tied to 4K pages,=
 I
think.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15081930202.D94bB13.21178
Date: Mon, 16 Oct 2017 22:30:20 +0000
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
   title=3D"NEW - Unable to handle kernel NULL pointer dereference on 4.13.=
0-1-sparc64-smp"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103284#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unable to handle kernel NULL pointer dereference on 4.13.=
0-1-sparc64-smp"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103284">bug 10328=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so looks like it very successfully creates a GT214_DISP ob=
ject, and then
proceeds to call nv50_display_create. This then does not trigger *any* furt=
her
traces, and errors out. It errors out before the dmac is initialized, and I
think something in the list head thing fails.

Now, as I recall, SPARC has 8k pages. You could try bumping some of those 4=
096
values up to 8192 and see if that magically makes it work, at least a little
(like the nouveau_bo_new).

If you're sufficiently interested, you could add a lot more prints througho=
ut
that file to see exactly what fails, and then try to resolve it.

It might be an uphill battle though - a bunch of stuff is tied to 4K pages,=
 I
think.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15081930202.D94bB13.21178--

--===============1168577426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1168577426==--
