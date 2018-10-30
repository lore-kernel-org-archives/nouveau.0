From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108500] Crash when creating a depth buffer on
 GeForce 320M
Date: Tue, 30 Oct 2018 20:21:42 +0000
Message-ID: <bug-108500-8800-qhp397aTJr@http.bugs.freedesktop.org/>
References: <bug-108500-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1720166279=="
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


--===============1720166279==
Content-Type: multipart/alternative; boundary="15409309020.b7Cac0EB.32132"
Content-Transfer-Encoding: 7bit


--15409309020.b7Cac0EB.32132
Date: Tue, 30 Oct 2018 20:21:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108500

--- Comment #8 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Could you edit
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c:nv50_vmm_valid, and chang=
e it
to set aper =3D 0 in the if (ram->stolen) case (so aper=3D0 in both of the =
VRAM
cases). Let me know if you need me to make you a proper patch.

Then see if ... stuff works. At least glxgears, but would be good to test m=
ore
complex things too which make extensive use of depth as well as compressible
color formats (something like xonotic would be more than sufficient).

Unfortunately we're not sure if this works on MCP89 or not.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15409309020.b7Cac0EB.32132
Date: Tue, 30 Oct 2018 20:21:42 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108500#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash when creating a depth buffer on GeForce 320M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108500">bug 10850=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Could you edit
drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c:nv50_vmm_valid, and chang=
e it
to set aper =3D 0 in the if (ram-&gt;stolen) case (so aper=3D0 in both of t=
he VRAM
cases). Let me know if you need me to make you a proper patch.

Then see if ... stuff works. At least glxgears, but would be good to test m=
ore
complex things too which make extensive use of depth as well as compressible
color formats (something like xonotic would be more than sufficient).

Unfortunately we're not sure if this works on MCP89 or not.</pre>
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

--15409309020.b7Cac0EB.32132--

--===============1720166279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1720166279==--
