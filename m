From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103689] there is an exploitable page fault that can
 be reliably triggered from the chromium sandbox can possibly lead to remote
 attackers causing a denial of service condition or possibly running system
 code.
Date: Sun, 12 Nov 2017 11:54:48 +0000
Message-ID: <bug-103689-8800-045s1c9GzQ@http.bugs.freedesktop.org/>
References: <bug-103689-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0783949800=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103689-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0783949800==
Content-Type: multipart/alternative; boundary="15104876880.1fC66ab.4065";
 charset="UTF-8"


--15104876880.1fC66ab.4065
Date: Sun, 12 Nov 2017 11:54:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103689

--- Comment #1 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Which kernel version does your Ubuntu installation have? And with which GPU=
 was
it?

I tried opening that page on my computer with Chromium, but it didn=E2=80=
=99t trigger a
page fault. This is what I got instead:

    [Nov12 12:40] nouveau 0000:04:00.0: Xorg[394]: fail ttm_validate
    [  +0.000006] nouveau 0000:04:00.0: Xorg[394]: validating bo list
    [  +0.000006] nouveau 0000:04:00.0: Xorg[394]: validate: -12
    [  +1.124277] nouveau 0000:04:00.0: gr: TRAP ch 10 [007fa04000 Xorg[394=
]]
    [  +0.000014] nouveau 0000:04:00.0: gr: SHADER a244020e, sph: 0x44020e,
stage: 0x22
    [  +5.515843] nouveau 0000:04:00.0: gr: TRAP ch 10 [007fa04000 Xorg[394=
]]
    [  +0.000016] nouveau 0000:04:00.0: gr: SHADER a244020e, sph: 0x44020e,
stage: 0x22
    [Nov12 12:41] nouveau 0000:04:00.0: Xorg[394]: fail ttm_validate
    [  +0.000005] nouveau 0000:04:00.0: Xorg[394]: validating bo list
    [  +0.000005] nouveau 0000:04:00.0: Xorg[394]: validate: -12
    [Nov12 12:42] nouveau 0000:04:00.0: gr: TRAP ch 10 [007fa04000 Xorg[394=
]]
    [  +0.000010] nouveau 0000:04:00.0: gr: SHADER a244020e, sph: 0x44020e,
stage: 0x22
    [Nov12 12:43] nouveau 0000:04:00.0: gr: TRAP ch 10 [007fa04000 Xorg[394=
]]
    [  +0.000009] nouveau 0000:04:00.0: gr: SHADER a244020e, sph: 0x44020e,
stage: 0x22
    [  +1.273289] nouveau 0000:04:00.0: gr: TRAP ch 10 [007fa04000 Xorg[394=
]]
    [  +0.000015] nouveau 0000:04:00.0: gr: SHADER a244020e, sph: 0x44020e,
stage: 0x22
    [  +0.455464] nouveau 0000:04:00.0: gr: TRAP ch 10 [007fa04000 Xorg[394=
]]
    [  +0.000013] nouveau 0000:04:00.0: gr: SHADER a244020e, sph: 0x44020e,
stage: 0x22
    [  +0.518625] nouveau 0000:04:00.0: gr: TRAP ch 10 [007fa04000 Xorg[394=
]]
    [  +0.000014] nouveau 0000:04:00.0: gr: SHADER a244020e, sph: 0x44020e,
stage: 0x22

GPU: GM206
Kernel: 4.13.12
Xorg: 1.19.5

--=20
You are receiving this mail because:
You are on the CC list for the bug.
You are the assignee for the bug.=

--15104876880.1fC66ab.4065
Date: Sun, 12 Nov 2017 11:54:48 +0000
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
   title=3D"NEW - there is an exploitable page fault that can be reliably t=
riggered from the chromium sandbox can possibly lead to remote attackers ca=
using a denial of service condition or possibly running system code."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103689#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - there is an exploitable page fault that can be reliably t=
riggered from the chromium sandbox can possibly lead to remote attackers ca=
using a denial of service condition or possibly running system code."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103689">bug 10368=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>Which kernel version does your Ubuntu installation have? And w=
ith which GPU was
it?

I tried opening that page on my computer with Chromium, but it didn=E2=80=
=99t trigger a
page fault. This is what I got instead:

    [Nov12 12:40] nouveau 0000:04:00.0: Xorg[394]: fail ttm_validate
    [  +0.000006] nouveau 0000:04:00.0: Xorg[394]: validating bo list
    [  +0.000006] nouveau 0000:04:00.0: Xorg[394]: validate: -12
    [  +1.124277] nouveau 0000:04:00.0: gr: TRAP ch 10 [007fa04000 Xorg[394=
]]
    [  +0.000014] nouveau 0000:04:00.0: gr: SHADER a244020e, sph: 0x44020e,
stage: 0x22
    [  +5.515843] nouveau 0000:04:00.0: gr: TRAP ch 10 [007fa04000 Xorg[394=
]]
    [  +0.000016] nouveau 0000:04:00.0: gr: SHADER a244020e, sph: 0x44020e,
stage: 0x22
    [Nov12 12:41] nouveau 0000:04:00.0: Xorg[394]: fail ttm_validate
    [  +0.000005] nouveau 0000:04:00.0: Xorg[394]: validating bo list
    [  +0.000005] nouveau 0000:04:00.0: Xorg[394]: validate: -12
    [Nov12 12:42] nouveau 0000:04:00.0: gr: TRAP ch 10 [007fa04000 Xorg[394=
]]
    [  +0.000010] nouveau 0000:04:00.0: gr: SHADER a244020e, sph: 0x44020e,
stage: 0x22
    [Nov12 12:43] nouveau 0000:04:00.0: gr: TRAP ch 10 [007fa04000 Xorg[394=
]]
    [  +0.000009] nouveau 0000:04:00.0: gr: SHADER a244020e, sph: 0x44020e,
stage: 0x22
    [  +1.273289] nouveau 0000:04:00.0: gr: TRAP ch 10 [007fa04000 Xorg[394=
]]
    [  +0.000015] nouveau 0000:04:00.0: gr: SHADER a244020e, sph: 0x44020e,
stage: 0x22
    [  +0.455464] nouveau 0000:04:00.0: gr: TRAP ch 10 [007fa04000 Xorg[394=
]]
    [  +0.000013] nouveau 0000:04:00.0: gr: SHADER a244020e, sph: 0x44020e,
stage: 0x22
    [  +0.518625] nouveau 0000:04:00.0: gr: TRAP ch 10 [007fa04000 Xorg[394=
]]
    [  +0.000014] nouveau 0000:04:00.0: gr: SHADER a244020e, sph: 0x44020e,
stage: 0x22

GPU: GM206
Kernel: 4.13.12
Xorg: 1.19.5</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are on the CC list for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15104876880.1fC66ab.4065--

--===============0783949800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0783949800==--
