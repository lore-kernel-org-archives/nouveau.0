From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104672] [NVAC] Compiz segfaults on login on Ubuntu
 17.10 with Unity 7 (kernel DRM bug?)
Date: Wed, 17 Jan 2018 11:31:57 +0000
Message-ID: <bug-104672-8800-r5QvpFGb5Z@http.bugs.freedesktop.org/>
References: <bug-104672-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2123216072=="
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


--===============2123216072==
Content-Type: multipart/alternative; boundary="15161887170.B82be339.5064"
Content-Transfer-Encoding: 7bit


--15161887170.B82be339.5064
Date: Wed, 17 Jan 2018 11:31:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104672

--- Comment #3 from Rui Salvaterra <rsalvaterra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 136805
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D136805&action=3Dedit
Xorg log

So I managed to configure lightdm for logging in automatically. This is wha=
t I
got on the dmesg:

[   40.419929] compiz[912]: segfault at 1a ip 00007f77455ef1e8 sp
00007ffd41c1fba0 error 4 in nouveau_dri.so[7f77453a9000+a86000]

Xorg log attached.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15161887170.B82be339.5064
Date: Wed, 17 Jan 2018 11:31:57 +0000
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [NVAC] Compiz segfaults on login on Ubuntu 17.10 wit=
h Unity 7 (kernel DRM bug?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104672#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - [NVAC] Compiz segfaults on login on Ubuntu 17.10 wit=
h Unity 7 (kernel DRM bug?)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104672">bug 10467=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rsalvaterra&#64;gmail.com" title=3D"Rui Salvaterra &lt;rsalvaterra&#64;gmai=
l.com&gt;"> <span class=3D"fn">Rui Salvaterra</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D136805=
" name=3D"attach_136805" title=3D"Xorg log">attachment 136805</a> <a href=
=3D"attachment.cgi?id=3D136805&amp;action=3Dedit" title=3D"Xorg log">[detai=
ls]</a></span>
Xorg log

So I managed to configure lightdm for logging in automatically. This is wha=
t I
got on the dmesg:

[   40.419929] compiz[912]: segfault at 1a ip 00007f77455ef1e8 sp
00007ffd41c1fba0 error 4 in nouveau_dri.so[7f77453a9000+a86000]

Xorg log attached.</pre>
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

--15161887170.B82be339.5064--

--===============2123216072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2123216072==--
