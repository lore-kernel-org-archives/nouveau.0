From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 112070] H/W Acceleration sufficiently buggy on
 Debian to hard lock machine GeForce 7600 GO
Date: Sun, 27 Oct 2019 12:04:22 +0000
Message-ID: <bug-112070-8800-HoPiYJKRtS@http.bugs.freedesktop.org/>
References: <bug-112070-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1836565673=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-112070-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1836565673==
Content-Type: multipart/alternative; boundary="15721778622.BCAd0D8.32641"
Content-Transfer-Encoding: 7bit


--15721778622.BCAd0D8.32641
Date: Sun, 27 Oct 2019 12:04:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112070

--- Comment #29 from Doobz <dooby.dave-J1btbF6uMEmsTnJN9+BGXg@public.gmane.org> ---
So..

My laptop's interrupt issues disappear when booting with acpi=3Doff. So did
nouveau however. Have tried a few other boot parameters, including
acpi_apic_instance=3D2 as suggested in dmesg, but no joy.

Could these ACPI warnings be hinting at something?=20

[   20.414011] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[   20.416862] ACPI Warning: SystemIO range
0x0000000000001028-0x000000000000102F conflicts with OpRegion
0x0000000000001000-0x000000000000107F (\PMIO) (20190703/utaddress-204)
[   20.416870] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver
[   20.416873] ACPI Warning: SystemIO range
0x00000000000011B0-0x00000000000011BF conflicts with OpRegion
0x0000000000001180-0x00000000000011BB (\GPIO) (20190703/utaddress-204)
[   20.416878] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver
[   20.416879] ACPI Warning: SystemIO range
0x0000000000001180-0x00000000000011AF conflicts with OpRegion
0x0000000000001180-0x00000000000011BB (\GPIO) (20190703/utaddress-204)
[   20.416883] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver
[   20.416884] lpc_ich: Resource conflict(s) found affecting gpio_ich

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15721778622.BCAd0D8.32641
Date: Sun, 27 Oct 2019 12:04:22 +0000
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
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070#c29">Comme=
nt # 29</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - H/W Acceleration sufficiently buggy on Debian to hard loc=
k machine GeForce 7600 GO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112070">bug 11207=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dooby.dave&#64;virgin.net" title=3D"Doobz &lt;dooby.dave&#64;virgin.net&gt;=
"> <span class=3D"fn">Doobz</span></a>
</span></b>
        <pre>So..

My laptop's interrupt issues disappear when booting with acpi=3Doff. So did
nouveau however. Have tried a few other boot parameters, including
acpi_apic_instance=3D2 as suggested in dmesg, but no joy.

Could these ACPI warnings be hinting at something?=20

[   20.414011] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
[   20.416862] ACPI Warning: SystemIO range
0x0000000000001028-0x000000000000102F conflicts with OpRegion
0x0000000000001000-0x000000000000107F (\PMIO) (20190703/utaddress-204)
[   20.416870] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver
[   20.416873] ACPI Warning: SystemIO range
0x00000000000011B0-0x00000000000011BF conflicts with OpRegion
0x0000000000001180-0x00000000000011BB (\GPIO) (20190703/utaddress-204)
[   20.416878] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver
[   20.416879] ACPI Warning: SystemIO range
0x0000000000001180-0x00000000000011AF conflicts with OpRegion
0x0000000000001180-0x00000000000011BB (\GPIO) (20190703/utaddress-204)
[   20.416883] ACPI: If an ACPI driver is available for this device, you sh=
ould
use it instead of the native driver
[   20.416884] lpc_ich: Resource conflict(s) found affecting gpio_ich</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15721778622.BCAd0D8.32641--

--===============1836565673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1836565673==--
