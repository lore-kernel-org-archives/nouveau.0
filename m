From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102106] xorg crashes when running gscan2pdf
 (libgtk2-perl) test case
Date: Sun, 13 Aug 2017 21:55:33 +0000
Message-ID: <bug-102106-8800-snc7BoophK@http.bugs.freedesktop.org/>
References: <bug-102106-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0028124925=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102106-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0028124925==
Content-Type: multipart/alternative; boundary="15026613330.5870.8390";
 charset="UTF-8"


--15026613330.5870.8390
Date: Sun, 13 Aug 2017 21:55:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102106

--- Comment #10 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to jffry from comment #9)
> How do I start the machine and not start X? Do I just kill X with -9, bef=
ore
> starting it again. Isn't that what I had at the first attempt? If so, why
> could I not connect to it?

Sorry, I don't do distro support. Back in the bad old days, you could figure
out what happened by looking at inittab, and modify rc.M or whatever.

You can start on :1 instead of :0 if you want to keep the existing one runn=
ing,
just make sure to switch to that VT on the machine.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15026613330.5870.8390
Date: Sun, 13 Aug 2017 21:55:33 +0000
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
   title=3D"NEW - xorg crashes when running gscan2pdf (libgtk2-perl) test c=
ase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102106#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - xorg crashes when running gscan2pdf (libgtk2-perl) test c=
ase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102106">bug 10210=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to jffry from <a href=3D"show_bug.cgi?id=3D102106#c9=
">comment #9</a>)
<span class=3D"quote">&gt; How do I start the machine and not start X? Do I=
 just kill X with -9, before
&gt; starting it again. Isn't that what I had at the first attempt? If so, =
why
&gt; could I not connect to it?</span >

Sorry, I don't do distro support. Back in the bad old days, you could figure
out what happened by looking at inittab, and modify rc.M or whatever.

You can start on :1 instead of :0 if you want to keep the existing one runn=
ing,
just make sure to switch to that VT on the machine.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15026613330.5870.8390--

--===============0028124925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0028124925==--
