From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
 ]
Date: Tue, 01 Jan 2019 13:20:23 +0000
Message-ID: <bug-100423-8800-gW3wQpKOhY@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0130539849=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100423-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0130539849==
Content-Type: multipart/alternative; boundary="15463488230.ab38.13315"
Content-Transfer-Encoding: 7bit


--15463488230.ab38.13315
Date: Tue, 1 Jan 2019 13:20:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

--- Comment #27 from Bruno Pagani <bruno.n.pagani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Jan from comment #26)
> I have a similar issue with my NP900X5N laptop with Kaby Lake and 940MX
> card, on 4.20.0 and Kali Linux.
>=20
> [   35.984104] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at =
6013d4 [ IBUS ]

This is included in https://bugs.freedesktop.org/show_bug.cgi?id=3D98386. A=
nd
apparently also https://bugs.freedesktop.org/show_bug.cgi?id=3D108980, which
seems recently fixed.

> [   35.997510] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at =
10ac08 [ IBUS ]

This one is https://bugs.freedesktop.org/show_bug.cgi?id=3D104835.

> [   37.551790] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
> 619444 [ IBUS ]

This is like https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c19, not=
 sure
if there is already an issue for it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15463488230.ab38.13315
Date: Tue, 1 Jan 2019 13:20:23 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c27">Comme=
nt # 27</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.n.pagani&#64;gmail.com" title=3D"Bruno Pagani &lt;bruno.n.pagani&#64;=
gmail.com&gt;"> <span class=3D"fn">Bruno Pagani</span></a>
</span></b>
        <pre>(In reply to Jan from <a href=3D"show_bug.cgi?id=3D100423#c26"=
>comment #26</a>)
<span class=3D"quote">&gt; I have a similar issue with my NP900X5N laptop w=
ith Kaby Lake and 940MX
&gt; card, on 4.20.0 and Kali Linux.
&gt;=20
&gt; [   35.984104] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT =
at 6013d4 [ IBUS ]</span >

This is included in <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"show_bug.cgi?id=3D98386">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D98386</a>. And
apparently also <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GF117: MMIO write of 0000001f FAULT at 6013d4 [ IBUS ]"
   href=3D"show_bug.cgi?id=3D108980">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D108980</a>, which
seems recently fixed.

<span class=3D"quote">&gt; [   35.997510] nouveau 0000:01:00.0: bus: MMIO r=
ead of 00000000 FAULT at 10ac08 [ IBUS ]</span >

This one is <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]"
   href=3D"show_bug.cgi?id=3D104835">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D104835</a>.

<span class=3D"quote">&gt; [   37.551790] nouveau 0000:01:00.0: bus: MMIO r=
ead of 00000000 FAULT at
&gt; 619444 [ IBUS ]</span >

This is like <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"show_bug.cgi?id=3D100423#c19">https://bugs.freedesktop.org/show_=
bug.cgi?id=3D100423#c19</a>, not sure
if there is already an issue for it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15463488230.ab38.13315--

--===============0130539849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0130539849==--
