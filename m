From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67255] black screen after resuming from Hibernate
Date: Wed, 24 Jul 2013 19:15:14 +0000
Message-ID: <bug-67255-8800-Rv1WamTu4x@http.bugs.freedesktop.org/>
References: <bug-67255-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1612123138=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67255-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1612123138==
Content-Type: multipart/alternative; boundary="1374693314.0F64f42.345"; charset="us-ascii"


--1374693314.0F64f42.345
Date: Wed, 24 Jul 2013 19:15:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67255

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Looks like the interesting bits are below:

[   65.690862] nouveau 0000:01:00.0: power state changed by ACPI to D0
[   65.810949] nouveau  [     DRM] re-enabling device...
[   65.810980] nouveau  [     DRM] resuming kernel object tree...
[   65.810987] nouveau  [   VBIOS][0000:01:00.0] running init tables
[   67.958077] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x1127b8 [ IBUS ]
[   67.958810] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x6101ac [ IBUS ]
[   67.959551] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x6101e4 [ IBUS ]
[   67.960334] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00100010 FAULT
at 0x610028 [ IBUS ]
[   67.960651] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00002000 FAULT
at 0x610260 [ IBUS ]
[   67.960991] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]
[   67.961331] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]
[   67.961615] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]
[   67.961957] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]

The MMIO read errors continue for a LONG time (I guess there's a nv_wait in
there), and then

[   69.960067] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]
[   69.960407] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]
[   69.960747] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]
[   69.960811] nouveau E[   PDISP][0000:01:00.0][0xc000857b][ffff880429852c40]
timeout1: 0x00000000
[   69.960813] nouveau E[   PDISP][0000:01:00.0][0xc000857b][ffff880429852c40]
init failed, -16
[   69.960823] nouveau E[     DRM] 0xdddddddd:0xd1500000 init failed with -16
[   69.961158] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610240 [ IBUS ]
[   69.961227] nouveau E[     DRM] 0xffffffff:0xdddddddd init failed with -16
[   69.961406] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x610028 [ IBUS ]
[   69.961551] nouveau E[     DRM] 0xffffffff:0xffffffff init failed with -16
[   69.961561] nouveau  [     DRM] resuming client object trees...
[   69.961570] nouveau  [   VBIOS][0000:01:00.0] running init tables
[   72.042600] nouveau  [     DRM] resuming display...
[   72.050380] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x6013c0 [ IBUS ]
[   72.050690] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000020 FAULT
at 0x641000 [ IBUS ]
[   72.051066] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000008 FAULT
at 0x640000 [ IBUS ]
[   72.051815] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000018 FAULT
at 0x640000 [ IBUS ]
[   72.052225] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61c004 [ IBUS ]
[   72.052933] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x640000 [ IBUS ]
[   74.053220] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x641000 [ IBUS ]
[   74.053392] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x642000 [ IBUS ]
[   74.053637] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x640000 [ IBUS ]
[   74.053805] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010 FAULT
at 0x640000 [ IBUS ]
[   74.053973] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000008 FAULT
at 0x640000 [ IBUS ]
[   74.054141] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x61cda4 [ IBUS ]
[   74.054309] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x61cd20 [ IBUS ]
[   74.054477] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x61cd00 [ IBUS ]
[   74.054585] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000020 FAULT
at 0x642000 [ IBUS ]
[   74.054704] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x640000 [ IBUS ]
[   74.054872] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000018 FAULT
at 0x640000 [ IBUS ]
[   74.055041] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010 FAULT
at 0x640000 [ IBUS ]
[   74.055213] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0000003c FAULT
at 0x640000 [ IBUS ]
[   74.055382] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000008 FAULT
at 0x640000 [ IBUS ]
[   74.055551] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0000001c FAULT
at 0x640000 [ IBUS ]
[   74.055726] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000008 FAULT
at 0x640000 [ IBUS ]
[   74.055897] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000028 FAULT
at 0x640000 [ IBUS ]
[   74.056005] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61c804 [ IBUS ]
[   74.056176] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x80000001 FAULT
at 0x61c804 [ IBUS ]
[   74.056285] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61c830 [ IBUS ]
[   74.056393] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x640000 [ IBUS ]
[   74.056561] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000008 FAULT
at 0x640000 [ IBUS ]
[   74.056738] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0000001c FAULT
at 0x640000 [ IBUS ]
[   74.056906] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010 FAULT
at 0x640000 [ IBUS ]
[   74.057075] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000008 FAULT
at 0x640000 [ IBUS ]
[   74.057183] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000014 FAULT
at 0x640000 [ IBUS ]
[   76.057471] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x642000 [ IBUS ]
[   76.059212] PM: restore of devices complete after 10247.631 msecs
[   77.339814] PM: Image restored successfully.
[   77.339816] Restarting tasks ... done.
[   77.341184] PM: Basic memory bitmaps freed
[   77.341196] video LNXVIDEO:01: Restoring backlight state
[   77.344360] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x6013c8 [ IBUS ]
[   77.349009] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x641000 [ IBUS ]
[   79.349470] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x640000 [ IBUS ]
[   81.349750] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x641000 [ IBUS ]
[   81.350026] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x642000 [ IBUS ]
[   83.350518] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x640000 [ IBUS ]
[   85.350820] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x642000 [ IBUS ]
[   85.385788] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61a804 [ IBUS ]
[   85.385899] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61a804 [ IBUS ]
[   85.386009] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00100154 FAULT
at 0x61a80c [ IBUS ]
[   85.395493] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x80000000 FAULT
at 0x61a80c [ IBUS ]
[   85.395661] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x61a80c [ IBUS ]
[   85.395770] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x80550000 FAULT
at 0x61a804 [ IBUS ]
[   85.395879] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61a804 [ IBUS ]
[   85.397125] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61a804 [ IBUS ]
[   85.397238] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61a804 [ IBUS ]
[   85.397352] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00100154 FAULT
at 0x61a80c [ IBUS ]
[   85.406839] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x80000000 FAULT
at 0x61a80c [ IBUS ]
[   85.407007] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x61a80c [ IBUS ]
[   85.407178] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x80550000 FAULT
at 0x61a804 [ IBUS ]
[   88.725230] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x03060030 FAULT
at 0x647084 [ IBUS ]

So for some reason the card is just completely screwed on resume. Emil's
suggestion of trying nouveau/master is a good one, there have been a bunch of
register update changes between 3.10 and 3.11, perhaps they magically make this
work again.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374693314.0F64f42.345
Date: Wed, 24 Jul 2013 19:15:14 +0000
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
   title="NEW --- - black screen after resuming from Hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67255#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - black screen after resuming from Hibernate"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67255">bug 67255</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Looks like the interesting bits are below:

[   65.690862] nouveau 0000:01:00.0: power state changed by ACPI to D0
[   65.810949] nouveau  [     DRM] re-enabling device...
[   65.810980] nouveau  [     DRM] resuming kernel object tree...
[   65.810987] nouveau  [   VBIOS][0000:01:00.0] running init tables
[   67.958077] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x1127b8 [ IBUS ]
[   67.958810] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x6101ac [ IBUS ]
[   67.959551] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x6101e4 [ IBUS ]
[   67.960334] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00100010 FAULT
at 0x610028 [ IBUS ]
[   67.960651] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00002000 FAULT
at 0x610260 [ IBUS ]
[   67.960991] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]
[   67.961331] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]
[   67.961615] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]
[   67.961957] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]

The MMIO read errors continue for a LONG time (I guess there's a nv_wait in
there), and then

[   69.960067] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]
[   69.960407] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]
[   69.960747] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610260 [ IBUS ]
[   69.960811] nouveau E[   PDISP][0000:01:00.0][0xc000857b][ffff880429852c40]
timeout1: 0x00000000
[   69.960813] nouveau E[   PDISP][0000:01:00.0][0xc000857b][ffff880429852c40]
init failed, -16
[   69.960823] nouveau E[     DRM] 0xdddddddd:0xd1500000 init failed with -16
[   69.961158] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x610240 [ IBUS ]
[   69.961227] nouveau E[     DRM] 0xffffffff:0xdddddddd init failed with -16
[   69.961406] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x610028 [ IBUS ]
[   69.961551] nouveau E[     DRM] 0xffffffff:0xffffffff init failed with -16
[   69.961561] nouveau  [     DRM] resuming client object trees...
[   69.961570] nouveau  [   VBIOS][0000:01:00.0] running init tables
[   72.042600] nouveau  [     DRM] resuming display...
[   72.050380] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x6013c0 [ IBUS ]
[   72.050690] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000020 FAULT
at 0x641000 [ IBUS ]
[   72.051066] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000008 FAULT
at 0x640000 [ IBUS ]
[   72.051815] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000018 FAULT
at 0x640000 [ IBUS ]
[   72.052225] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61c004 [ IBUS ]
[   72.052933] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x640000 [ IBUS ]
[   74.053220] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x641000 [ IBUS ]
[   74.053392] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x642000 [ IBUS ]
[   74.053637] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x640000 [ IBUS ]
[   74.053805] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010 FAULT
at 0x640000 [ IBUS ]
[   74.053973] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000008 FAULT
at 0x640000 [ IBUS ]
[   74.054141] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x61cda4 [ IBUS ]
[   74.054309] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x61cd20 [ IBUS ]
[   74.054477] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x61cd00 [ IBUS ]
[   74.054585] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000020 FAULT
at 0x642000 [ IBUS ]
[   74.054704] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x640000 [ IBUS ]
[   74.054872] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000018 FAULT
at 0x640000 [ IBUS ]
[   74.055041] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010 FAULT
at 0x640000 [ IBUS ]
[   74.055213] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0000003c FAULT
at 0x640000 [ IBUS ]
[   74.055382] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000008 FAULT
at 0x640000 [ IBUS ]
[   74.055551] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0000001c FAULT
at 0x640000 [ IBUS ]
[   74.055726] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000008 FAULT
at 0x640000 [ IBUS ]
[   74.055897] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000028 FAULT
at 0x640000 [ IBUS ]
[   74.056005] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61c804 [ IBUS ]
[   74.056176] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x80000001 FAULT
at 0x61c804 [ IBUS ]
[   74.056285] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61c830 [ IBUS ]
[   74.056393] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x640000 [ IBUS ]
[   74.056561] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000008 FAULT
at 0x640000 [ IBUS ]
[   74.056738] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x0000001c FAULT
at 0x640000 [ IBUS ]
[   74.056906] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010 FAULT
at 0x640000 [ IBUS ]
[   74.057075] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000008 FAULT
at 0x640000 [ IBUS ]
[   74.057183] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000014 FAULT
at 0x640000 [ IBUS ]
[   76.057471] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x642000 [ IBUS ]
[   76.059212] PM: restore of devices complete after 10247.631 msecs
[   77.339814] PM: Image restored successfully.
[   77.339816] Restarting tasks ... done.
[   77.341184] PM: Basic memory bitmaps freed
[   77.341196] video LNXVIDEO:01: Restoring backlight state
[   77.344360] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x6013c8 [ IBUS ]
[   77.349009] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x641000 [ IBUS ]
[   79.349470] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x640000 [ IBUS ]
[   81.349750] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x641000 [ IBUS ]
[   81.350026] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x642000 [ IBUS ]
[   83.350518] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x640000 [ IBUS ]
[   85.350820] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x642000 [ IBUS ]
[   85.385788] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61a804 [ IBUS ]
[   85.385899] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61a804 [ IBUS ]
[   85.386009] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00100154 FAULT
at 0x61a80c [ IBUS ]
[   85.395493] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x80000000 FAULT
at 0x61a80c [ IBUS ]
[   85.395661] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x61a80c [ IBUS ]
[   85.395770] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x80550000 FAULT
at 0x61a804 [ IBUS ]
[   85.395879] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61a804 [ IBUS ]
[   85.397125] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61a804 [ IBUS ]
[   85.397238] nouveau E[    PBUS][0000:01:00.0] MMIO read of 0x00000000 FAULT
at 0x61a804 [ IBUS ]
[   85.397352] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00100154 FAULT
at 0x61a80c [ IBUS ]
[   85.406839] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x80000000 FAULT
at 0x61a80c [ IBUS ]
[   85.407007] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x61a80c [ IBUS ]
[   85.407178] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x80550000 FAULT
at 0x61a804 [ IBUS ]
[   88.725230] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x03060030 FAULT
at 0x647084 [ IBUS ]

So for some reason the card is just completely screwed on resume. Emil's
suggestion of trying nouveau/master is a good one, there have been a bunch of
register update changes between 3.10 and 3.11, perhaps they magically make this
work again.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374693314.0F64f42.345--

--===============1612123138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1612123138==--
