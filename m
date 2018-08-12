From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102430] nv4x - memory problems when starting
 graphical application - logs included
Date: Sun, 12 Aug 2018 22:38:28 +0000
Message-ID: <bug-102430-8800-Kd4z1JK3Zl@http.bugs.freedesktop.org/>
References: <bug-102430-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1297091995=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102430-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1297091995==
Content-Type: multipart/alternative; boundary="15341135081.415b4d9.24177"
Content-Transfer-Encoding: 7bit


--15341135081.415b4d9.24177
Date: Sun, 12 Aug 2018 22:38:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102430

--- Comment #6 from caguduzexi-MVPHpGc5C/w@public.gmane.org ---
Problems on for kernel 4.17.14 starting the many years old openarena:

It crashes the system. The graphical output freezes. I cant even change any
more to the tty. When i login before over ssh into the machine, i keep havi=
ng a
working ssh connection and can then look into logs and work with the machine
when the normal screen is freezed.

[  448.428450] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 036c data 0000000e
[  448.428497] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 1808 data 00000000
[  448.434255] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 1a00 data 057aa000
[  448.434287] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 1a04 data 00098529
[  448.440343] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 1a04 data 000a8529
[  448.441775] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 0300 data 00000001
[  448.445358] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 0300 data 00000001
[  448.445407] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 0300 data 00000001

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15341135081.415b4d9.24177
Date: Sun, 12 Aug 2018 22:38:28 +0000
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
   title=3D"NEW - nv4x - memory problems when starting graphical applicatio=
n - logs included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102430#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x - memory problems when starting graphical applicatio=
n - logs included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102430">bug 10243=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
caguduzexi&#64;spam4.me" title=3D"caguduzexi&#64;spam4.me">caguduzexi&#64;s=
pam4.me</a>
</span></b>
        <pre>Problems on for kernel 4.17.14 starting the many years old ope=
narena:

It crashes the system. The graphical output freezes. I cant even change any
more to the tty. When i login before over ssh into the machine, i keep havi=
ng a
working ssh connection and can then look into logs and work with the machine
when the normal screen is freezed.

[  448.428450] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 036c data 0000000e
[  448.428497] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 1808 data 00000000
[  448.434255] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 1a00 data 057aa000
[  448.434287] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 1a04 data 00098529
[  448.440343] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 1a04 data 000a8529
[  448.441775] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 0300 data 00000001
[  448.445358] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 0300 data 00000001
[  448.445407] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0001=
0000
[DMA_VTX_PROTECTION] nstatus 04000000 [PROTECTION_FAULT] ch 8 [001a9000
ioquake3[2742]] subc 7 class 4097 mthd 0300 data 00000001</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15341135081.415b4d9.24177--

--===============1297091995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1297091995==--
