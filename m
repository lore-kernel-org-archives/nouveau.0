From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101553] [GP107] failed to create kernel channel, -22
Date: Thu, 22 Jun 2017 07:55:19 +0000
Message-ID: <bug-101553-8800-0MavmPxNVs@http.bugs.freedesktop.org/>
References: <bug-101553-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1283920349=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101553-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1283920349==
Content-Type: multipart/alternative; boundary="14981181182.922cC.401";
 charset="UTF-8"


--14981181182.922cC.401
Date: Thu, 22 Jun 2017 07:55:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101553

Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[    8.944203] nouveau      |[GP107] failed to create
                   |0000:01:00.0: DRM: failed   |kernel channel, -22
                   |to create kernel channel,   |
                   |-22                         |

--- Comment #1 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
FYI, if you want to blacklist Nouveau (or any module), the syntax is
`modprobe.blacklist=3Dnouveau`. You can also disable Nouveau by setting
`nouveau.modeset=3D0`.

Hardware acceleration support for GP10x cards is coming with 4.12, so it is
expected that <4.12 fails to create the kernel channel. There is some initi=
al
acceleration support for GP107 in 4.12, but I don=E2=80=99t whether it need=
s more work
to be usable, or not.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14981181182.922cC.401
Date: Thu, 22 Jun 2017 07:55:18 +0000
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
          bz_status_NEW "
   title=3D"NEW - [GP107] failed to create kernel channel, -22"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101553">bug 10155=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Summary</td>
           <td>[    8.944203] nouveau 0000:01:00.0: DRM: failed to create k=
ernel channel, -22
           </td>
           <td>[GP107] failed to create kernel channel, -22
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GP107] failed to create kernel channel, -22"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101553#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GP107] failed to create kernel channel, -22"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101553">bug 10155=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>FYI, if you want to blacklist Nouveau (or any module), the syn=
tax is
`modprobe.blacklist=3Dnouveau`. You can also disable Nouveau by setting
`nouveau.modeset=3D0`.

Hardware acceleration support for GP10x cards is coming with 4.12, so it is
expected that &lt;4.12 fails to create the kernel channel. There is some in=
itial
acceleration support for GP107 in 4.12, but I don=E2=80=99t whether it need=
s more work
to be usable, or not.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14981181182.922cC.401--

--===============1283920349==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1283920349==--
