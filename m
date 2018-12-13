From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105319] DRM: EVO timeout with kernel 4.15.x
Date: Thu, 13 Dec 2018 07:55:42 +0000
Message-ID: <bug-105319-8800-Hdo78rnmG1@http.bugs.freedesktop.org/>
References: <bug-105319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0865883181=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0865883181==
Content-Type: multipart/alternative; boundary="15446877422.Aa6ef.24829"
Content-Transfer-Encoding: 7bit


--15446877422.Aa6ef.24829
Date: Thu, 13 Dec 2018 07:55:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105319

--- Comment #31 from Stef Bon <stefbon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
relevant code in dmesg:

[    3.715523] nouveau 0000:01:00.0: bios: version 86.07.42.00.4a
[    3.726451] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5

[    3.775840] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    3.775842] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
[    3.775843] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[    3.775845] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[    3.775846] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    3.775848] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    3.775850] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f42 04620030
[    3.775851] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011f62 00020010
[    3.775853] nouveau 0000:01:00.0: DRM: DCB outp 02: 02822f76 04600020
[    3.775854] nouveau 0000:01:00.0: DRM: DCB outp 03: 02022f72 00020020
[    3.775855] nouveau 0000:01:00.0: DRM: DCB outp 04: 04033f82 00020030
[    3.775857] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
[    3.775858] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
[    3.775859] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020246
[    3.775860] nouveau 0000:01:00.0: DRM: DCB conn 03: 01000331

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15446877422.Aa6ef.24829
Date: Thu, 13 Dec 2018 07:55:42 +0000
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
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319#c31">Comme=
nt # 31</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">bug 10531=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stefbon&#64;gmail.com" title=3D"Stef Bon &lt;stefbon&#64;gmail.com&gt;"> <s=
pan class=3D"fn">Stef Bon</span></a>
</span></b>
        <pre>relevant code in dmesg:

[    3.715523] nouveau 0000:01:00.0: bios: version 86.07.42.00.4a
[    3.726451] nouveau 0000:01:00.0: fb: 4096 MiB GDDR5

[    3.775840] nouveau 0000:01:00.0: DRM: VRAM: 4096 MiB
[    3.775842] nouveau 0000:01:00.0: DRM: GART: 536870912 MiB
[    3.775843] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[    3.775845] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[    3.775846] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    3.775848] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    3.775850] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f42 04620030
[    3.775851] nouveau 0000:01:00.0: DRM: DCB outp 01: 02011f62 00020010
[    3.775853] nouveau 0000:01:00.0: DRM: DCB outp 02: 02822f76 04600020
[    3.775854] nouveau 0000:01:00.0: DRM: DCB outp 03: 02022f72 00020020
[    3.775855] nouveau 0000:01:00.0: DRM: DCB outp 04: 04033f82 00020030
[    3.775857] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
[    3.775858] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010161
[    3.775859] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020246
[    3.775860] nouveau 0000:01:00.0: DRM: DCB conn 03: 01000331</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15446877422.Aa6ef.24829--

--===============0865883181==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0865883181==--
