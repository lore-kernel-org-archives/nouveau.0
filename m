From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105173] [MCP79][Regression] Unhandled NULL pointer
 dereference in nvkm_object_unmap since kernel 4.15
Date: Wed, 21 Feb 2018 19:33:51 +0000
Message-ID: <bug-105173-8800-39vWFT7Fmo@http.bugs.freedesktop.org/>
References: <bug-105173-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0736994410=="
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


--===============0736994410==
Content-Type: multipart/alternative; boundary="15192416301.1567BA.9514"
Content-Transfer-Encoding: 7bit


--15192416301.1567BA.9514
Date: Wed, 21 Feb 2018 19:33:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105173

--- Comment #6 from Nick Lee <nvlbox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Pierre Moreau from comment #5)

> I tried running supertuxkart on my MCP79 (9400M), got some artefacts, but=
 it
> did not freeze; the only error I got was =E2=80=9Cnouveau 0000:03:00.0: f=
ifo:
> CACHE_ERROR - ch 1 [DRM] subc 0 mthd 0060 data 80000002=E2=80=9D.

i got same artefact after launch gtk4-demo and after launch disk-usage-anal=
izer

> Which version of Mesa, xf86-video-nouveau (or modesetting) did you have in
> those tests?

curently fedora:
kernel-4.16.0-0.rc2.git0.1
mesa-17.3.5-1
xorg-x11-drv-nouveau-1.0.15-3
xorg-x11-server-Xorg-1.19.6-5
libwayland-server-1.14.0-2

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15192416301.1567BA.9514
Date: Wed, 21 Feb 2018 19:33:50 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173#c6">Commen=
t # 6</a>
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
05173#c5">comment #5</a>)

<span class=3D"quote">&gt; I tried running supertuxkart on my MCP79 (9400M)=
, got some artefacts, but it
&gt; did not freeze; the only error I got was =E2=80=9Cnouveau 0000:03:00.0=
: fifo:
&gt; CACHE_ERROR - ch 1 [DRM] subc 0 mthd 0060 data 80000002=E2=80=9D.</spa=
n >

i got same artefact after launch gtk4-demo and after launch disk-usage-anal=
izer

<span class=3D"quote">&gt; Which version of Mesa, xf86-video-nouveau (or mo=
desetting) did you have in
&gt; those tests?</span >

curently fedora:
kernel-4.16.0-0.rc2.git0.1
mesa-17.3.5-1
xorg-x11-drv-nouveau-1.0.15-3
xorg-x11-server-Xorg-1.19.6-5
libwayland-server-1.14.0-2</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15192416301.1567BA.9514--

--===============0736994410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0736994410==--
