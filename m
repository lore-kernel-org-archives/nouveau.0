From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Mon, 27 Mar 2017 23:14:24 +0000
Message-ID: <bug-70354-8800-iGyqnZLipj@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0753665781=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0753665781==
Content-Type: multipart/alternative; boundary="14906564654.6A3E2C.28327";
 charset="UTF-8"


--14906564654.6A3E2C.28327
Date: Mon, 27 Mar 2017 23:14:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D70354

--- Comment #95 from Bruno Pagani <bruno.n.pagani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Bruno Pagani from comment #94)
> So, after 4.4 landed on Arch, finally got this working.
>=20
> Though, like previous poster, I have some messages in dmesg:
>=20
> [  336.351782] nouveau 0000:02:00.0: bus: MMIO write of 00000002 FAULT at
> 4188ac [ IBUS ]
> [  336.410877] nouveau 0000:02:00.0: DRM: Pointer to TMDS table invalid
> [  336.410880] nouveau 0000:02:00.0: DRM: Pointer to flat panel table inv=
alid
>=20
> Should I open a new bug for those?

Just in case someone was passing by this thread, the follow-up has been her=
e:
https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14906564654.6A3E2C.28327
Date: Mon, 27 Mar 2017 23:14:25 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NVE6,NVE7] HUB_INIT timeout on graph init, bl=
ob fw doesn't help"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70354#c95">Commen=
t # 95</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [NVE6,NVE7] HUB_INIT timeout on graph init, bl=
ob fw doesn't help"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70354">bug 70354<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.n.pagani&#64;gmail.com" title=3D"Bruno Pagani &lt;bruno.n.pagani&#64;=
gmail.com&gt;"> <span class=3D"fn">Bruno Pagani</span></a>
</span></b>
        <pre>(In reply to Bruno Pagani from <a href=3D"show_bug.cgi?id=3D70=
354#c94">comment #94</a>)
<span class=3D"quote">&gt; So, after 4.4 landed on Arch, finally got this w=
orking.
&gt;=20
&gt; Though, like previous poster, I have some messages in dmesg:
&gt;=20
&gt; [  336.351782] nouveau 0000:02:00.0: bus: MMIO write of 00000002 FAULT=
 at
&gt; 4188ac [ IBUS ]
&gt; [  336.410877] nouveau 0000:02:00.0: DRM: Pointer to TMDS table invalid
&gt; [  336.410880] nouveau 0000:02:00.0: DRM: Pointer to flat panel table =
invalid
&gt;=20
&gt; Should I open a new bug for those?</span >

Just in case someone was passing by this thread, the follow-up has been her=
e:
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer to {=
TDMS,flat panel} table invalid"
   href=3D"show_bug.cgi?id=3D98386">https://bugs.freedesktop.org/show_bug.c=
gi?id=3D98386</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14906564654.6A3E2C.28327--

--===============0753665781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0753665781==--
