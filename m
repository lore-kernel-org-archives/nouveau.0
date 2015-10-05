From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92274] nouveau black screen and errors with two
 monitors attached
Date: Mon, 05 Oct 2015 17:27:01 +0000
Message-ID: <bug-92274-8800-IUvNHl49TP@http.bugs.freedesktop.org/>
References: <bug-92274-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1182138210=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92274-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1182138210==
Content-Type: multipart/alternative; boundary="1444066021.46dC3AeD2.13323"; charset="UTF-8"


--1444066021.46dC3AeD2.13323
Date: Mon, 5 Oct 2015 17:27:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92274

--- Comment #6 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
In your first dmesg, you have:

video=HDMI-0:e video=DVI-I-1:e

Are these required for something? Force-enabling this stuff just leads to
trouble down the line.

Interesting....

[    8.872612] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x690400 [ IBUS ]
[    8.872781] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0xbadf1001 FAULT
at 0x690400 [ IBUS ]
[    8.872869] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x6904c0 [ IBUS ]
[    8.873043] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0xbadf1001 FAULT
at 0x6904c0 [ IBUS ]

in drm/nouveau/nvkm/engine/disp/hdmigk104.c:

        /* AVI InfoFrame */
        nvkm_mask(device, 0x690000 + hdmi, 0x00000001, 0x00000000);
        nvkm_wr32(device, 0x690008 + hdmi, 0x000d0282);
        nvkm_wr32(device, 0x69000c + hdmi, 0x0000006f);
        nvkm_wr32(device, 0x690010 + hdmi, 0x00000000);
        nvkm_wr32(device, 0x690014 + hdmi, 0x00000000);
        nvkm_wr32(device, 0x690018 + hdmi, 0x00000000);
        nvkm_mask(device, 0x690000 + hdmi, 0x00000001, 0x00000001);

        /* ??? InfoFrame? */
        nvkm_mask(device, 0x6900c0 + hdmi, 0x00000001, 0x00000000);
        nvkm_wr32(device, 0x6900cc + hdmi, 0x00000010);
        nvkm_mask(device, 0x6900c0 + hdmi, 0x00000001, 0x00000001);

690000 + hdmi / 6900c0 + hdmi each get 2 reads/writes, but you only see one
error, both times on the enable. I wonder if this code doesn't need to be more
like

u32 foo = nvkm_rd32(device, 0x690000 + hdmi);
nvkm_wr32(device, 0x690000 + hdmi, foo & ~1);
...
nvkm_wr32(device, 0x690000 + hdmi, foo | 1);

and same sort of thing for the second section. Are comfortable enough with code
to try this on your own, or do you need patches?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1444066021.46dC3AeD2.13323
Date: Mon, 5 Oct 2015 17:27:01 +0000
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
   title="NEW - nouveau black screen and errors with two monitors attached"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92274#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau black screen and errors with two monitors attached"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92274">bug 92274</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>In your first dmesg, you have:

video=HDMI-0:e video=DVI-I-1:e

Are these required for something? Force-enabling this stuff just leads to
trouble down the line.

Interesting....

[    8.872612] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x690400 [ IBUS ]
[    8.872781] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0xbadf1001 FAULT
at 0x690400 [ IBUS ]
[    8.872869] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x6904c0 [ IBUS ]
[    8.873043] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0xbadf1001 FAULT
at 0x6904c0 [ IBUS ]

in drm/nouveau/nvkm/engine/disp/hdmigk104.c:

        /* AVI InfoFrame */
        nvkm_mask(device, 0x690000 + hdmi, 0x00000001, 0x00000000);
        nvkm_wr32(device, 0x690008 + hdmi, 0x000d0282);
        nvkm_wr32(device, 0x69000c + hdmi, 0x0000006f);
        nvkm_wr32(device, 0x690010 + hdmi, 0x00000000);
        nvkm_wr32(device, 0x690014 + hdmi, 0x00000000);
        nvkm_wr32(device, 0x690018 + hdmi, 0x00000000);
        nvkm_mask(device, 0x690000 + hdmi, 0x00000001, 0x00000001);

        /* ??? InfoFrame? */
        nvkm_mask(device, 0x6900c0 + hdmi, 0x00000001, 0x00000000);
        nvkm_wr32(device, 0x6900cc + hdmi, 0x00000010);
        nvkm_mask(device, 0x6900c0 + hdmi, 0x00000001, 0x00000001);

690000 + hdmi / 6900c0 + hdmi each get 2 reads/writes, but you only see one
error, both times on the enable. I wonder if this code doesn't need to be more
like

u32 foo = nvkm_rd32(device, 0x690000 + hdmi);
nvkm_wr32(device, 0x690000 + hdmi, foo &amp; ~1);
...
nvkm_wr32(device, 0x690000 + hdmi, foo | 1);

and same sort of thing for the second section. Are comfortable enough with code
to try this on your own, or do you need patches?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444066021.46dC3AeD2.13323--

--===============1182138210==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1182138210==--
