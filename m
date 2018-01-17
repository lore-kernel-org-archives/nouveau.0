From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104672] [NVAC] Compiz segfaults on login on Ubuntu
 17.10 with Unity 7 (kernel DRM bug?)
Date: Wed, 17 Jan 2018 09:19:41 +0000
Message-ID: <bug-104672-8800-fBGR0DdMIu@http.bugs.freedesktop.org/>
References: <bug-104672-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1159648341=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104672-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1159648341==
Content-Type: multipart/alternative; boundary="15161807810.eaF19a.18160"
Content-Transfer-Encoding: 7bit


--15161807810.eaF19a.18160
Date: Wed, 17 Jan 2018 09:19:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104672

Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #1 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Could you please provide the output of dmesg after the segfault, as well as=
 the
X logs (/var/log/Xorg.0.log, or wherever it is on your computer)?
If you could bisect the kernel between 4.14.13 and 4.15-rc8, that would be
awesome (for example, running `git bisect start --term-good=3Dv4.14
--term-bad=3Dv4.15-rc8 -- drivers/gpu/drm/nouveau`, see ). I=E2=80=99ll try=
 to give
4.15-rc8 a spin on my laptop tonight.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15161807810.eaF19a.18160
Date: Wed, 17 Jan 2018 09:19:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:pierre.mo=
rrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"=
> <span class=3D"fn">Pierre Moreau</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [NVAC] Compiz segfaults on login on Ubuntu 17.10 wit=
h Unity 7 (kernel DRM bug?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104672">bug 10467=
2</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [NVAC] Compiz segfaults on login on Ubuntu 17.10 wit=
h Unity 7 (kernel DRM bug?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104672#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [NVAC] Compiz segfaults on login on Ubuntu 17.10 wit=
h Unity 7 (kernel DRM bug?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104672">bug 10467=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>Could you please provide the output of dmesg after the segfaul=
t, as well as the
X logs (/var/log/Xorg.0.log, or wherever it is on your computer)?
If you could bisect the kernel between 4.14.13 and 4.15-rc8, that would be
awesome (for example, running `git bisect start --term-good=3Dv4.14
--term-bad=3Dv4.15-rc8 -- drivers/gpu/drm/nouveau`, see ). I=E2=80=99ll try=
 to give
4.15-rc8 a spin on my laptop tonight.</pre>
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

--15161807810.eaF19a.18160--

--===============1159648341==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1159648341==--
