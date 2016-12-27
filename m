From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93828] Xorg hangs randomly with nouveau driver
Date: Tue, 27 Dec 2016 02:29:50 +0000
Message-ID: <bug-93828-8800-i5BHctsEmU@http.bugs.freedesktop.org/>
References: <bug-93828-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1101910501=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93828-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1101910501==
Content-Type: multipart/alternative; boundary="14828057901.51CDEA.24800";
 charset="UTF-8"


--14828057901.51CDEA.24800
Date: Tue, 27 Dec 2016 02:29:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93828

--- Comment #16 from derrierdo-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Hi Guys,

I've got the same  kind of issue.

Hang when starting up some software.
01:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 210] (=
rev
a2)  (an prety old card).
nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 12 [gwenview[13360]] subc 3 mt=
hd
01a8 data beef0201
...
(only X/keyboard hang... ssh still working).


Cannot go to console... console didn't work with nouveau without fb.
(I had no more issue after recompile xscreensaver/flux).

Dominique

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14828057901.51CDEA.24800
Date: Tue, 27 Dec 2016 02:29:50 +0000
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
   title=3D"NEW - Xorg hangs randomly with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93828#c16">Commen=
t # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg hangs randomly with nouveau driver"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93828">bug 93828<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
derrierdo&#64;gmail.com" title=3D"derrierdo&#64;gmail.com">derrierdo&#64;gm=
ail.com</a>
</span></b>
        <pre>Hi Guys,

I've got the same  kind of issue.

Hang when starting up some software.
01:00.0 VGA compatible controller: NVIDIA Corporation GT218 [GeForce 210] (=
rev
a2)  (an prety old card).
nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 12 [gwenview[13360]] subc 3 mt=
hd
01a8 data beef0201
...
(only X/keyboard hang... ssh still working).


Cannot go to console... console didn't work with nouveau without fb.
(I had no more issue after recompile xscreensaver/flux).

Dominique</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14828057901.51CDEA.24800--

--===============1101910501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1101910501==--
