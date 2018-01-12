From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80675] [NVAA] Nouveau KMS framebuffer hand-over:
 no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB
 graphics RAM, X11 ok
Date: Fri, 12 Jan 2018 13:32:06 +0000
Message-ID: <bug-80675-8800-nWhGA2H9Gq@http.bugs.freedesktop.org/>
References: <bug-80675-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1611105798=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80675-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1611105798==
Content-Type: multipart/alternative; boundary="15157639253.ee1DACB6.12501"
Content-Transfer-Encoding: 7bit


--15157639253.ee1DACB6.12501
Date: Fri, 12 Jan 2018 13:32:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D80675

--- Comment #12 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Ben's latest tree ought to fix it completely:

https://github.com/skeggsb/nouveau/commits/master

Looks like fbcon started using the atomic ioctls when available, which for
nouveau is since the conversion in 4.10, but we had not switched to using t=
he
atomic gamma property.

That's why my patch was insufficient.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15157639253.ee1DACB6.12501
Date: Fri, 12 Jan 2018 13:32:05 +0000
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
   title=3D"NEW - [NVAA] Nouveau KMS framebuffer hand-over: no/black consol=
e on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB graphics RAM, X11=
 ok"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D80675#c12">Commen=
t # 12</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAA] Nouveau KMS framebuffer hand-over: no/black consol=
e on Nvidia MCP78S/C77/GeForce 8300 (10de:0848) with 32MB graphics RAM, X11=
 ok"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D80675">bug 80675<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Ben's latest tree ought to fix it completely:

<a href=3D"https://github.com/skeggsb/nouveau/commits/master">https://githu=
b.com/skeggsb/nouveau/commits/master</a>

Looks like fbcon started using the atomic ioctls when available, which for
nouveau is since the conversion in 4.10, but we had not switched to using t=
he
atomic gamma property.

That's why my patch was insufficient.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15157639253.ee1DACB6.12501--

--===============1611105798==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1611105798==--
