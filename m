From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75985] [NVC1] HDMI audio device only visible after
 rescan
Date: Sat, 03 Mar 2018 10:41:53 +0000
Message-ID: <bug-75985-8800-lNqDsMaaKR@http.bugs.freedesktop.org/>
References: <bug-75985-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1567174320=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75985-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1567174320==
Content-Type: multipart/alternative; boundary="15200737140.aa7635DD8.8222"
Content-Transfer-Encoding: 7bit


--15200737140.aa7635DD8.8222
Date: Sat, 3 Mar 2018 10:41:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D75985

--- Comment #37 from Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org> ---
Related to this issue, I've just posted v2 of my patch set to use a device =
link
for power management of GPU-integrated HDA controllers:
https://lists.freedesktop.org/archives/dri-devel/2018-March/168012.html

It would be great if more people could test it. There's a 4.15-based branch
available at:
https://github.com/l1k/linux/commits/switcheroo_devlink_v2

Crucially, this patch lets the HDA controller autosuspend at its own
descretion, rather than forcing it on whenever the GPU is on. It looks like
writing to bit 25 of config space dword 0x488 powergates the HDA controller=
. We
could leverage that to runtime suspend the HDA controller to D3cold. I'll s=
ee
to it that I cook up a patch.

As to the bit being cleared on boot, I think this should be done in a "head=
er"
PCI quirk rather than in nouveau. If you look at pci_scan_slot() and next_f=
n()
in drivers/pci/probe.c, you'll notice that device functions are scanned fro=
m 0
upwards. So the GPU is always scanned first. Just add a PCI quirk which gets
executed for the GPU, sets the bit and then reinitializes the multifunction
flag in the GPU's struct pci_dev, that may already be sufficient. The PCI c=
ore
should do all the rest. See quirk_jmicron_ata() for an example.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15200737140.aa7635DD8.8222
Date: Sat, 3 Mar 2018 10:41:54 +0000
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
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985#c37">Commen=
t # 37</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC1] HDMI audio device only visible after rescan"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D75985">bug 75985<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
lukas&#64;wunner.de" title=3D"Lukas Wunner &lt;lukas&#64;wunner.de&gt;"> <s=
pan class=3D"fn">Lukas Wunner</span></a>
</span></b>
        <pre>Related to this issue, I've just posted v2 of my patch set to =
use a device link
for power management of GPU-integrated HDA controllers:
<a href=3D"https://lists.freedesktop.org/archives/dri-devel/2018-March/1680=
12.html">https://lists.freedesktop.org/archives/dri-devel/2018-March/168012=
.html</a>

It would be great if more people could test it. There's a 4.15-based branch
available at:
<a href=3D"https://github.com/l1k/linux/commits/switcheroo_devlink_v2">http=
s://github.com/l1k/linux/commits/switcheroo_devlink_v2</a>

Crucially, this patch lets the HDA controller autosuspend at its own
descretion, rather than forcing it on whenever the GPU is on. It looks like
writing to bit 25 of config space dword 0x488 powergates the HDA controller=
. We
could leverage that to runtime suspend the HDA controller to D3cold. I'll s=
ee
to it that I cook up a patch.

As to the bit being cleared on boot, I think this should be done in a &quot=
;header&quot;
PCI quirk rather than in nouveau. If you look at pci_scan_slot() and next_f=
n()
in drivers/pci/probe.c, you'll notice that device functions are scanned fro=
m 0
upwards. So the GPU is always scanned first. Just add a PCI quirk which gets
executed for the GPU, sets the bit and then reinitializes the multifunction
flag in the GPU's struct pci_dev, that may already be sufficient. The PCI c=
ore
should do all the rest. See quirk_jmicron_ata() for an example.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15200737140.aa7635DD8.8222--

--===============1567174320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1567174320==--
