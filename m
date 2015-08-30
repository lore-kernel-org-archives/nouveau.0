From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91779] Pure EFI: MacBookPro3,
 1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents
Date: Sun, 30 Aug 2015 06:31:52 +0000
Message-ID: <bug-91779-8800-70wZrSn4y7@http.bugs.freedesktop.org/>
References: <bug-91779-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0832093182=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91779-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0832093182==
Content-Type: multipart/alternative; boundary="1440916312.Bb66C71.13805"; charset="UTF-8"


--1440916312.Bb66C71.13805
Date: Sun, 30 Aug 2015 06:31:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91779

--- Comment #7 from Jeremy Huddleston <jeremyhu-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> ---
> I'd file a new one

OK.  Forked off to bug #91804 then.  I was just thinking that getting this
configuration to work might just not be supported, but if you want to keep
heading down this path, I'm definitely game.

In this configuration, 'sudo modprobe nouveau debug=VBIOS=debug' results in:

Aug 29 23:19:45 wedge kernel: [  294.071101] [drm] Initialized drm 1.1.0
20060810
Aug 29 23:19:45 wedge kernel: [  294.127783] wmi: Mapper loaded
Aug 29 23:19:46 wedge kernel: [  294.190330] checking generic (c0030000 710000)
vs hw (c0000000 10000000)
Aug 29 23:19:46 wedge kernel: [  294.190337] fb: conflicting fb hw usage
nouveaufb vs EFI VGA - removing generic driver
Aug 29 23:19:46 wedge kernel: [  294.190449] Console: switching to colour dummy
device 80x25
Aug 29 23:19:46 wedge kernel: [  294.191803] nouveau 0000:01:00.0: enabling
device (0006 -> 0007)
Aug 29 23:19:46 wedge kernel: [  294.192979] [drm] hdmi device  not found 1 0 1
Aug 29 23:19:46 wedge kernel: [  294.193257] nouveau  [  DEVICE][0000:01:00.0]
BOOT0  : 0x084700a2
Aug 29 23:19:46 wedge kernel: [  294.193260] nouveau  [  DEVICE][0000:01:00.0]
Chipset: G84 (NV84)
Aug 29 23:19:46 wedge kernel: [  294.193262] nouveau  [  DEVICE][0000:01:00.0]
Family : NV50
Aug 29 23:19:46 wedge kernel: [  294.196982] nouveau  [   VBIOS][0000:01:00.0]
checking PRAMIN for image...
Aug 29 23:19:46 wedge kernel: [  294.196990] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.196992] nouveau  [   VBIOS][0000:01:00.0]
checking PROM for image...
Aug 29 23:19:46 wedge kernel: [  294.197010] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197012] nouveau  [   VBIOS][0000:01:00.0]
checking ACPI for image...
Aug 29 23:19:46 wedge kernel: [  294.197017] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197019] nouveau  [   VBIOS][0000:01:00.0]
checking PCIROM for image...
Aug 29 23:19:46 wedge kernel: [  294.197070] nouveau 0000:01:00.0: Invalid ROM
contents
Aug 29 23:19:46 wedge kernel: [  294.197084] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197087] nouveau  [   VBIOS][0000:01:00.0]
checking PLATFORM for image...
Aug 29 23:19:46 wedge kernel: [  294.197089] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197091] nouveau E[   VBIOS][0000:01:00.0]
unable to locate usable image
Aug 29 23:19:46 wedge kernel: [  294.197095] nouveau E[  DEVICE][0000:01:00.0]
failed to create 0x10000001, -22
Aug 29 23:19:46 wedge kernel: [  294.197098] nouveau E[     DRM] failed to
create 0x80000080, -22
Aug 29 23:19:46 wedge kernel: [  294.197627] nouveau: probe of 0000:01:00.0
failed with error -22

Note that this was done with a slightly older kernel than originally reported
with, 3.13.0-62-generic from recent Ubuntu 14.04.3.

> /sys/kernel/debug/dri/0/vbios.rom

Excellent, thanks.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1440916312.Bb66C71.13805
Date: Sun, 30 Aug 2015 06:31:52 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Pure EFI: MacBookPro3,1 (NV84) fails to load nouveau on linux 4.1 -- Invalid ROM contents"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91779">bug 91779</a>
              from <span class="vcard"><a class="email" href="mailto:jeremyhu&#64;freedesktop.org" title="Jeremy Huddleston &lt;jeremyhu&#64;freedesktop.org&gt;"> <span class="fn">Jeremy Huddleston</span></a>
</span></b>
        <pre><span class="quote">&gt; I'd file a new one</span >

OK.  Forked off to <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau kernel drive should not steal fb until after getting vbios"
   href="show_bug.cgi?id=91804">bug #91804</a> then.  I was just thinking that getting this
configuration to work might just not be supported, but if you want to keep
heading down this path, I'm definitely game.

In this configuration, 'sudo modprobe nouveau debug=VBIOS=debug' results in:

Aug 29 23:19:45 wedge kernel: [  294.071101] [drm] Initialized drm 1.1.0
20060810
Aug 29 23:19:45 wedge kernel: [  294.127783] wmi: Mapper loaded
Aug 29 23:19:46 wedge kernel: [  294.190330] checking generic (c0030000 710000)
vs hw (c0000000 10000000)
Aug 29 23:19:46 wedge kernel: [  294.190337] fb: conflicting fb hw usage
nouveaufb vs EFI VGA - removing generic driver
Aug 29 23:19:46 wedge kernel: [  294.190449] Console: switching to colour dummy
device 80x25
Aug 29 23:19:46 wedge kernel: [  294.191803] nouveau 0000:01:00.0: enabling
device (0006 -&gt; 0007)
Aug 29 23:19:46 wedge kernel: [  294.192979] [drm] hdmi device  not found 1 0 1
Aug 29 23:19:46 wedge kernel: [  294.193257] nouveau  [  DEVICE][0000:01:00.0]
BOOT0  : 0x084700a2
Aug 29 23:19:46 wedge kernel: [  294.193260] nouveau  [  DEVICE][0000:01:00.0]
Chipset: G84 (NV84)
Aug 29 23:19:46 wedge kernel: [  294.193262] nouveau  [  DEVICE][0000:01:00.0]
Family : NV50
Aug 29 23:19:46 wedge kernel: [  294.196982] nouveau  [   VBIOS][0000:01:00.0]
checking PRAMIN for image...
Aug 29 23:19:46 wedge kernel: [  294.196990] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.196992] nouveau  [   VBIOS][0000:01:00.0]
checking PROM for image...
Aug 29 23:19:46 wedge kernel: [  294.197010] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197012] nouveau  [   VBIOS][0000:01:00.0]
checking ACPI for image...
Aug 29 23:19:46 wedge kernel: [  294.197017] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197019] nouveau  [   VBIOS][0000:01:00.0]
checking PCIROM for image...
Aug 29 23:19:46 wedge kernel: [  294.197070] nouveau 0000:01:00.0: Invalid ROM
contents
Aug 29 23:19:46 wedge kernel: [  294.197084] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197087] nouveau  [   VBIOS][0000:01:00.0]
checking PLATFORM for image...
Aug 29 23:19:46 wedge kernel: [  294.197089] nouveau  [   VBIOS][0000:01:00.0]
... signature not found
Aug 29 23:19:46 wedge kernel: [  294.197091] nouveau E[   VBIOS][0000:01:00.0]
unable to locate usable image
Aug 29 23:19:46 wedge kernel: [  294.197095] nouveau E[  DEVICE][0000:01:00.0]
failed to create 0x10000001, -22
Aug 29 23:19:46 wedge kernel: [  294.197098] nouveau E[     DRM] failed to
create 0x80000080, -22
Aug 29 23:19:46 wedge kernel: [  294.197627] nouveau: probe of 0000:01:00.0
failed with error -22

Note that this was done with a slightly older kernel than originally reported
with, 3.13.0-62-generic from recent Ubuntu 14.04.3.

<span class="quote">&gt; /sys/kernel/debug/dri/0/vbios.rom</span >

Excellent, thanks.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1440916312.Bb66C71.13805--

--===============0832093182==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0832093182==--
