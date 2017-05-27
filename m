From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101199] nouveau_screen.c: undefined reference to
 `nouveau_drm_del'
Date: Sat, 27 May 2017 14:08:51 +0000
Message-ID: <bug-101199-8800-7hk8W2Nd7f@http.bugs.freedesktop.org/>
References: <bug-101199-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0856073577=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101199-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0856073577==
Content-Type: multipart/alternative; boundary="14958941311.80CDb258A.30061";
 charset="UTF-8"


--14958941311.80CDb258A.30061
Date: Sat, 27 May 2017 14:08:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101199

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |NOTOURBUG

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Andrey from comment #2)
> (In reply to Ilia Mirkin from comment #1)
> > You have an issue on your system. You're picking up a version of
> > drm/nouveau.h which is not the one that configure found.
>=20
> I have two libdrms:
>=20
> 1) The system's one libdrm-devel-2.4.60-1.fc21.x86_64
> 2) The local one needed for mesa: /path/to/libdrm/2.4.80/
>=20
> How can I tell configure to pick up a right one?
>=20
> Thank you.

No clue. If libdrm-devel is installed in a system path, and you have other
libraries installed in system paths, this may not be a supportable
configuration, since all include paths are just mashed together.

Uninstall libdrm-devel perhaps?

Either way, not a nouveau issue.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14958941311.80CDb258A.30061
Date: Sat, 27 May 2017 14:08:51 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:imirkin&#=
64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <s=
pan class=3D"fn">Ilia Mirkin</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - nouveau_screen.c: undefined reference to `=
nouveau_drm_del'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101199">bug 10119=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>REOPENED
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTOURBUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - nouveau_screen.c: undefined reference to `=
nouveau_drm_del'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101199#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED NOTOURBUG - nouveau_screen.c: undefined reference to `=
nouveau_drm_del'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101199">bug 10119=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Andrey from <a href=3D"show_bug.cgi?id=3D101199#c=
2">comment #2</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D101199#c1">comment #1</a>)
&gt; &gt; You have an issue on your system. You're picking up a version of
&gt; &gt; drm/nouveau.h which is not the one that configure found.
&gt;=20
&gt; I have two libdrms:
&gt;=20
&gt; 1) The system's one libdrm-devel-2.4.60-1.fc21.x86_64
&gt; 2) The local one needed for mesa: /path/to/libdrm/2.4.80/
&gt;=20
&gt; How can I tell configure to pick up a right one?
&gt;=20
&gt; Thank you.</span >

No clue. If libdrm-devel is installed in a system path, and you have other
libraries installed in system paths, this may not be a supportable
configuration, since all include paths are just mashed together.

Uninstall libdrm-devel perhaps?

Either way, not a nouveau issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14958941311.80CDb258A.30061--

--===============0856073577==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0856073577==--
