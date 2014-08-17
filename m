From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Sun, 17 Aug 2014 14:30:04 +0000
Message-ID: <bug-59168-8800-4nWndswYNZ@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0744527766=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0744527766==
Content-Type: multipart/alternative; boundary="1408285804.CDa71Fbd2.17979"; charset="us-ascii"


--1408285804.CDa71Fbd2.17979
Date: Sun, 17 Aug 2014 14:30:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #50 from Christian Costa <titan.costa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Same problem here after suspend/resume. The console is flooded with the same
messages below for a short period then a white screen appears with a slight
noise. CTL-ALT-F1 does not work so I have to reboot.

[  392.485883] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  392.489922] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 2 [0x00bfa80000
Xorg[1154]]

I created a file in /etc/modprobe.d with the line "nouveau.config=PCE1=0" but
that does not help. Is this correct? Or do I need a more recent kernel?

I use an Ubuntu 14.04 64-bits. Here is my system information:

lspci:
01:00.0 VGA compatible controller: NVIDIA Corporation GF116M [GeForce GT 560M]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: ASUSTeK Computer Inc. Device 204a
    Flags: bus master, fast devsel, latency 0, IRQ 47
    Memory at f2000000 (32-bit, non-prefetchable) [size=32M]
    Memory at e0000000 (64-bit, prefetchable) [size=128M]
    Memory at e8000000 (64-bit, prefetchable) [size=64M]
    I/O ports at d000 [size=128]
    Expansion ROM at f4000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 <?>
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting <?>
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
    Kernel driver in use: nouveau

kernel: 3.13.0-34-generic
libdrm: 2.4.52-1
mesa: 10.1.3-0ubuntu0.1 (same with 10.2.5 compiled from git)
xorg: 1.15.1-0ubuntu2.1
xorg-video-nouveau: 1.0.10-1ubuntu2

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408285804.CDa71Fbd2.17979
Date: Sun, 17 Aug 2014 14:30:04 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c50">Comment # 50</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:titan.costa&#64;gmail.com" title="Christian Costa &lt;titan.costa&#64;gmail.com&gt;"> <span class="fn">Christian Costa</span></a>
</span></b>
        <pre>Same problem here after suspend/resume. The console is flooded with the same
messages below for a short period then a white screen appears with a slight
noise. CTL-ALT-F1 does not work so I have to reboot.

[  392.485883] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e
[  392.489922] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 2 [0x00bfa80000
Xorg[1154]]

I created a file in /etc/modprobe.d with the line &quot;nouveau.config=PCE1=0&quot; but
that does not help. Is this correct? Or do I need a more recent kernel?

I use an Ubuntu 14.04 64-bits. Here is my system information:

lspci:
01:00.0 VGA compatible controller: NVIDIA Corporation GF116M [GeForce GT 560M]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: ASUSTeK Computer Inc. Device 204a
    Flags: bus master, fast devsel, latency 0, IRQ 47
    Memory at f2000000 (32-bit, non-prefetchable) [size=32M]
    Memory at e0000000 (64-bit, prefetchable) [size=128M]
    Memory at e8000000 (64-bit, prefetchable) [size=64M]
    I/O ports at d000 [size=128]
    Expansion ROM at f4000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting &lt;?&gt;
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 &lt;?&gt;
    Kernel driver in use: nouveau

kernel: 3.13.0-34-generic
libdrm: 2.4.52-1
mesa: 10.1.3-0ubuntu0.1 (same with 10.2.5 compiled from git)
xorg: 1.15.1-0ubuntu2.1
xorg-video-nouveau: 1.0.10-1ubuntu2</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408285804.CDa71Fbd2.17979--

--===============0744527766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0744527766==--
