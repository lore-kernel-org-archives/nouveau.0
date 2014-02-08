From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67878] [NV98] [BISECTED] Hardware freeze after
 resume from suspend
Date: Sat, 08 Feb 2014 06:20:35 +0000
Message-ID: <bug-67878-8800-G1AsLDSA97@http.bugs.freedesktop.org/>
References: <bug-67878-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0288337306=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67878-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0288337306==
Content-Type: multipart/alternative; boundary="1391840435.4Bd83b853.1674"; charset="us-ascii"


--1391840435.4Bd83b853.1674
Date: Sat, 8 Feb 2014 06:20:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67878

--- Comment #37 from Brian <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I've been following this ticket and attempting to poke around a bit. I just
tested my hardware with various points in the 3.6, 3.7, and 3.7-rc kernels, and
all of those still gave me a non-responsive screen with messages like the
following after resume. e.g., on Linux 3.6:

[  161.192867] [drm] nouveau 0000:01:00.0: Failed to idle channel 2.
[  164.355897] [drm] nouveau 0000:01:00.0: Failed to idle channel 4.

or on Linux 3.7.9:

[  336.337207] nouveau E[    3134] failed to idle channel 0xcccc0000

None of these builds give me a PAGE_NOT_PRESENT error, though. This makes it
hard to bisect, as I can't find any working point to test...

My hardware:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT218M [NVS 3100M]
[10de:0a6c] (rev a2) (prog-if 00 [VGA controller])
    Subsystem: Dell Device [1028:040a]
    Flags: bus master, fast devsel, latency 0, IRQ 16
    Memory at e2000000 (32-bit, non-prefetchable) [size=16M]
    Memory at d0000000 (64-bit, prefetchable) [size=256M]
    Memory at e0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at 7000 [size=128]
    Expansion ROM at e3000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 <?>
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting <?>
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
    Kernel driver in use: nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391840435.4Bd83b853.1674
Date: Sat, 8 Feb 2014 06:20:35 +0000
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
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878#c37">Comment # 37</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV98] [BISECTED] Hardware freeze after resume from suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67878">bug 67878</a>
              from <span class="vcard"><a class="email" href="mailto:computersforpeace&#64;gmail.com" title="Brian &lt;computersforpeace&#64;gmail.com&gt;"> <span class="fn">Brian</span></a>
</span></b>
        <pre>I've been following this ticket and attempting to poke around a bit. I just
tested my hardware with various points in the 3.6, 3.7, and 3.7-rc kernels, and
all of those still gave me a non-responsive screen with messages like the
following after resume. e.g., on Linux 3.6:

[  161.192867] [drm] nouveau 0000:01:00.0: Failed to idle channel 2.
[  164.355897] [drm] nouveau 0000:01:00.0: Failed to idle channel 4.

or on Linux 3.7.9:

[  336.337207] nouveau E[    3134] failed to idle channel 0xcccc0000

None of these builds give me a PAGE_NOT_PRESENT error, though. This makes it
hard to bisect, as I can't find any working point to test...

My hardware:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GT218M [NVS 3100M]
[10de:0a6c] (rev a2) (prog-if 00 [VGA controller])
    Subsystem: Dell Device [1028:040a]
    Flags: bus master, fast devsel, latency 0, IRQ 16
    Memory at e2000000 (32-bit, non-prefetchable) [size=16M]
    Memory at d0000000 (64-bit, prefetchable) [size=256M]
    Memory at e0000000 (64-bit, prefetchable) [size=32M]
    I/O ports at 7000 [size=128]
    Expansion ROM at e3000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting &lt;?&gt;
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 &lt;?&gt;
    Kernel driver in use: nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391840435.4Bd83b853.1674--

--===============0288337306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0288337306==--
