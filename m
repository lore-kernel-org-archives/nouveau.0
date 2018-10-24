From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108500] Crash when creating a depth buffer on
 GeForce 320M
Date: Wed, 24 Oct 2018 13:48:46 +0000
Message-ID: <bug-108500-8800-i6DqYC4fs1@http.bugs.freedesktop.org/>
References: <bug-108500-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1448078572=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-108500-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1448078572==
Content-Type: multipart/alternative; boundary="15403889250.db29FB714.26888"
Content-Transfer-Encoding: 7bit


--15403889250.db29FB714.26888
Date: Wed, 24 Oct 2018 13:48:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108500

--- Comment #6 from Timo Wiren <timo.wiren-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #5)
> Could you boot with
>=20
> nouveau.debug=3Dmmu=3Ddebug
>=20
> and see what gets printed? I think I see why the -22 (EINVAL) is being
> generated -- the RAM is marked as stolen, and it rejects compressed memory
> on it. However I'm not sure that's actually correct.

Thanks for looking into this. Here's the output:

[  110.000223] nouveau 0000:04:00.0: mmu: user: comp 3 0a
[  110.000227] nouveau 0000:04:00.0: mmu: user: invalid -22

[  110.000275] nouveau 0000:04:00.0: mmu: user: comp 3 0a
[  110.000277] nouveau 0000:04:00.0: mmu: user: invalid -22

[  110.003636] nouveau 0000:04:00.0: mmu: user: comp 3 0a
[  110.003639] nouveau 0000:04:00.0: mmu: user: invalid -22

[  110.003676] nouveau 0000:04:00.0: mmu: user: comp 3 0a
[  110.003678] nouveau 0000:04:00.0: mmu: user: invalid -22

[  110.003697] glxgears[1196]: segfault at 1a ip 00007fa0080b533d sp
00007ffc0a624b00 error 4 in nouveau_dri.so[7fa007ee1000+819000]
[  110.003705] Code: c6 44 24 07 00 49 8b 9d c0 01 00 00 48 85 db 0f 84 e4 =
00
00 00 80 bb 91 00 00 00 00 0f 85 03 01 00 00 48 8b 4b 58 0f b7 14 24 <0f> b=
7 41
1a 66 39 51 18 48 89 4c 24 48 66 0f 46 51 18 66 39 44 24

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15403889250.db29FB714.26888
Date: Wed, 24 Oct 2018 13:48:45 +0000
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
   title=3D"NEW - Crash when creating a depth buffer on GeForce 320M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108500#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash when creating a depth buffer on GeForce 320M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108500">bug 10850=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
timo.wiren&#64;gmail.com" title=3D"Timo Wiren &lt;timo.wiren&#64;gmail.com&=
gt;"> <span class=3D"fn">Timo Wiren</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D108=
500#c5">comment #5</a>)
<span class=3D"quote">&gt; Could you boot with
&gt;=20
&gt; nouveau.debug=3Dmmu=3Ddebug
&gt;=20
&gt; and see what gets printed? I think I see why the -22 (EINVAL) is being
&gt; generated -- the RAM is marked as stolen, and it rejects compressed me=
mory
&gt; on it. However I'm not sure that's actually correct.</span >

Thanks for looking into this. Here's the output:

[  110.000223] nouveau 0000:04:00.0: mmu: user: comp 3 0a
[  110.000227] nouveau 0000:04:00.0: mmu: user: invalid -22

[  110.000275] nouveau 0000:04:00.0: mmu: user: comp 3 0a
[  110.000277] nouveau 0000:04:00.0: mmu: user: invalid -22

[  110.003636] nouveau 0000:04:00.0: mmu: user: comp 3 0a
[  110.003639] nouveau 0000:04:00.0: mmu: user: invalid -22

[  110.003676] nouveau 0000:04:00.0: mmu: user: comp 3 0a
[  110.003678] nouveau 0000:04:00.0: mmu: user: invalid -22

[  110.003697] glxgears[1196]: segfault at 1a ip 00007fa0080b533d sp
00007ffc0a624b00 error 4 in nouveau_dri.so[7fa007ee1000+819000]
[  110.003705] Code: c6 44 24 07 00 49 8b 9d c0 01 00 00 48 85 db 0f 84 e4 =
00
00 00 80 bb 91 00 00 00 00 0f 85 03 01 00 00 48 8b 4b 58 0f b7 14 24 &lt;0f=
&gt; b7 41
1a 66 39 51 18 48 89 4c 24 48 66 0f 46 51 18 66 39 44 24</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15403889250.db29FB714.26888--

--===============1448078572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1448078572==--
