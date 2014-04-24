From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77857] Second Monitor Stopped Working
Date: Thu, 24 Apr 2014 04:15:55 +0000
Message-ID: <bug-77857-8800-H1JQW12h5E@http.bugs.freedesktop.org/>
References: <bug-77857-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1310303937=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77857-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1310303937==
Content-Type: multipart/alternative; boundary="1398312955.2B872.2885"; charset="us-ascii"


--1398312955.2B872.2885
Date: Thu, 24 Apr 2014 04:15:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77857

--- Comment #9 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
In your 'working' case, you're using the proprietary driver:

[   29.885032] nvidia: module license 'NVIDIA' taints kernel.
[   29.885037] Disabling lock debugging due to kernel taint
[   29.905236] vgaarb: device changed decodes:
PCI:0000:01:00.0,olddecodes=io+mem,decodes=none:owns=io+mem
[   29.905528] [drm] Initialized nvidia-drm 0.0.0 20130102 for 0000:01:00.0 on
minor 0
[   29.905537] NVRM: loading NVIDIA UNIX x86_64 Kernel Module  331.49  Wed Feb
12 20:42:50 PST 2014

And similarly in the Xorg log:

[    38.408] (II) NVIDIA(0): Creating default Display subsection in Screen
section
    "Default Screen Section" for depth/fbbpp 24/32
[    38.408] (==) NVIDIA(0): Depth 24, (==) framebuffer bpp 32
[    38.408] (==) NVIDIA(0): RGB weight 888
[    38.408] (==) NVIDIA(0): Default visual is TrueColor
[    38.408] (==) NVIDIA(0): Using gamma correction (1.0, 1.0, 1.0)
[    38.462] (**) NVIDIA(0): Enabling 2D acceleration
[    39.431] (II) NVIDIA(0): Display (AOC 2243W (CRT-0)) does not support
NVIDIA 3D Vision
[    39.431] (II) NVIDIA(0):     stereo.
[    39.437] (II) NVIDIA(0): Display (HP W2071d (DFP-2)) does not support
NVIDIA 3D Vision
[    39.437] (II) NVIDIA(0):     stereo.
[    39.437] (II) NVIDIA(GPU-0): Found DRM driver nvidia-drm (20130102)
[    39.438] (II) NVIDIA(0): NVIDIA GPU GeForce GTX 650 (GK107) at PCI:1:0:0
(GPU-0)

Which, BTW, should be noted, is not at all the 9800 GTX you claimed you had...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398312955.2B872.2885
Date: Thu, 24 Apr 2014 04:15:55 +0000
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
   title="NEW --- - Second Monitor Stopped Working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77857#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Second Monitor Stopped Working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77857">bug 77857</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>In your 'working' case, you're using the proprietary driver:

[   29.885032] nvidia: module license 'NVIDIA' taints kernel.
[   29.885037] Disabling lock debugging due to kernel taint
[   29.905236] vgaarb: device changed decodes:
PCI:0000:01:00.0,olddecodes=io+mem,decodes=none:owns=io+mem
[   29.905528] [drm] Initialized nvidia-drm 0.0.0 20130102 for 0000:01:00.0 on
minor 0
[   29.905537] NVRM: loading NVIDIA UNIX x86_64 Kernel Module  331.49  Wed Feb
12 20:42:50 PST 2014

And similarly in the Xorg log:

[    38.408] (II) NVIDIA(0): Creating default Display subsection in Screen
section
    &quot;Default Screen Section&quot; for depth/fbbpp 24/32
[    38.408] (==) NVIDIA(0): Depth 24, (==) framebuffer bpp 32
[    38.408] (==) NVIDIA(0): RGB weight 888
[    38.408] (==) NVIDIA(0): Default visual is TrueColor
[    38.408] (==) NVIDIA(0): Using gamma correction (1.0, 1.0, 1.0)
[    38.462] (**) NVIDIA(0): Enabling 2D acceleration
[    39.431] (II) NVIDIA(0): Display (AOC 2243W (CRT-0)) does not support
NVIDIA 3D Vision
[    39.431] (II) NVIDIA(0):     stereo.
[    39.437] (II) NVIDIA(0): Display (HP W2071d (DFP-2)) does not support
NVIDIA 3D Vision
[    39.437] (II) NVIDIA(0):     stereo.
[    39.437] (II) NVIDIA(GPU-0): Found DRM driver nvidia-drm (20130102)
[    39.438] (II) NVIDIA(0): NVIDIA GPU GeForce GTX 650 (GK107) at PCI:1:0:0
(GPU-0)

Which, BTW, should be noted, is not at all the 9800 GTX you claimed you had...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398312955.2B872.2885--

--===============1310303937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1310303937==--
