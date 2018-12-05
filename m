From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98386] [NVE7] bus: MMIO write of FAULT at [ IBUS ],
 Pointer to {TDMS, flat panel} table invalid
Date: Wed, 05 Dec 2018 15:35:00 +0000
Message-ID: <bug-98386-8800-CihFiaypDo@http.bugs.freedesktop.org/>
References: <bug-98386-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0890977144=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98386-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0890977144==
Content-Type: multipart/alternative; boundary="15440241002.5667B5cBc.18519"
Content-Transfer-Encoding: 7bit


--15440241002.5667B5cBc.18519
Date: Wed, 5 Dec 2018 15:35:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

--- Comment #24 from Bruno Pagani <bruno.n.pagani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Cameron from comment #23)
> I just started getting these FAULTS
> Running openSUSE Tumbelweed
> kernel 4.19.5-1-default

Those are not the ones you should have reported here (this bug is about 418=
8ac
and 6013d4); the one you have that matches this is the one you=E2=80=99ve p=
osted on
https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c21

> Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: bus: MMIO read of
> 00000000 FAULT at 022554 [ IBUS ]

This time, this is actually https://bugs.freedesktop.org/show_bug.cgi?id=3D=
100423

> Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00.0: bus: MMIO read of
> 00000000 FAULT at 10ac08 [ IBUS ]

This is https://bugs.freedesktop.org/show_bug.cgi?id=3D104835

> Should I try passing the nouveau.runpm=3D0 to see if that helps?

No, those errors are not related to PM AFAIK.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15440241002.5667B5cBc.18519
Date: Wed, 5 Dec 2018 15:35:00 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386#c24">Commen=
t # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.n.pagani&#64;gmail.com" title=3D"Bruno Pagani &lt;bruno.n.pagani&#64;=
gmail.com&gt;"> <span class=3D"fn">Bruno Pagani</span></a>
</span></b>
        <pre>(In reply to Cameron from <a href=3D"show_bug.cgi?id=3D98386#c=
23">comment #23</a>)
<span class=3D"quote">&gt; I just started getting these FAULTS
&gt; Running openSUSE Tumbelweed
&gt; kernel 4.19.5-1-default</span >

Those are not the ones you should have reported here (this bug is about 418=
8ac
and 6013d4); the one you have that matches this is the one you=E2=80=99ve p=
osted on
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"show_bug.cgi?id=3D100423#c21">https://bugs.freedesktop.org/show_=
bug.cgi?id=3D100423#c21</a>

<span class=3D"quote">&gt; Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00=
.0: bus: MMIO read of
&gt; 00000000 FAULT at 022554 [ IBUS ]</span >

This time, this is actually <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"show_bug.cgi?id=3D100423">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D100423</a>

<span class=3D"quote">&gt; Dec 05 07:35:28 flisk kernel: nouveau 0000:01:00=
.0: bus: MMIO read of
&gt; 00000000 FAULT at 10ac08 [ IBUS ]</span >

This is <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]"
   href=3D"show_bug.cgi?id=3D104835">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D104835</a>

<span class=3D"quote">&gt; Should I try passing the nouveau.runpm=3D0 to se=
e if that helps?</span >

No, those errors are not related to PM AFAIK.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15440241002.5667B5cBc.18519--

--===============0890977144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0890977144==--
