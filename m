From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
 ]
Date: Sun, 25 Feb 2018 21:06:24 +0000
Message-ID: <bug-100423-8800-RFQmSJlVEO@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0154589385=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100423-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0154589385==
Content-Type: multipart/alternative; boundary="15195927850.6bCe80.14998"
Content-Transfer-Encoding: 7bit


--15195927850.6bCe80.14998
Date: Sun, 25 Feb 2018 21:06:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

--- Comment #16 from Ladislav Michl <ladis-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org> ---
Still exists in 4.16.0-rc2:
nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 022554 [ IBUS ]
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]
Machine is HP ZBook 17 G3, the rest (bootlogs, etc) can be found in BUG 100=
213
report.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15195927850.6bCe80.14998
Date: Sun, 25 Feb 2018 21:06:25 +0000
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
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c16">Comme=
nt # 16</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ladis&#64;linux-mips.org" title=3D"Ladislav Michl &lt;ladis&#64;linux-mips.=
org&gt;"> <span class=3D"fn">Ladislav Michl</span></a>
</span></b>
        <pre>Still exists in 4.16.0-rc2:
nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 022554 [ IBUS ]
nouveau 0000:01:00.0: bus: MMIO read of 00000000 FAULT at 10ac08 [ IBUS ]
Machine is HP ZBook 17 G3, the rest (bootlogs, etc) can be found in <a clas=
s=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [i915] [SKL] Incomplete list of HDMI connected displ=
ay resolution detected"
   href=3D"show_bug.cgi?id=3D100213">BUG 100213</a>
report.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15195927850.6bCe80.14998--

--===============0154589385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0154589385==--
