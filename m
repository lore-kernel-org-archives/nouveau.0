From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77674] [NVE7] "failed to read DPCD" on wake up with
 external monitor
Date: Tue, 24 Jun 2014 14:22:50 +0000
Message-ID: <bug-77674-8800-DxjngyG8AE@http.bugs.freedesktop.org/>
References: <bug-77674-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0327051241=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77674-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0327051241==
Content-Type: multipart/alternative; boundary="1403619770.AaAa72.22588"; charset="us-ascii"


--1403619770.AaAa72.22588
Date: Tue, 24 Jun 2014 14:22:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77674

--- Comment #4 from jason leroy <jsnlry-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I am experiencing the same issue on ArchLinux. My Hardware:

 * HP EliteBook 8440p
 * VGA compatible controller: NVIDIA Corporation GT218M [NVS 3100M]

Installed software:

 * ArchLinux with all available updates
 * Kernel 3.15.1-1-ARCH
 * nouveau-dri 10.2.1-2
 * xf86-video-nouveau 1.0.10-2
 * lib32-nouveau-dri 10.2.1-3

My Log shows the following for nouveau when I suspend/resume the system:

nouveau  [     DRM] suspending display...
nouveau  [     DRM] unpinning framebuffer(s)...
nouveau  [     DRM] evicting buffers...
nouveau  [     DRM] waiting for kernel channels to go idle...
nouveau  [     DRM] suspending client object trees...
nouveau  [     DRM] suspending kernel object tree...
nouveau  [     DRM] re-enabling device...
nouveau  [     DRM] resuming kernel object tree...
nouveau  [   VBIOS][0000:01:00.0] running init tables
nouveau  [    VOLT][0000:01:00.0] GPU voltage: 850000uv
nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
nouveau  [     CLK][0000:01:00.0] --: core 405 MHz shader 810 MHz memory 405
MHz
nouveau  [     DRM] resuming client object trees...
nouveau  [     DRM] resuming display...
nouveau E[   PDISP][0000:01:00.0] DP:0006:0344: failed to read DPCD
nouveau E[   PDISP][0000:01:00.0] DP:0006:0344: link training failed

In my case there is NO external display and also NO docking station. It's the
display of the laptop that remains black.

For me, long-pressing the power button is the only way out of this situation.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403619770.AaAa72.22588
Date: Tue, 24 Jun 2014 14:22:50 +0000
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
   title="NEW --- - [NVE7] &quot;failed to read DPCD&quot; on wake up with external monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77674#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] &quot;failed to read DPCD&quot; on wake up with external monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77674">bug 77674</a>
              from <span class="vcard"><a class="email" href="mailto:jsnlry&#64;gmail.com" title="jason leroy &lt;jsnlry&#64;gmail.com&gt;"> <span class="fn">jason leroy</span></a>
</span></b>
        <pre>I am experiencing the same issue on ArchLinux. My Hardware:

 * HP EliteBook 8440p
 * VGA compatible controller: NVIDIA Corporation GT218M [NVS 3100M]

Installed software:

 * ArchLinux with all available updates
 * Kernel 3.15.1-1-ARCH
 * nouveau-dri 10.2.1-2
 * xf86-video-nouveau 1.0.10-2
 * lib32-nouveau-dri 10.2.1-3

My Log shows the following for nouveau when I suspend/resume the system:

nouveau  [     DRM] suspending display...
nouveau  [     DRM] unpinning framebuffer(s)...
nouveau  [     DRM] evicting buffers...
nouveau  [     DRM] waiting for kernel channels to go idle...
nouveau  [     DRM] suspending client object trees...
nouveau  [     DRM] suspending kernel object tree...
nouveau  [     DRM] re-enabling device...
nouveau  [     DRM] resuming kernel object tree...
nouveau  [   VBIOS][0000:01:00.0] running init tables
nouveau  [    VOLT][0000:01:00.0] GPU voltage: 850000uv
nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
nouveau  [     CLK][0000:01:00.0] --: core 405 MHz shader 810 MHz memory 405
MHz
nouveau  [     DRM] resuming client object trees...
nouveau  [     DRM] resuming display...
nouveau E[   PDISP][0000:01:00.0] DP:0006:0344: failed to read DPCD
nouveau E[   PDISP][0000:01:00.0] DP:0006:0344: link training failed

In my case there is NO external display and also NO docking station. It's the
display of the laptop that remains black.

For me, long-pressing the power button is the only way out of this situation.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403619770.AaAa72.22588--

--===============0327051241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0327051241==--
