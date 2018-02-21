From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105173] [MCP79][Regression] Unhandled NULL pointer
 dereference in nvkm_object_unmap since kernel 4.15
Date: Wed, 21 Feb 2018 17:31:59 +0000
Message-ID: <bug-105173-8800-MjopFDwVgi@http.bugs.freedesktop.org/>
References: <bug-105173-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2012364014=="
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


--===============2012364014==
Content-Type: multipart/alternative; boundary="15192343191.39b4eF0bB.19627"
Content-Transfer-Encoding: 7bit


--15192343191.39b4eF0bB.19627
Date: Wed, 21 Feb 2018 17:31:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105173

--- Comment #5 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to Nick Lee from comment #4)
> (In reply to Pierre Moreau from comment #3)
> > I=E2=80=99ll try to reproduce the issue on my laptop
>=20
> I tried reproduce this bug from
> openSUSE-Tumbleweed-GNOME-Live-x86_64-Snapshot20180219-Media.iso=20
> kernel-4.15.4-default
> session x11
> not reproducible.
>=20
> But reproducible from Fedora-Workstation-Live-x86_64-Rawhide-20180219.n.0=
.iso
>=20
> Did you reproduce it?

I tried running supertuxkart on my MCP79 (9400M), got some artefacts, but it
did not freeze; the only error I got was =E2=80=9Cnouveau 0000:03:00.0: fif=
o:
CACHE_ERROR - ch 1 [DRM] subc 0 mthd 0060 data 80000002=E2=80=9D.

Which version of Mesa, xf86-video-nouveau (or modesetting) did you have in
those tests?

For reference, I have:
Linux: 4.15.4
Mesa: 17.3.5
xf86-video-nouveau: 1.0.15
xorg-server: some 1.19.6 snapshot

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15192343191.39b4eF0bB.19627
Date: Wed, 21 Feb 2018 17:31:59 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - [MCP79][Regression] Unhandled NULL pointer dereferen=
ce in nvkm_object_unmap since kernel 4.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105173">bug 10517=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to Nick Lee from <a href=3D"show_bug.cgi?id=3D105173=
#c4">comment #4</a>)
<span class=3D"quote">&gt; (In reply to Pierre Moreau from <a href=3D"show_=
bug.cgi?id=3D105173#c3">comment #3</a>)
&gt; &gt; I=E2=80=99ll try to reproduce the issue on my laptop
&gt;=20
&gt; I tried reproduce this bug from
&gt; openSUSE-Tumbleweed-GNOME-Live-x86_64-Snapshot20180219-Media.iso=20
&gt; kernel-4.15.4-default
&gt; session x11
&gt; not reproducible.
&gt;=20
&gt; But reproducible from Fedora-Workstation-Live-x86_64-Rawhide-20180219.=
n.0.iso
&gt;=20
&gt; Did you reproduce it?</span >

I tried running supertuxkart on my MCP79 (9400M), got some artefacts, but it
did not freeze; the only error I got was =E2=80=9Cnouveau 0000:03:00.0: fif=
o:
CACHE_ERROR - ch 1 [DRM] subc 0 mthd 0060 data 80000002=E2=80=9D.

Which version of Mesa, xf86-video-nouveau (or modesetting) did you have in
those tests?

For reference, I have:
Linux: 4.15.4
Mesa: 17.3.5
xf86-video-nouveau: 1.0.15
xorg-server: some 1.19.6 snapshot</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15192343191.39b4eF0bB.19627--

--===============2012364014==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2012364014==--
