From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15758] Invisible mouse pointer on NV4E (C51)
Date: Mon, 19 Sep 2016 15:22:46 +0000
Message-ID: <bug-15758-8800-VdWkFz51Lk@http.bugs.freedesktop.org/>
References: <bug-15758-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1035103681=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15758-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1035103681==
Content-Type: multipart/alternative; boundary="14742985661.fCf4Dc.26247";
 charset="UTF-8"


--14742985661.fCf4Dc.26247
Date: Mon, 19 Sep 2016 15:22:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D15758

oldtechaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |oldtechaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

--- Comment #43 from oldtechaa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I can confirm that this bug still exists in Fedora 24 running
xf86-video-nouveau 1.0.12 on an MCP61 motherboard. On return from suspend, =
the
cursor is invisible. Ways to recover the cursor are switching to a differen=
t VT
or opening the Xfce Whisker menu and moving the mouse onto it. Regular use =
is
never affected; only suspend exhibits the bug.

I believe this may actually have been caused by a commit early in 2008:
https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=3D0da8c8=
4cceb178b04ab535edb4e3f0ced204d00a

This commit disables the hardware cursor on X mode changes.

Please email me back if you need more info.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14742985661.fCf4Dc.26247
Date: Mon, 19 Sep 2016 15:22:46 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:oldtechaa=
&#64;gmail.com" title=3D"oldtechaa&#64;gmail.com">oldtechaa&#64;gmail.com</=
a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Invisible mouse pointer on NV4E (C51)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D15758">bug 15758<=
/a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>oldtechaa&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Invisible mouse pointer on NV4E (C51)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D15758#c43">Commen=
t # 43</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Invisible mouse pointer on NV4E (C51)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D15758">bug 15758<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
oldtechaa&#64;gmail.com" title=3D"oldtechaa&#64;gmail.com">oldtechaa&#64;gm=
ail.com</a>
</span></b>
        <pre>I can confirm that this bug still exists in Fedora 24 running
xf86-video-nouveau 1.0.12 on an MCP61 motherboard. On return from suspend, =
the
cursor is invisible. Ways to recover the cursor are switching to a differen=
t VT
or opening the Xfce Whisker menu and moving the mouse onto it. Regular use =
is
never affected; only suspend exhibits the bug.

I believe this may actually have been caused by a commit early in 2008:
<a href=3D"https://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?=
id=3D0da8c84cceb178b04ab535edb4e3f0ced204d00a">https://cgit.freedesktop.org=
/nouveau/xf86-video-nouveau/commit/?id=3D0da8c84cceb178b04ab535edb4e3f0ced2=
04d00a</a>

This commit disables the hardware cursor on X mode changes.

Please email me back if you need more info.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14742985661.fCf4Dc.26247--

--===============1035103681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1035103681==--
