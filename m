From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84706] [NV94] HDMI Connected,
	but TV reports "no signal"
Date: Mon, 03 Nov 2014 22:29:26 +0000
Message-ID: <bug-84706-8800-QWzCwho3bG@http.bugs.freedesktop.org/>
References: <bug-84706-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1622133895=="
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


--===============1622133895==
Content-Type: multipart/alternative; boundary="1415053766.20082.22903"; charset="UTF-8"


--1415053766.20082.22903
Date: Mon, 3 Nov 2014 22:29:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84706

--- Comment #15 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Jay van Dam from comment #14)
> Recompiled the kernel without vesa and uvesa, but it does not make a
> difference.  Added the new kernel log with nouveau.debug=trace and
> drm.debug=0xe. Also added the Xorg.log and the xrandr output. 

Well that's unfortunate. The things you pointed out are actually expected and
fine.

The only thing that seems reminscient of a similar issue a bunch of G96's had
is with

[    0.848281] nouveau T[   VBIOS][0000:05:00.0] 0xb87a[2]: CONDITION    0x0f
[    0.848283] nouveau T[   VBIOS][0000:05:00.0] 0xb87c[2]:     [0x0f]
(R[0x000008] & 0x000000f0) == 0x00000010
[    0.848285] nouveau T[   VBIOS][0000:05:00.0] 0xb87c[ ]: NOT
[    0.848286] nouveau T[   VBIOS][0000:05:00.0] 0xb87d[2]: IO_CONDITION   
0x05
[    0.848288] nouveau T[   VBIOS][0000:05:00.0] 0xb87f[2]:     [0x05]
(0x03d4[0x94] & 0x80) == 0x80
[    0.848292] nouveau T[   VBIOS][0000:05:00.0] 0xb87f[ ]: SUB_DIRECT   
0xb8e1
[    0.848293] nouveau T[   VBIOS][0000:05:00.0] 0xb882[ ]: RESUME
[    0.848294] nouveau T[   VBIOS][0000:05:00.0] 0xb883[2]: DONE
[    0.848295] nouveau T[   VBIOS][0000:05:00.0] 0xb7f2[1]: DONE
[    0.848296] nouveau T[   VBIOS][0000:05:00.0] 0xc0c8[0]: DONE
[    0.848541] nouveau D[   PDISP][0000:05:00.0] supervisor 0x00000040
0x00000550
[    0.848555] nouveau T[   VBIOS][0000:05:00.0] 0xb884[0]: CONDITION    0x0f
[    0.848557] nouveau T[   VBIOS][0000:05:00.0] 0xb886[0]:     [0x0f]
(R[0x000008] & 0x000000f0) == 0x00000010
[    0.848560] nouveau T[   VBIOS][0000:05:00.0] 0xb886[ ]: SUB_DIRECT   
0xb95c
[    0.848561] nouveau T[   VBIOS][0000:05:00.0] 0xb889[ ]: SUB_DIRECT   
0xb961
[    0.848563] nouveau T[   VBIOS][0000:05:00.0] 0xb88c[ ]: NOT
[    0.848564] nouveau T[   VBIOS][0000:05:00.0] 0xb88d[0]: IO_CONDITION   
0x05
[    0.848566] nouveau T[   VBIOS][0000:05:00.0] 0xb88f[0]:     [0x05]
(0x03d4[0x94] & 0x80) == 0x80
[    0.848569] nouveau T[   VBIOS][0000:05:00.0] 0xb88f[ ]: SUB_DIRECT   
0xb905
[    0.848570] nouveau T[   VBIOS][0000:05:00.0] 0xb892[ ]: RESUME
[    0.848571] nouveau T[   VBIOS][0000:05:00.0] 0xb893[0]: DONE
[    0.881790] [drm:drm_crtc_helper_set_config] Setting connector DPMS state to
on
[    0.881791] [drm:drm_crtc_helper_set_config]     [CONNECTOR:24:HDMI-A-1] set
DPMS on

That IO_CONDITION looks oddly familiar. I wonder if we're not evaluating it
somehow incorrectly... again. But... we fixed the thing for G96 and it worked
fine there (and it also worked fine in 3.7 or 3.6, the issue was a regression
there).

Next step is to make an mmiotrace of the blob drivers doing this correctly and
comparing. This is a pretty good guide: https://wiki.ubuntu.com/X/MMIOTracing .
Send a xz -9'd trace (should be ~50MB before compression) and also your vbios
for good measure to mmio.dumps-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org referencing this bug, and make a note
here that you've made such a trace. It would be ideal if the trace were started
without HDMI plugged in, and then you emitted a mark, plugged in hdmi, and
emitted another mark.

The only odd thing about your card is that you have 768MB of VRAM which I'm
sure means some sort of weird partition-based layout. But I can't see how
that'd affect HDMI setup.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1415053766.20082.22903
Date: Mon, 3 Nov 2014 22:29:26 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84706#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] HDMI Connected, but TV reports &quot;no signal&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84706">bug 84706</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Jay van Dam from <a href="show_bug.cgi?id=84706#c14">comment #14</a>)
<span class="quote">&gt; Recompiled the kernel without vesa and uvesa, but it does not make a
&gt; difference.  Added the new kernel log with nouveau.debug=trace and
&gt; drm.debug=0xe. Also added the Xorg.log and the xrandr output. </span >

Well that's unfortunate. The things you pointed out are actually expected and
fine.

The only thing that seems reminscient of a similar issue a bunch of G96's had
is with

[    0.848281] nouveau T[   VBIOS][0000:05:00.0] 0xb87a[2]: CONDITION    0x0f
[    0.848283] nouveau T[   VBIOS][0000:05:00.0] 0xb87c[2]:     [0x0f]
(R[0x000008] &amp; 0x000000f0) == 0x00000010
[    0.848285] nouveau T[   VBIOS][0000:05:00.0] 0xb87c[ ]: NOT
[    0.848286] nouveau T[   VBIOS][0000:05:00.0] 0xb87d[2]: IO_CONDITION   
0x05
[    0.848288] nouveau T[   VBIOS][0000:05:00.0] 0xb87f[2]:     [0x05]
(0x03d4[0x94] &amp; 0x80) == 0x80
[    0.848292] nouveau T[   VBIOS][0000:05:00.0] 0xb87f[ ]: SUB_DIRECT   
0xb8e1
[    0.848293] nouveau T[   VBIOS][0000:05:00.0] 0xb882[ ]: RESUME
[    0.848294] nouveau T[   VBIOS][0000:05:00.0] 0xb883[2]: DONE
[    0.848295] nouveau T[   VBIOS][0000:05:00.0] 0xb7f2[1]: DONE
[    0.848296] nouveau T[   VBIOS][0000:05:00.0] 0xc0c8[0]: DONE
[    0.848541] nouveau D[   PDISP][0000:05:00.0] supervisor 0x00000040
0x00000550
[    0.848555] nouveau T[   VBIOS][0000:05:00.0] 0xb884[0]: CONDITION    0x0f
[    0.848557] nouveau T[   VBIOS][0000:05:00.0] 0xb886[0]:     [0x0f]
(R[0x000008] &amp; 0x000000f0) == 0x00000010
[    0.848560] nouveau T[   VBIOS][0000:05:00.0] 0xb886[ ]: SUB_DIRECT   
0xb95c
[    0.848561] nouveau T[   VBIOS][0000:05:00.0] 0xb889[ ]: SUB_DIRECT   
0xb961
[    0.848563] nouveau T[   VBIOS][0000:05:00.0] 0xb88c[ ]: NOT
[    0.848564] nouveau T[   VBIOS][0000:05:00.0] 0xb88d[0]: IO_CONDITION   
0x05
[    0.848566] nouveau T[   VBIOS][0000:05:00.0] 0xb88f[0]:     [0x05]
(0x03d4[0x94] &amp; 0x80) == 0x80
[    0.848569] nouveau T[   VBIOS][0000:05:00.0] 0xb88f[ ]: SUB_DIRECT   
0xb905
[    0.848570] nouveau T[   VBIOS][0000:05:00.0] 0xb892[ ]: RESUME
[    0.848571] nouveau T[   VBIOS][0000:05:00.0] 0xb893[0]: DONE
[    0.881790] [drm:drm_crtc_helper_set_config] Setting connector DPMS state to
on
[    0.881791] [drm:drm_crtc_helper_set_config]     [CONNECTOR:24:HDMI-A-1] set
DPMS on

That IO_CONDITION looks oddly familiar. I wonder if we're not evaluating it
somehow incorrectly... again. But... we fixed the thing for G96 and it worked
fine there (and it also worked fine in 3.7 or 3.6, the issue was a regression
there).

Next step is to make an mmiotrace of the blob drivers doing this correctly and
comparing. This is a pretty good guide: <a href="https://wiki.ubuntu.com/X/MMIOTracing">https://wiki.ubuntu.com/X/MMIOTracing</a> .
Send a xz -9'd trace (should be ~50MB before compression) and also your vbios
for good measure to <a href="mailto:mmio.dumps&#64;gmail.com">mmio.dumps&#64;gmail.com</a> referencing this bug, and make a note
here that you've made such a trace. It would be ideal if the trace were started
without HDMI plugged in, and then you emitted a mark, plugged in hdmi, and
emitted another mark.

The only odd thing about your card is that you have 768MB of VRAM which I'm
sure means some sort of weird partition-based layout. But I can't see how
that'd affect HDMI setup.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1415053766.20082.22903--

--===============1622133895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1622133895==--
