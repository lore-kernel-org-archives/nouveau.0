From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80145] New: [NV46] GPU lockup - switching to
	software fbcon
Date: Tue, 17 Jun 2014 16:02:00 +0000
Message-ID: <bug-80145-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1783915340=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1783915340==
Content-Type: multipart/alternative; boundary="1403020920.8cad7f631.16064"; charset="us-ascii"


--1403020920.8cad7f631.16064
Date: Tue, 17 Jun 2014 16:02:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80145

          Priority: medium
            Bug ID: 80145
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV46] GPU lockup - switching to software fbcon
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: jesus.guerrero.botella-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

The GPU is this one:

01:00.0 VGA compatible controller: NVIDIA Corporation G72M [Quadro NVS
110M/GeForce Go 7300] (rev a1)

The thing goes as follows:

1) I run "mplayer <random video file>", I have tried mkv and regular divx or
mpeg video files, also youtube videos via the youtube-viewer tool, which uses
mplayer as a backend to play youtube videos. The result is always the same,
with independence of the video type.

2) The laptop seems to hang. However, I can still move the mouse. No element in
the UI reacts though.

3) If I wait enough time, I am suddenly thrown out to the VT, the pc still
seems quite laggy. Eventually, it recovers and I can write commands into the
VT.

4) At the end of dmesg I can see by now this output:

[  268.469736] nouveau E[     DRM] GPU lockup - switching to software fbcon
[  283.487035] nouveau E[ X[2154]] failed to idle channel 0xcccc0001 [X[2154]]
[  298.487016] nouveau E[ X[2154]] failed to idle channel 0xcccc0001 [X[2154]]
[  313.487034] nouveau E[ X[2154]] failed to idle channel 0xcccc0000 [X[2154]]
[  328.487016] nouveau E[ X[2154]] failed to idle channel 0xcccc0000 [X[2154]]
[  343.587031] nouveau E[chrome[2279]] failed to idle channel 0xcccc0000
[chrome[2279]]
[  358.587019] nouveau E[chrome[2279]] failed to idle channel 0xcccc0000
[chrome[2279]]
[  373.589020] nouveau E[mplayer[2314]] failed to idle channel 0xcccc0000
[mplayer[2314]]
[  388.589031] nouveau E[mplayer[2314]] failed to idle channel 0xcccc0000
[mplayer[2314]]

5) In the X log I can see this:

(EE) [mi] EQ overflowing.  Additional events will be discarded until existing
events are processed.
(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x42) [0x592d42]
(EE) 1: /usr/bin/X (mieqEnqueue+0x26b) [0x5741fb]
(EE) 2: /usr/bin/X (0x400000+0x50fc2) [0x450fc2]
(EE) 3: /usr/bin/X (xf86PostMotionEvent+0xc0) [0x489eb0]
(EE) 4: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7ff5f046c000+0x535c)
[0x7ff5f047135c]
(EE) 5: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7ff5f046c000+0x6f32)
[0x7ff5f0472f32]
(EE) 6: /usr/bin/X (0x400000+0x7a087) [0x47a087]
(EE) 7: /usr/bin/X (0x400000+0xa3518) [0x4a3518]
(EE) 8: /lib64/libpthread.so.0 (0x7ff5f6f47000+0x10b10) [0x7ff5f6f57b10]
(EE) 9: /lib64/libc.so.6 (ioctl+0x7) [0x7ff5f5c8e897]
(EE) 10: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7ff5f6d3f258]
(EE) 11: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7ff5f6d4162b]
(EE) 12: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x89) [0x7ff5f301b959]
(EE) 13: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7ff5f3220000+0x7bb3)
[0x7ff5f3227bb3]
(EE) 14: /usr/lib64/xorg/modules/libexa.so (0x7ff5f2bdb000+0xbba0)
[0x7ff5f2be6ba0]
(EE) 15: /usr/bin/X (0x400000+0x183a73) [0x583a73]
(EE) 16: /usr/bin/X (0x400000+0xc8dc0) [0x4c8dc0]
(EE) 17: /usr/bin/X (0x400000+0x38eb8) [0x438eb8]
(EE) 18: /usr/bin/X (0x400000+0x3bd2e) [0x43bd2e]
(EE) 19: /usr/bin/X (0x400000+0x3faea) [0x43faea]
(EE) 20: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x7ff5f5bcdbf5]
(EE) 21: /usr/bin/X (0x400000+0x2a541) [0x42a541]
(EE)
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.

=================================

This is on Gentoo, with kernel 3.15.0 (but it also happened with 3.14.5. The
arch is amd64. I am using nouveau 1.0.10, mesa 10.0.4, libdrm 2.4.52 and
(probably irrelevant) mplayer 1.1.1.

The kernel is unpatched, from kernel.org (no Gentoo stuff nor anything like
that).

Since I've seen several messages around the net about old kernel versions, and
they eventually got fixed by a kernel update, I guess this is a good candidate
for a regression. But to confirm that I will have to find an older kernel
version that works. That might take some time.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403020920.8cad7f631.16064
Date: Tue, 17 Jun 2014 16:02:00 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV46] GPU lockup - switching to software fbcon"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80145">80145</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV46] GPU lockup - switching to software fbcon
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>jesus.guerrero.botella&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>The GPU is this one:

01:00.0 VGA compatible controller: NVIDIA Corporation G72M [Quadro NVS
110M/GeForce Go 7300] (rev a1)

The thing goes as follows:

1) I run &quot;mplayer &lt;random video file&gt;&quot;, I have tried mkv and regular divx or
mpeg video files, also youtube videos via the youtube-viewer tool, which uses
mplayer as a backend to play youtube videos. The result is always the same,
with independence of the video type.

2) The laptop seems to hang. However, I can still move the mouse. No element in
the UI reacts though.

3) If I wait enough time, I am suddenly thrown out to the VT, the pc still
seems quite laggy. Eventually, it recovers and I can write commands into the
VT.

4) At the end of dmesg I can see by now this output:

[  268.469736] nouveau E[     DRM] GPU lockup - switching to software fbcon
[  283.487035] nouveau E[ X[2154]] failed to idle channel 0xcccc0001 [X[2154]]
[  298.487016] nouveau E[ X[2154]] failed to idle channel 0xcccc0001 [X[2154]]
[  313.487034] nouveau E[ X[2154]] failed to idle channel 0xcccc0000 [X[2154]]
[  328.487016] nouveau E[ X[2154]] failed to idle channel 0xcccc0000 [X[2154]]
[  343.587031] nouveau E[chrome[2279]] failed to idle channel 0xcccc0000
[chrome[2279]]
[  358.587019] nouveau E[chrome[2279]] failed to idle channel 0xcccc0000
[chrome[2279]]
[  373.589020] nouveau E[mplayer[2314]] failed to idle channel 0xcccc0000
[mplayer[2314]]
[  388.589031] nouveau E[mplayer[2314]] failed to idle channel 0xcccc0000
[mplayer[2314]]

5) In the X log I can see this:

(EE) [mi] EQ overflowing.  Additional events will be discarded until existing
events are processed.
(EE)
(EE) Backtrace:
(EE) 0: /usr/bin/X (xorg_backtrace+0x42) [0x592d42]
(EE) 1: /usr/bin/X (mieqEnqueue+0x26b) [0x5741fb]
(EE) 2: /usr/bin/X (0x400000+0x50fc2) [0x450fc2]
(EE) 3: /usr/bin/X (xf86PostMotionEvent+0xc0) [0x489eb0]
(EE) 4: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7ff5f046c000+0x535c)
[0x7ff5f047135c]
(EE) 5: /usr/lib64/xorg/modules/input/synaptics_drv.so (0x7ff5f046c000+0x6f32)
[0x7ff5f0472f32]
(EE) 6: /usr/bin/X (0x400000+0x7a087) [0x47a087]
(EE) 7: /usr/bin/X (0x400000+0xa3518) [0x4a3518]
(EE) 8: /lib64/libpthread.so.0 (0x7ff5f6f47000+0x10b10) [0x7ff5f6f57b10]
(EE) 9: /lib64/libc.so.6 (ioctl+0x7) [0x7ff5f5c8e897]
(EE) 10: /usr/lib64/libdrm.so.2 (drmIoctl+0x28) [0x7ff5f6d3f258]
(EE) 11: /usr/lib64/libdrm.so.2 (drmCommandWrite+0x1b) [0x7ff5f6d4162b]
(EE) 12: /usr/lib64/libdrm_nouveau.so.2 (nouveau_bo_wait+0x89) [0x7ff5f301b959]
(EE) 13: /usr/lib64/xorg/modules/drivers/nouveau_drv.so (0x7ff5f3220000+0x7bb3)
[0x7ff5f3227bb3]
(EE) 14: /usr/lib64/xorg/modules/libexa.so (0x7ff5f2bdb000+0xbba0)
[0x7ff5f2be6ba0]
(EE) 15: /usr/bin/X (0x400000+0x183a73) [0x583a73]
(EE) 16: /usr/bin/X (0x400000+0xc8dc0) [0x4c8dc0]
(EE) 17: /usr/bin/X (0x400000+0x38eb8) [0x438eb8]
(EE) 18: /usr/bin/X (0x400000+0x3bd2e) [0x43bd2e]
(EE) 19: /usr/bin/X (0x400000+0x3faea) [0x43faea]
(EE) 20: /lib64/libc.so.6 (__libc_start_main+0xf5) [0x7ff5f5bcdbf5]
(EE) 21: /usr/bin/X (0x400000+0x2a541) [0x42a541]
(EE)
(EE) [mi] These backtraces from mieqEnqueue may point to a culprit higher up
the stack.
(EE) [mi] mieq is *NOT* the cause.  It is a victim.

=================================

This is on Gentoo, with kernel 3.15.0 (but it also happened with 3.14.5. The
arch is amd64. I am using nouveau 1.0.10, mesa 10.0.4, libdrm 2.4.52 and
(probably irrelevant) mplayer 1.1.1.

The kernel is unpatched, from kernel.org (no Gentoo stuff nor anything like
that).

Since I've seen several messages around the net about old kernel versions, and
they eventually got fixed by a kernel update, I guess this is a good candidate
for a regression. But to confirm that I will have to find an older kernel
version that works. That might take some time.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403020920.8cad7f631.16064--

--===============1783915340==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1783915340==--
