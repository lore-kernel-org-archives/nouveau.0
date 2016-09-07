From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97620] [REGRESSION] KMS having issues after kernel
 upgrade (4.5.1-1 to 4.6.4-1)
Date: Wed, 07 Sep 2016 04:20:41 +0000
Message-ID: <bug-97620-8800-yjVrQaocj7@http.bugs.freedesktop.org/>
References: <bug-97620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1664083860=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1664083860==
Content-Type: multipart/alternative; boundary="14732220412.4fBB.30114";
 charset="UTF-8"


--14732220412.4fBB.30114
Date: Wed, 7 Sep 2016 04:20:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97620

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Hrmph. Well it looks like your GPU just goes nuts.

[    9.933619] nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at
13b154 [ IBUS ]
[    9.936957] nouveau 0000:01:00.0: bus: MMIO write of 00000000 FAULT at
61019c [ IBUS ]

followed by a ton more 610xxx errors. 610xxx is PDISPLAY stuff, but 13b154 =
is
in PXBAR.GPC_*. I also can't find any way that we'd be writing to that
register, at least nothing too direct. Something we do greatly upsets the c=
hip
though.

I looked through the nouveau changes between 4.5 and 4.6, and while there w=
as a
ton of stuff, nothing jumps out at me.

Can you do a git bisect on the kernel between v4.5 and v4.6 (you can restri=
ct
it to drivers/gpu/drm/nouveau) to figure out which change killed it?

Separately, you could see if it magically got fixed in v4.7 or v4.8-rcN.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14732220412.4fBB.30114
Date: Wed, 7 Sep 2016 04:20:41 +0000
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
   title=3D"NEW - [REGRESSION] KMS having issues after kernel upgrade (4.5.=
1-1 to 4.6.4-1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION] KMS having issues after kernel upgrade (4.5.=
1-1 to 4.6.4-1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620">bug 97620<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Hrmph. Well it looks like your GPU just goes nuts.

[    9.933619] nouveau 0000:01:00.0: bus: MMIO write of 00000002 FAULT at
13b154 [ IBUS ]
[    9.936957] nouveau 0000:01:00.0: bus: MMIO write of 00000000 FAULT at
61019c [ IBUS ]

followed by a ton more 610xxx errors. 610xxx is PDISPLAY stuff, but 13b154 =
is
in PXBAR.GPC_*. I also can't find any way that we'd be writing to that
register, at least nothing too direct. Something we do greatly upsets the c=
hip
though.

I looked through the nouveau changes between 4.5 and 4.6, and while there w=
as a
ton of stuff, nothing jumps out at me.

Can you do a git bisect on the kernel between v4.5 and v4.6 (you can restri=
ct
it to drivers/gpu/drm/nouveau) to figure out which change killed it?

Separately, you could see if it magically got fixed in v4.7 or v4.8-rcN.</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14732220412.4fBB.30114--

--===============1664083860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1664083860==--
