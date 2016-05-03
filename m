From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] [NV96] Amilo Xi 3650: G96M [GeForce 9600M
 GT]: HDMI monitor stays black after s2ram
Date: Tue, 03 May 2016 14:46:31 +0000
Message-ID: <bug-93887-8800-cOZdKbtihh@http.bugs.freedesktop.org/>
References: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1562459340=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1562459340==
Content-Type: multipart/alternative; boundary="14622867912.Ec63dd8.10624";
 charset="UTF-8"


--14622867912.Ec63dd8.10624
Date: Tue, 3 May 2016 14:46:31 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93887

--- Comment #24 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
I was going to ask for a dmesg, but you were quicker. Apparently Nouveau gets
unhappy even before being suspended. Any idea what you were doing when those
errors occurred:

> 
> [  236.095542] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [DRM] subc 0 mthd 0060 data 80000002
> [  389.046834] nouveau 0000:01:00.0: Xorg[337]: fail ttm_validate
> [  389.046841] nouveau 0000:01:00.0: Xorg[337]: validating bo list
> [  389.046846] nouveau 0000:01:00.0: Xorg[337]: validate: -12
> [  477.074185] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [DRM] subc 0 mthd 0060 data 80000002
> [ 1084.518190] nouveau 0000:01:00.0: Direct firmware load for nouveau/nv84_xuc00f failed with error -2
> [ 1084.518200] nouveau 0000:01:00.0: vp: unable to load firmware nouveau/nv84_xuc00f
> [ 1084.518204] nouveau 0000:01:00.0: vp: init failed, -2
> [ 1084.518226] nouveau 0000:01:00.0: Direct firmware load for nouveau/nv84_xuc103 failed with error -2
> [ 1084.518230] nouveau 0000:01:00.0: bsp: unable to load firmware nouveau/nv84_xuc103
> [ 1084.518233] nouveau 0000:01:00.0: bsp: init failed, -2
> [ 1085.910774] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
> [ 1085.910780] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00400000, e20: 00001800, e24: 00220000
> [ 1085.910798] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
> [ 1085.910801] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00400010, e20: 00001800, e24: 00220000
> [ 1085.910806] nouveau 0000:01:00.0: gr: 00200000 [] ch 7 [000f598000 xine[1360]] subc 3 class 8297 mthd 1b0c data 1000f010
> [ 1197.735066] perf: interrupt took too long (2509 > 2500), lowering kernel.perf_event_max_sample_rate to 79500
> [ 1230.906924] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000040 [RT_FAULT] - Address 0048bd0000
> [ 1230.906932] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00800080, e20: 00001800, e24: 00030000
> [ 1230.906949] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - 00000040 [RT_FAULT] - Address 0048bd1000
> [ 1230.906953] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00800090, e20: 00001800, e24: 00030000
> [ 1230.906969] nouveau 0000:01:00.0: gr: 00200000 [] ch 7 [000f598000 xine[1360]] subc 3 class 8297 mthd 1558 data 00000001
> [ 1230.906994] nouveau 0000:01:00.0: fb: trapped write at 0048bd0000 on channel 7 [0f598000 xine[1360]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
> [ 1233.825803] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
> [ 1233.825810] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00400000, e20: 00001800, e24: 00220000
> [ 1233.825820] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
> [ 1233.825823] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00400010, e20: 00001800, e24: 00220000
> [ 1233.825828] nouveau 0000:01:00.0: gr: 00200000 [] ch 7 [000f598000 xine[1360]] subc 3 class 8297 mthd 1b0c data 1000f010
> [ 1233.825840] nouveau 0000:01:00.0: fb: trapped write at 0020318000 on channel 7 [0f598000 xine[1360]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
> [ 1465.186818] nouveau 0000:01:00.0: Xorg[337]: fail ttm_validate
> [ 1465.186826] nouveau 0000:01:00.0: Xorg[337]: validating bo list
> [ 1465.186836] nouveau 0000:01:00.0: Xorg[337]: validate: -12
> [ 1578.523088] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [DRM] subc 0 mthd 0060 data 80000002

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14622867912.Ec63dd8.10624
Date: Tue, 3 May 2016 14:46:31 +0000
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
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monitor stays black after s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93887">bug 93887</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>I was going to ask for a dmesg, but you were quicker. Apparently Nouveau gets
unhappy even before being suspended. Any idea what you were doing when those
errors occurred:

<span class="quote">&gt; 
&gt; [  236.095542] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [DRM] subc 0 mthd 0060 data 80000002
&gt; [  389.046834] nouveau 0000:01:00.0: Xorg[337]: fail ttm_validate
&gt; [  389.046841] nouveau 0000:01:00.0: Xorg[337]: validating bo list
&gt; [  389.046846] nouveau 0000:01:00.0: Xorg[337]: validate: -12
&gt; [  477.074185] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [DRM] subc 0 mthd 0060 data 80000002
&gt; [ 1084.518190] nouveau 0000:01:00.0: Direct firmware load for nouveau/nv84_xuc00f failed with error -2
&gt; [ 1084.518200] nouveau 0000:01:00.0: vp: unable to load firmware nouveau/nv84_xuc00f
&gt; [ 1084.518204] nouveau 0000:01:00.0: vp: init failed, -2
&gt; [ 1084.518226] nouveau 0000:01:00.0: Direct firmware load for nouveau/nv84_xuc103 failed with error -2
&gt; [ 1084.518230] nouveau 0000:01:00.0: bsp: unable to load firmware nouveau/nv84_xuc103
&gt; [ 1084.518233] nouveau 0000:01:00.0: bsp: init failed, -2
&gt; [ 1085.910774] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
&gt; [ 1085.910780] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00400000, e20: 00001800, e24: 00220000
&gt; [ 1085.910798] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
&gt; [ 1085.910801] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00400010, e20: 00001800, e24: 00220000
&gt; [ 1085.910806] nouveau 0000:01:00.0: gr: 00200000 [] ch 7 [000f598000 xine[1360]] subc 3 class 8297 mthd 1b0c data 1000f010
&gt; [ 1197.735066] perf: interrupt took too long (2509 &gt; 2500), lowering kernel.perf_event_max_sample_rate to 79500
&gt; [ 1230.906924] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000040 [RT_FAULT] - Address 0048bd0000
&gt; [ 1230.906932] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00800080, e20: 00001800, e24: 00030000
&gt; [ 1230.906949] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - 00000040 [RT_FAULT] - Address 0048bd1000
&gt; [ 1230.906953] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00800090, e20: 00001800, e24: 00030000
&gt; [ 1230.906969] nouveau 0000:01:00.0: gr: 00200000 [] ch 7 [000f598000 xine[1360]] subc 3 class 8297 mthd 1558 data 00000001
&gt; [ 1230.906994] nouveau 0000:01:00.0: fb: trapped write at 0048bd0000 on channel 7 [0f598000 xine[1360]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
&gt; [ 1233.825803] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
&gt; [ 1233.825810] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00400000, e20: 00001800, e24: 00220000
&gt; [ 1233.825820] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
&gt; [ 1233.825823] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 1 - e0c: 00000000, e18: 00000000, e1c: 00400010, e20: 00001800, e24: 00220000
&gt; [ 1233.825828] nouveau 0000:01:00.0: gr: 00200000 [] ch 7 [000f598000 xine[1360]] subc 3 class 8297 mthd 1b0c data 1000f010
&gt; [ 1233.825840] nouveau 0000:01:00.0: fb: trapped write at 0020318000 on channel 7 [0f598000 xine[1360]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
&gt; [ 1465.186818] nouveau 0000:01:00.0: Xorg[337]: fail ttm_validate
&gt; [ 1465.186826] nouveau 0000:01:00.0: Xorg[337]: validating bo list
&gt; [ 1465.186836] nouveau 0000:01:00.0: Xorg[337]: validate: -12
&gt; [ 1578.523088] nouveau 0000:01:00.0: fifo: CACHE_ERROR - ch 1 [DRM] subc 0 mthd 0060 data 80000002</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14622867912.Ec63dd8.10624--

--===============1562459340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1562459340==--
