From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 72180] [NVE6] Random GPU Lockups,
	works with blob PGRAPH fw
Date: Sat, 07 Nov 2015 21:48:37 +0000
Message-ID: <bug-72180-8800-czzlguWvRQ@http.bugs.freedesktop.org/>
References: <bug-72180-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0912002866=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-72180-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0912002866==
Content-Type: multipart/alternative; boundary="1446932917.def04.25168"; charset="UTF-8"


--1446932917.def04.25168
Date: Sat, 7 Nov 2015 21:48:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=72180

--- Comment #43 from xenith-bjxz+0elTSj2eFz/2MeuCQ@public.gmane.org ---
I am definitely having this same bug all the way up to kernel version 4.4

Was using proprietary drivers for this reason on Fedora 22, and since the
release of 23 I've been attempting diligently to only use nouveau. 

With firmware that I extracted from 340 it will run for a while so long as
nothing GL intensive is done. One way I can always reproduce the issue is to
load Kodi, play a video, then stop the video and just let it sit open. 

VDPAU seems to be an aggrivating factor here, as that nearly always crashes the
drier. Even after removing the firmware from /lib/firmware though, the problem
still happens. (even if your player doesn't attempt to use VDPAU)

The following message is from the latest 4.4 kernel in rawhide, running on top
of Fedora 23: 

[  288.888692] nouveau 0000:01:00.0: gr: TRAP ch 5 [023f929000 kodi.bin[3240]]
[  288.888704] nouveau 0000:01:00.0: gr: GPC1/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 000d [GPR_OUT_OF_BOUNDS]
[  288.888710] nouveau 0000:01:00.0: gr: GPC1/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 4000d [GPR_OUT_OF_BOUNDS]
[  288.888726] nouveau 0000:01:00.0: fifo: write fault at 0003846000 engine 00
[GR] client 0f [GPC1/PROP_0] reason 02 [PTE] on channel 5 [023f929000
kodi.bin[3240]]
[  288.888728] nouveau 0000:01:00.0: fifo: gr engine fault on channel 5,
recovering...


While that might not seem related, remember that my initial issues were
identical to this aging bug. Without proprietary firmware loading, it usually
is some kind of PGRAPH error, with it loaded it is usually some kind of PFIFO
error; they vary. The consistent part is that it _always_ crashes with nouveau. 

I have a GTX660SC from EVGA - and I would look more closely at EVGA cards if I
were you. My cursory scouring of the internet to try and fix this has led me to
believe that i'm seeing EVGA cards more often than not, and I'm not sure anyone
has yet made that connection yet. Also, the (SC) stands for super-clock, as in
factory overclocked. I suspect this may have something to do with it.

The version of the nouveau module is as follows, and I also upgraded 'mesa-*'
and 'linux-firmware' and 'xorg-x11-drv-nouveau' to the latest rawhide versions
to, thinking that might have some additional benefits, but the same issues
occur. This is simply NOT fixed in the most recent version of code anywhere.


filename:      
/lib/modules/4.4.0-0.rc0.git2.1.fc24.x86_64/kernel/drivers/gpu/drm/nouveau/nouveau.ko.xz
license:        GPL and additional rights
description:    nVidia Riva/TNT/GeForce/Quadro/Tesla
author:         Nouveau Project
alias:          pci:v000012D2d*sv*sd*bc03sc*i*VRAM
alias:          pci:v000010DEd*sv*sd*bc03sc*i*
depends:        drm,drm_kms_helper,ttm,mxm-wmi,wmi,video,i2c-algo-bit
intree:         Y
vermagic:       4.4.0-0.rc0.git2.1.fc24.x86_64 SMP mod_unload 


mesa versions tried: up to 1.11.1-devel

I will also being attaching my vbios.rom

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446932917.def04.25168
Date: Sat, 7 Nov 2015 21:48:37 +0000
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
   title="NEW - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180#c43">Comment # 43</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE6] Random GPU Lockups, works with blob PGRAPH fw"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=72180">bug 72180</a>
              from <span class="vcard"><a class="email" href="mailto:xenith&#64;overtmind.com" title="xenith&#64;overtmind.com">xenith&#64;overtmind.com</a>
</span></b>
        <pre>I am definitely having this same bug all the way up to kernel version 4.4

Was using proprietary drivers for this reason on Fedora 22, and since the
release of 23 I've been attempting diligently to only use nouveau. 

With firmware that I extracted from 340 it will run for a while so long as
nothing GL intensive is done. One way I can always reproduce the issue is to
load Kodi, play a video, then stop the video and just let it sit open. 

VDPAU seems to be an aggrivating factor here, as that nearly always crashes the
drier. Even after removing the firmware from /lib/firmware though, the problem
still happens. (even if your player doesn't attempt to use VDPAU)

The following message is from the latest 4.4 kernel in rawhide, running on top
of Fedora 23: 

[  288.888692] nouveau 0000:01:00.0: gr: TRAP ch 5 [023f929000 kodi.bin[3240]]
[  288.888704] nouveau 0000:01:00.0: gr: GPC1/TPC0/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 000d [GPR_OUT_OF_BOUNDS]
[  288.888710] nouveau 0000:01:00.0: gr: GPC1/TPC1/MP trap: global 00000004
[MULTIPLE_WARP_ERRORS] warp 4000d [GPR_OUT_OF_BOUNDS]
[  288.888726] nouveau 0000:01:00.0: fifo: write fault at 0003846000 engine 00
[GR] client 0f [GPC1/PROP_0] reason 02 [PTE] on channel 5 [023f929000
kodi.bin[3240]]
[  288.888728] nouveau 0000:01:00.0: fifo: gr engine fault on channel 5,
recovering...


While that might not seem related, remember that my initial issues were
identical to this aging bug. Without proprietary firmware loading, it usually
is some kind of PGRAPH error, with it loaded it is usually some kind of PFIFO
error; they vary. The consistent part is that it _always_ crashes with nouveau. 

I have a GTX660SC from EVGA - and I would look more closely at EVGA cards if I
were you. My cursory scouring of the internet to try and fix this has led me to
believe that i'm seeing EVGA cards more often than not, and I'm not sure anyone
has yet made that connection yet. Also, the (SC) stands for super-clock, as in
factory overclocked. I suspect this may have something to do with it.

The version of the nouveau module is as follows, and I also upgraded 'mesa-*'
and 'linux-firmware' and 'xorg-x11-drv-nouveau' to the latest rawhide versions
to, thinking that might have some additional benefits, but the same issues
occur. This is simply NOT fixed in the most recent version of code anywhere.


filename:      
/lib/modules/4.4.0-0.rc0.git2.1.fc24.x86_64/kernel/drivers/gpu/drm/nouveau/nouveau.ko.xz
license:        GPL and additional rights
description:    nVidia Riva/TNT/GeForce/Quadro/Tesla
author:         Nouveau Project
alias:          pci:v000012D2d*sv*sd*bc03sc*i*VRAM
alias:          pci:v000010DEd*sv*sd*bc03sc*i*
depends:        drm,drm_kms_helper,ttm,mxm-wmi,wmi,video,i2c-algo-bit
intree:         Y
vermagic:       4.4.0-0.rc0.git2.1.fc24.x86_64 SMP mod_unload 


mesa versions tried: up to 1.11.1-devel

I will also being attaching my vbios.rom</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446932917.def04.25168--

--===============0912002866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0912002866==--
