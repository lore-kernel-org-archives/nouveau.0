From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
 ]
Date: Mon, 29 Oct 2018 12:16:51 +0000
Message-ID: <bug-100423-8800-HtJdYCN6Wh@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1620488692=="
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


--===============1620488692==
Content-Type: multipart/alternative; boundary="15408154110.46136e58.31683"
Content-Transfer-Encoding: 7bit


--15408154110.46136e58.31683
Date: Mon, 29 Oct 2018 12:16:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

--- Comment #20 from Bruno Pagani <bruno.n.pagani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to boldingd from comment #19)
> I think I'm also seeing this with Fedora 29 Beta, I was also seeing errors
> with updated Fedora 28.

No, yours are different issues.

> [    1.729900] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
> 10ac08 [ IBUS ]

This is https://bugs.freedesktop.org/show_bug.cgi?id=3D104835

> [    8.044183] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
> 619444 [ IBUS ]
> [    9.126208] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
> 619444 [ IBUS ]

I haven=E2=80=99t found any reference for this one. You might open a new bu=
greport for
it.

> [    1.714622] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
> 6013d4 [ IBUS ]
> [   93.901280] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
> 6013d4 [ IBUS ]
> [  101.777394] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
> 6013d4 [ IBUS ]
> [  112.733004] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at
> 6013d4 [ IBUS ]

This one also appears (and is briefly discussed) in
https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15408154110.46136e58.31683
Date: Mon, 29 Oct 2018 12:16:51 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c20">Comme=
nt # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bruno.n.pagani&#64;gmail.com" title=3D"Bruno Pagani &lt;bruno.n.pagani&#64;=
gmail.com&gt;"> <span class=3D"fn">Bruno Pagani</span></a>
</span></b>
        <pre>(In reply to boldingd from <a href=3D"show_bug.cgi?id=3D100423=
#c19">comment #19</a>)
<span class=3D"quote">&gt; I think I'm also seeing this with Fedora 29 Beta=
, I was also seeing errors
&gt; with updated Fedora 28.</span >

No, yours are different issues.

<span class=3D"quote">&gt; [    1.729900] nouveau 0000:01:00.0: bus: MMIO r=
ead of 00000000 FAULT at
&gt; 10ac08 [ IBUS ]</span >

This is <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]"
   href=3D"show_bug.cgi?id=3D104835">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D104835</a>

<span class=3D"quote">&gt; [    8.044183] nouveau 0000:01:00.0: bus: MMIO r=
ead of 00000000 FAULT at
&gt; 619444 [ IBUS ]
&gt; [    9.126208] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT =
at
&gt; 619444 [ IBUS ]</span >

I haven=E2=80=99t found any reference for this one. You might open a new bu=
greport for
it.

<span class=3D"quote">&gt; [    1.714622] nouveau 0000:01:00.0: bus: MMIO r=
ead of 00000000 FAULT at
&gt; 6013d4 [ IBUS ]
&gt; [   93.901280] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT =
at
&gt; 6013d4 [ IBUS ]
&gt; [  101.777394] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT =
at
&gt; 6013d4 [ IBUS ]
&gt; [  112.733004] nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT =
at
&gt; 6013d4 [ IBUS ]</span >

This one also appears (and is briefly discussed) in
<a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
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

--15408154110.46136e58.31683--

--===============1620488692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1620488692==--
