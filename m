From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77529] [NVE7] NVS 510 DP-3 output doesn't work
Date: Wed, 16 Apr 2014 20:01:40 +0000
Message-ID: <bug-77529-8800-v0ZCBOnEYj@http.bugs.freedesktop.org/>
References: <bug-77529-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1063621219=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77529-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1063621219==
Content-Type: multipart/alternative; boundary="1397678500.00a8FfbD2.9429"; charset="us-ascii"


--1397678500.00a8FfbD2.9429
Date: Wed, 16 Apr 2014 20:01:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77529

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #2)
> (In reply to comment #1)
> > Is it some enormous monitor (resolution-wise)?
> No.
> 
> > Is this a laptop + dock? If so, which ones?
> No. It is multimonitor, 4xminiDP videocard:
> http://www.nvidia.com/object/nvs-510-graphics-card.html
> 
> > Can you check if there's a kworker taking up 100% of cpu time (of 1 cpu)?
> Checked, no.
> 
> > Is the monitor actually connected via DP, or is it a DP -> HDMI (or DVI)
> > situation?
> All four monitors are connected via Apple miniDP to VGA adapters:
> http://store.apple.com/us/product/MB572Z/B/mini-displayport-to-vga-adapter

Very interesting. So you have 4 identical DP->VGA adapters, each plugged into
similar (identical?) monitors, and DP-3 is always the one that fails?

Can you attach a dmesg when booting with

nouveau.debug=VBIOS=trace,PDISP=trace drm.debug=0xe

That should provide a bunch of debug info, perhaps even enough to tell what's
going on.

Additionally, please attach your vbios (/sys/kernel/debug/dri/0/vbios.rom).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397678500.00a8FfbD2.9429
Date: Wed, 16 Apr 2014 20:01:40 +0000
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
   title="NEW --- - [NVE7] NVS 510 DP-3 output doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77529#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] NVS 510 DP-3 output doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77529">bug 77529</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=77529#c2">comment #2</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=77529#c1">comment #1</a>)
&gt; &gt; Is it some enormous monitor (resolution-wise)?
&gt; No.
&gt; 
&gt; &gt; Is this a laptop + dock? If so, which ones?
&gt; No. It is multimonitor, 4xminiDP videocard:
&gt; <a href="http://www.nvidia.com/object/nvs-510-graphics-card.html">http://www.nvidia.com/object/nvs-510-graphics-card.html</a>
&gt; 
&gt; &gt; Can you check if there's a kworker taking up 100% of cpu time (of 1 cpu)?
&gt; Checked, no.
&gt; 
&gt; &gt; Is the monitor actually connected via DP, or is it a DP -&gt; HDMI (or DVI)
&gt; &gt; situation?
&gt; All four monitors are connected via Apple miniDP to VGA adapters:
&gt; <a href="http://store.apple.com/us/product/MB572Z/B/mini-displayport-to-vga-adapter">http://store.apple.com/us/product/MB572Z/B/mini-displayport-to-vga-adapter</a></span >

Very interesting. So you have 4 identical DP-&gt;VGA adapters, each plugged into
similar (identical?) monitors, and DP-3 is always the one that fails?

Can you attach a dmesg when booting with

nouveau.debug=VBIOS=trace,PDISP=trace drm.debug=0xe

That should provide a bunch of debug info, perhaps even enough to tell what's
going on.

Additionally, please attach your vbios (/sys/kernel/debug/dri/0/vbios.rom).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397678500.00a8FfbD2.9429--

--===============1063621219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1063621219==--
