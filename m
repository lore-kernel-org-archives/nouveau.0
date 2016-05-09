From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95282] G96: system hang on video playback via vdpau
Date: Mon, 09 May 2016 17:58:19 +0000
Message-ID: <bug-95282-8800-b5wh3OPXyR@http.bugs.freedesktop.org/>
References: <bug-95282-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1520422803=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95282-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1520422803==
Content-Type: multipart/alternative; boundary="14628166991.dc26a.11475";
 charset="UTF-8"


--14628166991.dc26a.11475
Date: Mon, 9 May 2016 17:58:19 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95282

--- Comment #9 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

Besides, it is enough to just run the application itself, without starting the
video,

$ xine
This is xine (X11 gui) - a free video player v0.99.9.
(c) 2000-2014 The xine Team.
vo_vdpau: vdpau API version : 1
vo_vdpau: vdpau implementation description : G3DVL VDPAU Driver Shared Library
version 1.0
vo_vdpau: maximum video surface size for chroma type 4:2:2 is 8192x8192
vo_vdpau: maximum video surface size for chroma type 4:2:0 is 8192x8192
vo_vdpau: maximum output surface size is 8192x8192
vo_vdpau: hold a maximum of 10 video output surfaces for reuse
vo_vdpau: using 3 output surfaces of size 1920x1080 for display queue
vo_vdpau: this hardware doesn't support mpeg4-part2.
vdpau_set_property: property=1, value=0
vo_vdpau: deinterlace: none
vo_vdpau: set_scaling_level=0
vo_vdpau: disable noise reduction.
vo_vdpau: disable sharpness.
vo_vdpau: skip_chroma = 0


... and this jumps in kernel log:
$ dmesg -t
...
nouveau 0000:02:00.0: gr: TRAP_PROP - TP 0 - 00000040 [RT_FAULT] - Address
0041a80000
nouveau 0000:02:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c:
00800080, e20: 00001800, e24: 00030000
nouveau 0000:02:00.0: gr: 00200000 [] ch 5 [001f7bd000 xine[8158]] subc 3 class
8297 mthd 1558 data 00000001
nouveau 0000:02:00.0: fb: trapped write at 0041a80000 on channel 5 [1f7bd000
xine[8158]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason
00000002 [PAGE_NOT_PRESENT]


-NVIDIA G98-

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14628166991.dc26a.11475
Date: Mon, 9 May 2016 17:58:19 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - G96: system hang on video playback via vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95282#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - G96: system hang on video playback via vdpau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95282">bug 95282</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
Besides, it is enough to just run the application itself, without starting the
video,

$ xine
This is xine (X11 gui) - a free video player v0.99.9.
(c) 2000-2014 The xine Team.
vo_vdpau: vdpau API version : 1
vo_vdpau: vdpau implementation description : G3DVL VDPAU Driver Shared Library
version 1.0
vo_vdpau: maximum video surface size for chroma type 4:2:2 is 8192x8192
vo_vdpau: maximum video surface size for chroma type 4:2:0 is 8192x8192
vo_vdpau: maximum output surface size is 8192x8192
vo_vdpau: hold a maximum of 10 video output surfaces for reuse
vo_vdpau: using 3 output surfaces of size 1920x1080 for display queue
vo_vdpau: this hardware doesn't support mpeg4-part2.
vdpau_set_property: property=1, value=0
vo_vdpau: deinterlace: none
vo_vdpau: set_scaling_level=0
vo_vdpau: disable noise reduction.
vo_vdpau: disable sharpness.
vo_vdpau: skip_chroma = 0


... and this jumps in kernel log:
$ dmesg -t
...
nouveau 0000:02:00.0: gr: TRAP_PROP - TP 0 - 00000040 [RT_FAULT] - Address
0041a80000
nouveau 0000:02:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c:
00800080, e20: 00001800, e24: 00030000
nouveau 0000:02:00.0: gr: 00200000 [] ch 5 [001f7bd000 xine[8158]] subc 3 class
8297 mthd 1558 data 00000001
nouveau 0000:02:00.0: fb: trapped write at 0041a80000 on channel 5 [1f7bd000
xine[8158]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason
00000002 [PAGE_NOT_PRESENT]


-NVIDIA G98-</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14628166991.dc26a.11475--

--===============1520422803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1520422803==--
