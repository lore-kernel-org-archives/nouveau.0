From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99396] Crash in nouveau_dri.so when switching apps
 with alt-tab in Gnome
Date: Thu, 27 Apr 2017 07:28:22 +0000
Message-ID: <bug-99396-8800-uIInEMKCzN@http.bugs.freedesktop.org/>
References: <bug-99396-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1804773415=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99396-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1804773415==
Content-Type: multipart/alternative; boundary="14932781020.EB86204A6.15382";
 charset="UTF-8"


--14932781020.EB86204A6.15382
Date: Thu, 27 Apr 2017 07:28:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99396

--- Comment #8 from Ingvar Hagelund <ingvar-qtFA7gTkXNbOT5slSWiCZNBPR1lH4CV8@public.gmane.org> ---
I have a similar crash, running Fedora 25/x86_64, Linux
kernel-4.10.11-200.fc25.x86_64, Nvidia Quadro NVS 295.


$ lspci|grep NVIDIA
01:00.0 VGA compatible controller: NVIDIA Corporation G98 [Quadro NVS 295] =
(rev
a1)

When the bug hits, the machine becomes completely inresponsive, even networ=
king
stops, and a reboot seems the only way to recover.

Kernel 4.9.14-200.fc25 seems to not have this bug.

Attached filtered systemd journal output when the bug hits.

Ingvar

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14932781020.EB86204A6.15382
Date: Thu, 27 Apr 2017 07:28:22 +0000
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
   title=3D"NEW - Crash in nouveau_dri.so when switching apps with alt-tab =
in Gnome"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99396#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash in nouveau_dri.so when switching apps with alt-tab =
in Gnome"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99396">bug 99396<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ingvar&#64;redpill-linpro.com" title=3D"Ingvar Hagelund &lt;ingvar&#64;redp=
ill-linpro.com&gt;"> <span class=3D"fn">Ingvar Hagelund</span></a>
</span></b>
        <pre>I have a similar crash, running Fedora 25/x86_64, Linux
kernel-4.10.11-200.fc25.x86_64, Nvidia Quadro NVS 295.


$ lspci|grep NVIDIA
01:00.0 VGA compatible controller: NVIDIA Corporation G98 [Quadro NVS 295] =
(rev
a1)

When the bug hits, the machine becomes completely inresponsive, even networ=
king
stops, and a reboot seems the only way to recover.

Kernel 4.9.14-200.fc25 seems to not have this bug.

Attached filtered systemd journal output when the bug hits.

Ingvar</pre>
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

--14932781020.EB86204A6.15382--

--===============1804773415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1804773415==--
