From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105173] [MCP79][Regression] Unhandled NULL pointer
 dereference in nvkm_object_unmap since kernel 4.15
Date: Thu, 01 Mar 2018 23:04:58 +0000
Message-ID: <bug-105173-8800-tATaasPLbJ@http.bugs.freedesktop.org/>
References: <bug-105173-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0031379634=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105173-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0031379634==
Content-Type: multipart/alternative; boundary="15199454982.CAF0.26337"
Content-Transfer-Encoding: 7bit


--15199454982.CAF0.26337
Date: Thu, 1 Mar 2018 23:04:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105173

--- Comment #14 from Nick Lee <nvlbox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Pierre Moreau from comment #13)
> Created attachment 137730 [details] [review]
> Proposed patch

> Could you please try the attached patch (from
> https://github.com/skeggsb/nouveau/pull/1)? It fixes the errors on my end=
 at
> least.

Yes, it works! I applied the patch to kernel-4.16.0-0.rc3.git2.1. After
launching supertuxkart i see only:

[   22.471837] fuse init (API version 7.26)
[   52.346467] nouveau 0000:03:00.0: imem: OOM: 00100000 00001000 -28
[   52.346516] nouveau 0000:03:00.0: imem: OOM: 00100000 00001000 -28
[  108.372556] perf: interrupt took too long (2530 > 2500), lowering
kernel.perf_event_max_sample_rate to 79000


No artefacts.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15199454982.CAF0.26337
Date: Thu, 1 Mar 2018 23:04:58 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173">bug 10517=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
nvlbox&#64;gmail.com" title=3D"Nick Lee &lt;nvlbox&#64;gmail.com&gt;"> <spa=
n class=3D"fn">Nick Lee</span></a>
</span></b>
        <pre>(In reply to Pierre Moreau from <a href=3D"show_bug.cgi?id=3D1=
05173#c13">comment #13</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D137730" name=3D"attach_137730" title=3D"Proposed patch">attachment =
137730</a> <a href=3D"attachment.cgi?id=3D137730&amp;action=3Dedit" title=
=3D"Proposed patch">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.=
html&amp;bug=3D105173&amp;attachment=3D137730'>[review]</a> [review]
&gt; Proposed patch</span >

<span class=3D"quote">&gt; Could you please try the attached patch (from
&gt; <a href=3D"https://github.com/skeggsb/nouveau/pull/1">https://github.c=
om/skeggsb/nouveau/pull/1</a>)? It fixes the errors on my end at
&gt; least.</span >

Yes, it works! I applied the patch to kernel-4.16.0-0.rc3.git2.1. After
launching supertuxkart i see only:

[   22.471837] fuse init (API version 7.26)
[   52.346467] nouveau 0000:03:00.0: imem: OOM: 00100000 00001000 -28
[   52.346516] nouveau 0000:03:00.0: imem: OOM: 00100000 00001000 -28
[  108.372556] perf: interrupt took too long (2530 &gt; 2500), lowering
kernel.perf_event_max_sample_rate to 79000


No artefacts.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15199454982.CAF0.26337--

--===============0031379634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0031379634==--
