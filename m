From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95282] G96: system hang on video playback via vdpau
Date: Thu, 16 Feb 2017 17:37:53 +0000
Message-ID: <bug-95282-8800-tkcPjPtCxb@http.bugs.freedesktop.org/>
References: <bug-95282-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1101841652=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95282-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1101841652==
Content-Type: multipart/alternative; boundary="14872666731.AD447a2.7356";
 charset="UTF-8"


--14872666731.AD447a2.7356
Date: Thu, 16 Feb 2017 17:37:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95282

--- Comment #21 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
  Anyone here who could asses whether the hang-problem with vdpau could be
related to GART/IOMMU? Here is what I have in my dmesg:

[    5.186566] Linux agpgart interface v0.103
[    5.186765] AMD IOMMUv2 driver by Joerg Roedel <jroedel-l3A5Bk7waGM@public.gmane.org>
[    5.186766] AMD IOMMUv2 functionality not available on this system
[    8.857000] nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
[    8.857001] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14872666731.AD447a2.7356
Date: Thu, 16 Feb 2017 17:37:53 +0000
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
   title=3D"NEW - G96: system hang on video playback via vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95282#c21">Commen=
t # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - G96: system hang on video playback via vdpau"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95282">bug 95282<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
estellnb&#64;elstel.org" title=3D"Elmar Stellnberger &lt;estellnb&#64;elste=
l.org&gt;"> <span class=3D"fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>  Anyone here who could asses whether the hang-problem with vd=
pau could be
related to GART/IOMMU? Here is what I have in my dmesg:

[    5.186566] Linux agpgart interface v0.103
[    5.186765] AMD IOMMUv2 driver by Joerg Roedel &lt;<a href=3D"mailto:jro=
edel&#64;suse.de">jroedel&#64;suse.de</a>&gt;
[    5.186766] AMD IOMMUv2 functionality not available on this system
[    8.857000] nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
[    8.857001] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14872666731.AD447a2.7356--

--===============1101841652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1101841652==--
