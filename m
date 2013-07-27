From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Sat, 27 Jul 2013 09:37:28 +0000
Message-ID: <bug-67051-8800-mscEmOTeIA@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0371902963=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0371902963==
Content-Type: multipart/alternative; boundary="1374917848.4Fda1.10770"; charset="us-ascii"


--1374917848.4Fda1.10770
Date: Sat, 27 Jul 2013 09:37:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #90 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #88)
> Let's worry about X dying later...
>  it has nothing to do with HDMI video or audio.
> 
> The X comment was just for completeness.
> X was lost at that time (so video and/or audio situation would've been
> academical, anyway).

Not at all. With KMS, X has nothing to do with modesetting, and thus nothing to
do with video or hdmi audio besides asking the kernel to configure one mode or
another. You should be able to test everything from the console just fine.

> -----------------------------------------------------------------------------
> --
> Also, my hdminva3.patch should already be part of 3.11, so I'm surprised you
> didn't get a conflict of some sort when applying it.
> 
> Are you talking about my linux "master" (circa 3.11.0-rc1+)?
> If so, I'll double check and report on problems with hdminva3.patch (if any).
> Please advise.
> 
> Otherwise, there's no "real" 3.11.0 available to me.
> I see the latest one for me (the "official") would be 3.10.3.
> (I've had and ran 3.10.1 for this bug submission).

Right. So the patch is in 3.11-rc1 and 3.10.x (3, I think). So if you're using
a version later than that, you should see apply failures with hdminva3.patch --
no need to even try it though.

> -----------------------------------------------------------------------------
> --
> Do you have the dmesg from the boot that had my debug[-3] patch applied?
> 
> As aluded to in my Comment 86:
> 
> [~/linux]$ git checkout 8e9e3d2deacc460fbb8a4691140318f6e85e6891 ; echo $?
> 0
> [~/linux]$ git checkout drivers/gpu/drm/nouveau ; echo $?
> 0
> [~/linux]$ patch -p1 < /home/alex/hdmi-1.patch ; echo $?
> patching file drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c
> 0
> [~/linux]$ patch -p1 < /home/alex/hdminva3.patch ; echo $?
> patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
> 0
> [~/linux]$ patch -p1 < /home/alex/hdminva3-4.patch ; echo $?
> patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminv84.c
> Hunk #1 succeeded at 44 with fuzz 1.
> Hunk #2 succeeded at 61 (offset -4 lines).
> patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
> 0
> [~/linux]$ patch -p1 < /home/alex/debug-3.patch ; echo $?
> patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
> patching file drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
> Hunk #2 succeeded at 77 with fuzz 1.
> patching file drivers/gpu/drm/nouveau/nv50_display.c
> Hunk #1 FAILED at 1657.
> Hunk #2 FAILED at 1666.
> 2 out of 2 hunks FAILED -- saving rejects to file
> drivers/gpu/drm/nouveau/nv50_display.c.rej
> 1
> 
> ------
> Should I go ahead and compile this commit (despite debug-3 failure)
> and post the dmesg?
> Please advise.

No. My debug patch would have to be redone for a kernel that old. Instead,
please take a recent kernel and apply my debug patch to it, and boot. The other
patches are actually probably not necessary either -- they just change what
gets written where, whereas I'm trying to figure out a potential issue with the
execution flow. You don't even have to go into X or test anything (but you can)
-- I just want to see the dmesg that happens when nouveau loads with that debug
patch. (But obviously make sure that your hdmi-audio-capable device is plugged
in at the time.)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374917848.4Fda1.10770
Date: Sat, 27 Jul 2013 09:37:28 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c90">Comment # 90</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67051#c88">comment #88</a>)
<span class="quote">&gt; Let's worry about X dying later...
&gt;  it has nothing to do with HDMI video or audio.
&gt; 
&gt; The X comment was just for completeness.
&gt; X was lost at that time (so video and/or audio situation would've been
&gt; academical, anyway).</span >

Not at all. With KMS, X has nothing to do with modesetting, and thus nothing to
do with video or hdmi audio besides asking the kernel to configure one mode or
another. You should be able to test everything from the console just fine.

<span class="quote">&gt; -----------------------------------------------------------------------------
&gt; --
&gt; Also, my hdminva3.patch should already be part of 3.11, so I'm surprised you
&gt; didn't get a conflict of some sort when applying it.
&gt; 
&gt; Are you talking about my linux &quot;master&quot; (circa 3.11.0-rc1+)?
&gt; If so, I'll double check and report on problems with hdminva3.patch (if any).
&gt; Please advise.
&gt; 
&gt; Otherwise, there's no &quot;real&quot; 3.11.0 available to me.
&gt; I see the latest one for me (the &quot;official&quot;) would be 3.10.3.
&gt; (I've had and ran 3.10.1 for this bug submission).</span >

Right. So the patch is in 3.11-rc1 and 3.10.x (3, I think). So if you're using
a version later than that, you should see apply failures with hdminva3.patch --
no need to even try it though.

<span class="quote">&gt; -----------------------------------------------------------------------------
&gt; --
&gt; Do you have the dmesg from the boot that had my debug[-3] patch applied?
&gt; 
&gt; As aluded to in my <a href="show_bug.cgi?id=67051#c86">Comment 86</a>:
&gt; 
&gt; [~/linux]$ git checkout 8e9e3d2deacc460fbb8a4691140318f6e85e6891 ; echo $?
&gt; 0
&gt; [~/linux]$ git checkout drivers/gpu/drm/nouveau ; echo $?
&gt; 0
&gt; [~/linux]$ patch -p1 &lt; /home/alex/hdmi-1.patch ; echo $?
&gt; patching file drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c
&gt; 0
&gt; [~/linux]$ patch -p1 &lt; /home/alex/hdminva3.patch ; echo $?
&gt; patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
&gt; 0
&gt; [~/linux]$ patch -p1 &lt; /home/alex/hdminva3-4.patch ; echo $?
&gt; patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminv84.c
&gt; Hunk #1 succeeded at 44 with fuzz 1.
&gt; Hunk #2 succeeded at 61 (offset -4 lines).
&gt; patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
&gt; 0
&gt; [~/linux]$ patch -p1 &lt; /home/alex/debug-3.patch ; echo $?
&gt; patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
&gt; patching file drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
&gt; Hunk #2 succeeded at 77 with fuzz 1.
&gt; patching file drivers/gpu/drm/nouveau/nv50_display.c
&gt; Hunk #1 FAILED at 1657.
&gt; Hunk #2 FAILED at 1666.
&gt; 2 out of 2 hunks FAILED -- saving rejects to file
&gt; drivers/gpu/drm/nouveau/nv50_display.c.rej
&gt; 1
&gt; 
&gt; ------
&gt; Should I go ahead and compile this commit (despite debug-3 failure)
&gt; and post the dmesg?
&gt; Please advise.</span >

No. My debug patch would have to be redone for a kernel that old. Instead,
please take a recent kernel and apply my debug patch to it, and boot. The other
patches are actually probably not necessary either -- they just change what
gets written where, whereas I'm trying to figure out a potential issue with the
execution flow. You don't even have to go into X or test anything (but you can)
-- I just want to see the dmesg that happens when nouveau loads with that debug
patch. (But obviously make sure that your hdmi-audio-capable device is plugged
in at the time.)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374917848.4Fda1.10770--

--===============0371902963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0371902963==--
