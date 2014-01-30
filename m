From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74164] [NV04] Native monitor resolution missing
Date: Thu, 30 Jan 2014 21:47:31 +0000
Message-ID: <bug-74164-8800-A5FhA8iTL3@http.bugs.freedesktop.org/>
References: <bug-74164-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1507914279=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74164-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1507914279==
Content-Type: multipart/alternative; boundary="1391118451.2CfbBc2.13006"; charset="us-ascii"


--1391118451.2CfbBc2.13006
Date: Thu, 30 Jan 2014 21:47:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74164

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #13)
> I see... so, what can I do now to try to understand why that file is not
> filled in by nouveau?

Try to follow the code and see where things go wrong. Boot with
nouveau.debug=trace perhaps someone left some interesting nv_debug/nv_trace
statements somewhere. Also throw in drm.debug=0xe for good measure -- a lot of
the pre-nv50 code still relies on that being set to emit debug statements.

> 
> monitor-edid talks about some different ways to get the edid: VBE (through
> BIOS interruption 10h), ACPI 2.0, Open Firmware, Kernel mode-setting (which
> is not working in our case). Another tool, read-edid
> (http://polypux.org/projects/read-edid/) seems to use the i2c interface, but
> I've not tried to see if it works.
> 
> Looking at the monitor-edid output, it seems like it's using the VBE mode to
> correctly get this information, but I have to do a "setsebool
> mmap_low_allowed 1" previously to make it actually work. Could this be
> somewhat related to the fact that nouveau can't get the information?

Nope, pretty sure selinux is just about what userspace can do.

Unfortunately this is getting well outside of my knowledge area. But I think
that VBE is something emulated by the card, and perhaps part of VESA. (int 10h
is unlikely to be involved directly though, as the system has by then gone into
32-bit protected mode, and overwritten the IDT. int 10h and all the BIOS
service interrupts can really only work in 16-bit real mode.) nouveau tries to
use the "real" interfaces to access the data, and probably gets it a little
wrong in your case. I do know for sure that my TNT2 was able to work with my
1920x1200 monitor without issue (at least not relating to detection).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391118451.2CfbBc2.13006
Date: Thu, 30 Jan 2014 21:47:31 +0000
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
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164">bug 74164</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=74164#c13">comment #13</a>)
<span class="quote">&gt; I see... so, what can I do now to try to understand why that file is not
&gt; filled in by nouveau?</span >

Try to follow the code and see where things go wrong. Boot with
nouveau.debug=trace perhaps someone left some interesting nv_debug/nv_trace
statements somewhere. Also throw in drm.debug=0xe for good measure -- a lot of
the pre-nv50 code still relies on that being set to emit debug statements.

<span class="quote">&gt; 
&gt; monitor-edid talks about some different ways to get the edid: VBE (through
&gt; BIOS interruption 10h), ACPI 2.0, Open Firmware, Kernel mode-setting (which
&gt; is not working in our case). Another tool, read-edid
&gt; (<a href="http://polypux.org/projects/read-edid/">http://polypux.org/projects/read-edid/</a>) seems to use the i2c interface, but
&gt; I've not tried to see if it works.
&gt; 
&gt; Looking at the monitor-edid output, it seems like it's using the VBE mode to
&gt; correctly get this information, but I have to do a &quot;setsebool
&gt; mmap_low_allowed 1&quot; previously to make it actually work. Could this be
&gt; somewhat related to the fact that nouveau can't get the information?</span >

Nope, pretty sure selinux is just about what userspace can do.

Unfortunately this is getting well outside of my knowledge area. But I think
that VBE is something emulated by the card, and perhaps part of VESA. (int 10h
is unlikely to be involved directly though, as the system has by then gone into
32-bit protected mode, and overwritten the IDT. int 10h and all the BIOS
service interrupts can really only work in 16-bit real mode.) nouveau tries to
use the &quot;real&quot; interfaces to access the data, and probably gets it a little
wrong in your case. I do know for sure that my TNT2 was able to work with my
1920x1200 monitor without issue (at least not relating to detection).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391118451.2CfbBc2.13006--

--===============1507914279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1507914279==--
