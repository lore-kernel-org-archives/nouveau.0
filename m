From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99482] nouveau driver returns -16 trying to hibernate
Date: Sat, 27 May 2017 18:04:47 +0000
Message-ID: <bug-99482-8800-bbzORPB14E@http.bugs.freedesktop.org/>
References: <bug-99482-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0173090710=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99482-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0173090710==
Content-Type: multipart/alternative; boundary="14959082870.824fCe43.12884";
 charset="UTF-8"


--14959082870.824fCe43.12884
Date: Sat, 27 May 2017 18:04:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99482

--- Comment #1 from dr_bugzilla-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org ---
I confirm this bug on Xubuntu 16.04 Xenial, when using a new mainline kernel
from PPA (4.11.3-041103-generic) rather than the stock kernel. My laptop has
hybrid Intel/Nvidia graphics. Any attempts to hibernate (in my case, using
uswsusp's s2disk) fail, with control being returned to the GUI. In the kern=
el
log, I see the same messages as Brian does, specifically:

May 25 17:18:13 *** kernel: [ 3356.651761] nouveau 0000:01:00.0: DRM: evict=
ing
buffers...
May 25 17:18:13 *** kernel: [ 3356.651765] nouveau 0000:01:00.0: DRM: waiti=
ng
for kernel channels to go idle...
May 25 17:18:13 *** kernel: [ 3371.651076] nouveau 0000:01:00.0: DRM: faile=
d to
idle channel 0 [DRM]
May 25 17:18:13 *** kernel: [ 3371.651132] pci_pm_freeze():
nouveau_pmops_freeze+0x0/0x20 [nouveau] returns -16
May 25 17:18:13 *** kernel: [ 3371.651134] dpm_run_callback():
pci_pm_freeze+0x0/0xf0 returns -16
May 25 17:18:13 *** kernel: [ 3371.651136] PM: Device 0000:01:00.0 failed to
freeze async: error -16

With the older stock kernel (4.4.0-78-generic), I think that the underlying
cause of this bug was having an effect, even though I did not see these ker=
nel
messages. I say this because hibernation with the older kernel would fail a=
bout
25% of the time, hanging the system completely (hard power-off required, all
work was lost). I believe now that this would happen because the kernel was=
 not
able to idle nouveau but just continued the attempt to hibernate anyway.=20
Also, even when hibernate succeeded, my laptop would not actually power off
when writing 'platform' to /sys/power/disk; I would either have to hold the
power button down or set /sys/power/disk to 'shutdown' instead. Again, I th=
ink
this was happening because nouveau was not being properly idled.

When I blacklist nouveau and use only Intel graphics (i915), hibernation al=
ways
works (including powering off the laptop automatically).

My nouveau is stock Xenial (version 1.0.12-1build2 of package
xserver-xorg-video-nouveau).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14959082870.824fCe43.12884
Date: Sat, 27 May 2017 18:04:47 +0000
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
   title=3D"NEW - nouveau driver returns -16 trying to hibernate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99482#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau driver returns -16 trying to hibernate"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99482">bug 99482<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dr_bugzilla&#64;protonmail.com" title=3D"dr_bugzilla&#64;protonmail.com">dr=
_bugzilla&#64;protonmail.com</a>
</span></b>
        <pre>I confirm this bug on Xubuntu 16.04 Xenial, when using a new m=
ainline kernel
from PPA (4.11.3-041103-generic) rather than the stock kernel. My laptop has
hybrid Intel/Nvidia graphics. Any attempts to hibernate (in my case, using
uswsusp's s2disk) fail, with control being returned to the GUI. In the kern=
el
log, I see the same messages as Brian does, specifically:

May 25 17:18:13 *** kernel: [ 3356.651761] nouveau 0000:01:00.0: DRM: evict=
ing
buffers...
May 25 17:18:13 *** kernel: [ 3356.651765] nouveau 0000:01:00.0: DRM: waiti=
ng
for kernel channels to go idle...
May 25 17:18:13 *** kernel: [ 3371.651076] nouveau 0000:01:00.0: DRM: faile=
d to
idle channel 0 [DRM]
May 25 17:18:13 *** kernel: [ 3371.651132] pci_pm_freeze():
nouveau_pmops_freeze+0x0/0x20 [nouveau] returns -16
May 25 17:18:13 *** kernel: [ 3371.651134] dpm_run_callback():
pci_pm_freeze+0x0/0xf0 returns -16
May 25 17:18:13 *** kernel: [ 3371.651136] PM: Device 0000:01:00.0 failed to
freeze async: error -16

With the older stock kernel (4.4.0-78-generic), I think that the underlying
cause of this bug was having an effect, even though I did not see these ker=
nel
messages. I say this because hibernation with the older kernel would fail a=
bout
25% of the time, hanging the system completely (hard power-off required, all
work was lost). I believe now that this would happen because the kernel was=
 not
able to idle nouveau but just continued the attempt to hibernate anyway.=20
Also, even when hibernate succeeded, my laptop would not actually power off
when writing 'platform' to /sys/power/disk; I would either have to hold the
power button down or set /sys/power/disk to 'shutdown' instead. Again, I th=
ink
this was happening because nouveau was not being properly idled.

When I blacklist nouveau and use only Intel graphics (i915), hibernation al=
ways
works (including powering off the laptop automatically).

My nouveau is stock Xenial (version 1.0.12-1build2 of package
xserver-xorg-video-nouveau).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14959082870.824fCe43.12884--

--===============0173090710==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0173090710==--
