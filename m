From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84706] [NV94] HDMI Connected,
	but TV reports "no signal"
Date: Wed, 08 Oct 2014 11:30:57 +0000
Message-ID: <bug-84706-8800-7nAMDXgy6m@http.bugs.freedesktop.org/>
References: <bug-84706-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1075216537=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84706-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1075216537==
Content-Type: multipart/alternative; boundary="1412767856.3cce51.751"; charset="UTF-8"


--1412767856.3cce51.751
Date: Wed, 8 Oct 2014 11:30:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84706

--- Comment #8 from Jay van Dam <jayvandam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Just went through both the logs of the LiveCD and normal system and I found the
following: 

Normal system kernel log with nouveau.debug=trace and drm.debug=0xe 
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty0] enabled
[    0.268401] vesafb: mode is 640x480x32, linelength=2560, pages=0
[    0.268402] vesafb: scrolling: redraw
[    0.268404] vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.268418] vesafb: framebuffer at 0xfb000000, mapped to 0xffffc90010e80000,
using 1216k, total 1216k
[    0.275997] Console: switching to colour frame buffer device 80x30
[    0.283477] fb0: VESA VGA frame buffer device
[    0.308418] fb: switching to nouveaufb from VESA VGA
[    0.308438] Console: switching to colour dummy device 80x25
[    0.818241] fbcon: nouveaufb (fb0) is primary device
[    0.903002] Console: switching to colour frame buffer device 240x67
[    0.904713] nouveau 0000:05:00.0: fb0: nouveaufb frame buffer device

LiveCD kernel log with nouveau.debug=trace and drm.debug=0xe 
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    2.977742] fbcon: nouveaufb (fb0) is primary device
[    3.048489] Console: switching to colour frame buffer device 240x67
[    3.050679] nouveau 0000:05:00.0: fb0: nouveaufb frame buffer device

Could it be that the kernel framebuffer driver hand-over is not working
properly. The handover completes without errors according to the logs, but it
seems that only the VGA display output continues to work after handover and the
HDMI display output becomes faulty over the hand-over.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412767856.3cce51.751
Date: Wed, 8 Oct 2014 11:30:56 +0000
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
   title="NEW - [NV94] HDMI Connected, but TV reports &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84706#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] HDMI Connected, but TV reports &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84706">bug 84706</a>
              from <span class="vcard"><a class="email" href="mailto:jayvandam&#64;gmail.com" title="Jay van Dam &lt;jayvandam&#64;gmail.com&gt;"> <span class="fn">Jay van Dam</span></a>
</span></b>
        <pre>Just went through both the logs of the LiveCD and normal system and I found the
following: 

Normal system kernel log with nouveau.debug=trace and drm.debug=0xe 
[    0.000000] Console: colour dummy device 80x25
[    0.000000] console [tty0] enabled
[    0.268401] vesafb: mode is 640x480x32, linelength=2560, pages=0
[    0.268402] vesafb: scrolling: redraw
[    0.268404] vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.268418] vesafb: framebuffer at 0xfb000000, mapped to 0xffffc90010e80000,
using 1216k, total 1216k
[    0.275997] Console: switching to colour frame buffer device 80x30
[    0.283477] fb0: VESA VGA frame buffer device
[    0.308418] fb: switching to nouveaufb from VESA VGA
[    0.308438] Console: switching to colour dummy device 80x25
[    0.818241] fbcon: nouveaufb (fb0) is primary device
[    0.903002] Console: switching to colour frame buffer device 240x67
[    0.904713] nouveau 0000:05:00.0: fb0: nouveaufb frame buffer device

LiveCD kernel log with nouveau.debug=trace and drm.debug=0xe 
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    2.977742] fbcon: nouveaufb (fb0) is primary device
[    3.048489] Console: switching to colour frame buffer device 240x67
[    3.050679] nouveau 0000:05:00.0: fb0: nouveaufb frame buffer device

Could it be that the kernel framebuffer driver hand-over is not working
properly. The handover completes without errors according to the logs, but it
seems that only the VGA display output continues to work after handover and the
HDMI display output becomes faulty over the hand-over.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412767856.3cce51.751--

--===============1075216537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1075216537==--
