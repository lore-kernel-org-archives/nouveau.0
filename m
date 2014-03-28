From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Fri, 28 Mar 2014 12:22:04 +0000
Message-ID: <bug-76732-8800-2FfHii0jdt@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1333673904=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76732-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1333673904==
Content-Type: multipart/alternative; boundary="1396009324.BB0EcBa1.20401"; charset="us-ascii"


--1396009324.BB0EcBa1.20401
Date: Fri, 28 Mar 2014 12:22:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #6 from patrick.clara-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
As requested by Ilia Mirkin I tryed booting with nouveau.debug=debug and
drm.debug=0xe.

Here a chunk of the output it continuously repeats

[   25.732112] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 1: 0x00000050 16
[   25.732399] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x58565600
[   25.732404] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30543631
[   25.732409] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.732414] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.732429] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000000 8
[   25.732646] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00040a11
[   25.732652] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.732657] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.732662] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.732668] nouveau  [     DRM] display: 4x270000 dpcd 0x11
[   25.732669] nouveau  [     DRM] encoder: 4x270000
[   25.732670] nouveau  [     DRM] maximum: 4x270000
[   25.732672] [drm:drm_helper_hpd_irq_event], [CONNECTOR:17:eDP-1] status
updated from connected to connected
[   25.733745] [drm:drm_helper_hpd_irq_event], [CONNECTOR:21:HDMI-A-1] status
updated from disconnected to disconnected
[   25.733753] nouveau  [     DRM] plugged eDP-1
[   25.733765] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 4: 0x00000050 1
[   25.733786] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.733787] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.733788] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.733790] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.733942] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 1: 0x00000050 1
[   25.734113] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00040a00
[   25.734118] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.734121] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.734127] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.734141] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 4: 0x00000050 1
[   25.734155] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734156] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734158] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734159] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734313] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 1: 0x00000050 1
[   25.734475] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00040a00
[   25.734480] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.734486] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.734491] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.734505] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 4: 0x00000050 1
[   25.734526] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734527] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734528] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734530] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734681] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.734967] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xffffff00
[   25.734973] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00ffffff
[   25.734975] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x96a2a934
[   25.734981] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.734987] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.735273] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x040117ff
[   25.735278] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x781322a0
[   25.735284] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xa7a11202
[   25.735289] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x26995354
[   25.735295] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.735575] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0054500b
[   25.735581] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010000
[   25.735586] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[   25.735592] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[   25.735607] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.735895] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[   25.735901] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x762a0101
[   25.735905] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x54b0c440
[   25.735911] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x042c6014
[   25.735916] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.736203] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xc1580091
[   25.736209] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x1e000010
[   25.736214] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xc440762a
[   25.736220] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x615b54b0
[   25.736225] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.736507] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0091042c
[   25.736512] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0010c158
[   25.736518] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00001e00
[   25.736523] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x2a00fd00
[   25.736529] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.736815] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x1e64603d
[   25.736821] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x20200a01
[   25.736825] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x20202020
[   25.736831] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xfc000000
[   25.736836] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 1: 0x00000050 16
[   25.737123] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x58565600
[   25.737129] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30543631
[   25.737134] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.737140] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.737153] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000000 8
[   25.737381] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00040a11
[   25.737390] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.737398] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.737406] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.737410] nouveau  [     DRM] display: 4x270000 dpcd 0x11
[   25.737411] nouveau  [     DRM] encoder: 4x270000
[   25.737412] nouveau  [     DRM] maximum: 4x270000
[   25.737414] [drm:drm_helper_hpd_irq_event], [CONNECTOR:17:eDP-1] status
updated from connected to connected
[   25.738486] [drm:drm_helper_hpd_irq_event], [CONNECTOR:21:HDMI-A-1] status
updated from disconnected to disconnected
[   25.738492] nouveau  [     DRM] plugged eDP-1
[   25.738504] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 4: 0x00000050 1
[   25.738525] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.738526] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.738528] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.738529] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.738681] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 1: 0x00000050 1
[   25.738852] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00040a00
[   25.738857] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.738860] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.738866] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.738880] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 4: 0x00000050 1
[   25.738894] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.738896] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.738897] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.738898] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.739052] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 1: 0x00000050 1
[   25.739214] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00040a00
[   25.739220] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.739225] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.739231] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.739244] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 4: 0x00000050 1
[   25.739265] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.739266] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.739268] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.739269] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.739421] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.739705] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xffffff00
[   25.739711] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00ffffff
[   25.739716] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x96a2a934
[   25.739722] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.739727] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.740009] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x040117ff
[   25.740014] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x781322a0
[   25.740019] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xa7a11202
[   25.740025] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x26995354
[   25.740030] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.740317] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0054500b
[   25.740323] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010000
[   25.740327] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[   25.740333] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[   25.740339] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.740625] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[   25.740631] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x762a0101
[   25.740636] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x54b0c440
[   25.740642] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x042c6014
[   25.740647] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.740929] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xc1580091
[   25.740934] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x1e000010
[   25.740940] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xc440762a
[   25.740945] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x615b54b0
[   25.740951] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.741237] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0091042c
[   25.741243] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0010c158
[   25.741247] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00001e00
[   25.741253] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x2a00fd00
[   25.741258] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.741544] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x1e64603d
[   25.741550] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x20200a01
[   25.741555] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x20202020
[   25.741561] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xfc000000

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396009324.BB0EcBa1.20401
Date: Fri, 28 Mar 2014 12:22:04 +0000
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
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:patrick.clara&#64;gmail.com" title="patrick.clara&#64;gmail.com">patrick.clara&#64;gmail.com</a>
</span></b>
        <pre>As requested by Ilia Mirkin I tryed booting with nouveau.debug=debug and
drm.debug=0xe.

Here a chunk of the output it continuously repeats

[   25.732112] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 1: 0x00000050 16
[   25.732399] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x58565600
[   25.732404] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30543631
[   25.732409] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.732414] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.732429] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000000 8
[   25.732646] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00040a11
[   25.732652] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.732657] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.732662] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.732668] nouveau  [     DRM] display: 4x270000 dpcd 0x11
[   25.732669] nouveau  [     DRM] encoder: 4x270000
[   25.732670] nouveau  [     DRM] maximum: 4x270000
[   25.732672] [drm:drm_helper_hpd_irq_event], [CONNECTOR:17:eDP-1] status
updated from connected to connected
[   25.733745] [drm:drm_helper_hpd_irq_event], [CONNECTOR:21:HDMI-A-1] status
updated from disconnected to disconnected
[   25.733753] nouveau  [     DRM] plugged eDP-1
[   25.733765] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 4: 0x00000050 1
[   25.733786] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.733787] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.733788] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.733790] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.733942] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 1: 0x00000050 1
[   25.734113] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00040a00
[   25.734118] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.734121] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.734127] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.734141] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 4: 0x00000050 1
[   25.734155] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734156] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734158] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734159] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734313] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 1: 0x00000050 1
[   25.734475] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00040a00
[   25.734480] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.734486] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.734491] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.734505] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 4: 0x00000050 1
[   25.734526] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734527] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734528] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734530] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.734681] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.734967] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xffffff00
[   25.734973] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00ffffff
[   25.734975] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x96a2a934
[   25.734981] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.734987] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.735273] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x040117ff
[   25.735278] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x781322a0
[   25.735284] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xa7a11202
[   25.735289] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x26995354
[   25.735295] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.735575] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0054500b
[   25.735581] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010000
[   25.735586] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[   25.735592] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[   25.735607] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.735895] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[   25.735901] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x762a0101
[   25.735905] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x54b0c440
[   25.735911] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x042c6014
[   25.735916] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.736203] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xc1580091
[   25.736209] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x1e000010
[   25.736214] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xc440762a
[   25.736220] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x615b54b0
[   25.736225] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.736507] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0091042c
[   25.736512] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0010c158
[   25.736518] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00001e00
[   25.736523] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x2a00fd00
[   25.736529] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.736815] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x1e64603d
[   25.736821] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x20200a01
[   25.736825] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x20202020
[   25.736831] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xfc000000
[   25.736836] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 1: 0x00000050 16
[   25.737123] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x58565600
[   25.737129] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30543631
[   25.737134] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.737140] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.737153] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 9: 0x00000000 8
[   25.737381] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00040a11
[   25.737390] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.737398] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.737406] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.737410] nouveau  [     DRM] display: 4x270000 dpcd 0x11
[   25.737411] nouveau  [     DRM] encoder: 4x270000
[   25.737412] nouveau  [     DRM] maximum: 4x270000
[   25.737414] [drm:drm_helper_hpd_irq_event], [CONNECTOR:17:eDP-1] status
updated from connected to connected
[   25.738486] [drm:drm_helper_hpd_irq_event], [CONNECTOR:21:HDMI-A-1] status
updated from disconnected to disconnected
[   25.738492] nouveau  [     DRM] plugged eDP-1
[   25.738504] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 4: 0x00000050 1
[   25.738525] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.738526] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.738528] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.738529] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.738681] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 1: 0x00000050 1
[   25.738852] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00040a00
[   25.738857] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.738860] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.738866] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.738880] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 4: 0x00000050 1
[   25.738894] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.738896] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.738897] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.738898] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.739052] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 1: 0x00000050 1
[   25.739214] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00040a00
[   25.739220] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.739225] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x30443031
[   25.739231] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x6d000a30
[   25.739244] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 4: 0x00000050 1
[   25.739265] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.739266] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.739268] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.739269] nouveau D[     I2C][0000:01:00.0] AUXCH(1): wr 0x00000000
[   25.739421] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.739705] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xffffff00
[   25.739711] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00ffffff
[   25.739716] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x96a2a934
[   25.739722] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00000000
[   25.739727] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.740009] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x040117ff
[   25.740014] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x781322a0
[   25.740019] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xa7a11202
[   25.740025] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x26995354
[   25.740030] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.740317] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0054500b
[   25.740323] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010000
[   25.740327] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[   25.740333] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[   25.740339] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.740625] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x01010101
[   25.740631] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x762a0101
[   25.740636] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x54b0c440
[   25.740642] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x042c6014
[   25.740647] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.740929] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xc1580091
[   25.740934] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x1e000010
[   25.740940] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xc440762a
[   25.740945] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x615b54b0
[   25.740951] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.741237] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0091042c
[   25.741243] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x0010c158
[   25.741247] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x00001e00
[   25.741253] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x2a00fd00
[   25.741258] nouveau D[     I2C][0000:01:00.0] AUXCH(1): 5: 0x00000050 16
[   25.741544] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x1e64603d
[   25.741550] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x20200a01
[   25.741555] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0x20202020
[   25.741561] nouveau D[     I2C][0000:01:00.0] AUXCH(1): rd 0xfc000000</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396009324.BB0EcBa1.20401--

--===============1333673904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1333673904==--
