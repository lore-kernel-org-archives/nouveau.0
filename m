From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100228] [NV137] bus: MMIO read of 00000000 FAULT at
 409800 [ TIMEOUT ]
Date: Mon, 04 Jun 2018 05:17:11 +0000
Message-ID: <bug-100228-8800-AiYByGoMAw@http.bugs.freedesktop.org/>
References: <bug-100228-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0387143984=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100228-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0387143984==
Content-Type: multipart/alternative; boundary="15280894314.87c0A.19188"
Content-Transfer-Encoding: 7bit


--15280894314.87c0A.19188
Date: Mon, 4 Jun 2018 05:17:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228

--- Comment #20 from Andrew <andrew-q4ulJ2CcmHAdnm+yROfE0A@public.gmane.org> ---
Thanks Rhys.

FWIW I've tried the nouveau.runpm=3D0 kernel parameter on my NV138 (GT 1030)
system but nouveau still failing.

Jun  4 15:03:49 roffey10 dracut-cmdline[252]: Using kernel command line
parameters:
BOOT_IMAGE=3D/boot/vmlinuz-4.17.0-0.rc7.git2.1.vanilla.knurd.1.fc28.x86_64
root=3D/dev/mapper/OSVG-root ro rd.lvm.lv=3DOSVG/root rd.lvm.lv=3DOSVG/swap
rd.lvm.lv=3DOSVG/usr rd.driver.pre=3Dvfio-pci rhgb quiet intel_iommu=3Don
nouveau.runpm=3D0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15280894314.87c0A.19188
Date: Mon, 4 Jun 2018 05:17:11 +0000
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
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228#c20">Comme=
nt # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrew&#64;roffey.org" title=3D"Andrew &lt;andrew&#64;roffey.org&gt;"> <spa=
n class=3D"fn">Andrew</span></a>
</span></b>
        <pre>Thanks Rhys.

FWIW I've tried the nouveau.runpm=3D0 kernel parameter on my NV138 (GT 1030)
system but nouveau still failing.

Jun  4 15:03:49 roffey10 dracut-cmdline[252]: Using kernel command line
parameters:
BOOT_IMAGE=3D/boot/vmlinuz-4.17.0-0.rc7.git2.1.vanilla.knurd.1.fc28.x86_64
root=3D/dev/mapper/OSVG-root ro rd.lvm.lv=3DOSVG/root rd.lvm.lv=3DOSVG/swap
rd.lvm.lv=3DOSVG/usr rd.driver.pre=3Dvfio-pci rhgb quiet intel_iommu=3Don
nouveau.runpm=3D0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15280894314.87c0A.19188--

--===============0387143984==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0387143984==--
