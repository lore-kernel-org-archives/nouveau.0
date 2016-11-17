From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98763] Lots of crashes of kontact /kmail5
Date: Thu, 17 Nov 2016 18:41:52 +0000
Message-ID: <bug-98763-8800-jJejt3wJoX@http.bugs.freedesktop.org/>
References: <bug-98763-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0621277337=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98763-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0621277337==
Content-Type: multipart/alternative; boundary="14794081110.22D60.16707";
 charset="UTF-8"


--14794081110.22D60.16707
Date: Thu, 17 Nov 2016 18:41:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98763

--- Comment #1 from karl.thomas.schmidt-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org ---
looser@coputer:~> /usr/sbin/hwinfo --verbose --gfxcard
26: PCI 100.0: 0300 VGA compatible controller (VGA)=20=20=20=20=20=20=20=20=
=20=20=20=20=20
  [Created at pci.374]
  Unique ID: VCu0.7VjQyFc7SV0
  Parent ID: 3hqH.p6h828sKuU0
  SysFS ID: /devices/pci0000:00/0000:00:03.0/0000:01:00.0
  SysFS BusID: 0000:01:00.0
  Hardware Class: graphics card
  Model: "nVidia GT218 [GeForce 8400 GS Rev. 3]"
  Vendor: pci 0x10de "nVidia Corporation"
  Device: pci 0x10c3 "GT218 [GeForce 8400 GS Rev. 3]"
  SubVendor: pci 0x1462 "Micro-Star International Co., Ltd. [MSI]"
  SubDevice: pci 0x2295=20
  Revision: 0xa2
  Driver: "nouveau"
  Driver Modules: "drm"
  Memory Range: 0xf9000000-0xf9ffffff (rw,non-prefetchable)
  Memory Range: 0xd0000000-0xdfffffff (ro,non-prefetchable)
  Memory Range: 0xee000000-0xefffffff (ro,non-prefetchable)
  I/O Ports: 0xaf00-0xaf7f (rw)
  Memory Range: 0xfa000000-0xfa07ffff (ro,non-prefetchable,disabled)
  IRQ: 29 (10060667 events)
  I/O Ports: 0x3c0-0x3df (rw)
  Module Alias: "pci:v000010DEd000010C3sv00001462sd00002295bc03sc00i00"
  Driver Info #0:
    Driver Status: nouveau is active
    Driver Activation Cmd: "modprobe nouveau"
  Config Status: cfg=3Dnew, avail=3Dyes, need=3Dno, active=3Dunknown
  Attached to: #7 (PCI bridge)

Primary display adapter: #26

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14794081110.22D60.16707
Date: Thu, 17 Nov 2016 18:41:51 +0000
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
   title=3D"NEW - Lots of crashes of kontact /kmail5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98763#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Lots of crashes of kontact /kmail5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98763">bug 98763<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karl.thomas.schmidt&#64;googlemail.com" title=3D"karl.thomas.schmidt&#64;go=
oglemail.com">karl.thomas.schmidt&#64;googlemail.com</a>
</span></b>
        <pre>looser&#64;coputer:~&gt; /usr/sbin/hwinfo --verbose --gfxcard
26: PCI 100.0: 0300 VGA compatible controller (VGA)=20=20=20=20=20=20=20=20=
=20=20=20=20=20
  [Created at pci.374]
  Unique ID: VCu0.7VjQyFc7SV0
  Parent ID: 3hqH.p6h828sKuU0
  SysFS ID: /devices/pci0000:00/0000:00:03.0/0000:01:00.0
  SysFS BusID: 0000:01:00.0
  Hardware Class: graphics card
  Model: &quot;nVidia GT218 [GeForce 8400 GS Rev. 3]&quot;
  Vendor: pci 0x10de &quot;nVidia Corporation&quot;
  Device: pci 0x10c3 &quot;GT218 [GeForce 8400 GS Rev. 3]&quot;
  SubVendor: pci 0x1462 &quot;Micro-Star International Co., Ltd. [MSI]&quot;
  SubDevice: pci 0x2295=20
  Revision: 0xa2
  Driver: &quot;nouveau&quot;
  Driver Modules: &quot;drm&quot;
  Memory Range: 0xf9000000-0xf9ffffff (rw,non-prefetchable)
  Memory Range: 0xd0000000-0xdfffffff (ro,non-prefetchable)
  Memory Range: 0xee000000-0xefffffff (ro,non-prefetchable)
  I/O Ports: 0xaf00-0xaf7f (rw)
  Memory Range: 0xfa000000-0xfa07ffff (ro,non-prefetchable,disabled)
  IRQ: 29 (10060667 events)
  I/O Ports: 0x3c0-0x3df (rw)
  Module Alias: &quot;pci:v000010DEd000010C3sv00001462sd00002295bc03sc00i00=
&quot;
  Driver Info #0:
    Driver Status: nouveau is active
    Driver Activation Cmd: &quot;modprobe nouveau&quot;
  Config Status: cfg=3Dnew, avail=3Dyes, need=3Dno, active=3Dunknown
  Attached to: #7 (PCI bridge)

Primary display adapter: #26</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14794081110.22D60.16707--

--===============0621277337==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0621277337==--
