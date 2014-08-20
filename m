From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82835] GeForce 8800 GS VDPAU  h264 decoding hang
Date: Wed, 20 Aug 2014 04:04:25 +0000
Message-ID: <bug-82835-8800-RTrdJ8tFn0@http.bugs.freedesktop.org/>
References: <bug-82835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1126793667=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82835-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1126793667==
Content-Type: multipart/alternative; boundary="1408507464.DD7F012.1744"; charset="us-ascii"


--1408507464.DD7F012.1744
Date: Wed, 20 Aug 2014 04:04:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82835

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
From the log:

nouveau D[    PBSP][0000:05:00.0] Loading firmware to address: 0x17824000
nouveau D[   PFIFO][0000:05:00.0][0xc000826f][f5f05e40] attached PBSP context
nouveau D[     PVP][0000:05:00.0] reset
nouveau D[     PVP][0000:05:00.0] Loading firmware to address: 0x177d4000
nouveau D[   PFIFO][0000:05:00.0][0xc000826f][f5c0bf00] attached PVP context
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 0 - RT_FAULT - Address
0020404c40
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 0 - e0c: 00000000, e18:
00000000, e1c: 00400010, e20: 00001100, e24: 00030000
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 1 - RT_FAULT - Address
0020404000
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 1 - e0c: 00000000, e18:
00000000, e1c: 00340000, e20: 00001100, e24: 00030000
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 2 - RT_FAULT - Address
0020404040
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 2 - e0c: 00000000, e18:
00000000, e1c: 00340010, e20: 00001100, e24: 00030000
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 3 - RT_FAULT - Address
0020404080
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 3 - e0c: 00000000, e18:
00000000, e1c: 00340020, e20: 00001100, e24: 00030000
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 4 - RT_FAULT - Address
00204040c0
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 4 - e0c: 00000000, e18:
00000000, e1c: 00340030, e20: 00001100, e24: 00030000
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 5 - RT_FAULT - Address
0020404c00
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 5 - e0c: 00000000, e18:
00000000, e1c: 00400000, e20: 00001100, e24: 00030000
nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[7033]] subc 3
class 0x8297 mthd 0x1b0c data 0x1000f010
nouveau E[     PFB][0000:05:00.0] trapped write at 0x00204040c0 on channel
0x000178fb [mplayer[7033]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT
nouveau D[   PFIFO][0000:05:00.0][0xc000826f][f5f05e40] detached PBSP context
nouveau D[   PFIFO][0000:05:00.0][0xc000826f][f5c0bf00] detached PVP context
nouveau E[     PFB][0000:05:00.0] trapped write at 0x002050c6c0 on channel
0x000178fb [mplayer[7033]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT


And then things go downhill. I wonder why it detaches the PBSP/PVP contexts,
that's a bit odd.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408507464.DD7F012.1744
Date: Wed, 20 Aug 2014 04:04:24 +0000
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
   title="NEW --- - GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835">bug 82835</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>From the log:

nouveau D[    PBSP][0000:05:00.0] Loading firmware to address: 0x17824000
nouveau D[   PFIFO][0000:05:00.0][0xc000826f][f5f05e40] attached PBSP context
nouveau D[     PVP][0000:05:00.0] reset
nouveau D[     PVP][0000:05:00.0] Loading firmware to address: 0x177d4000
nouveau D[   PFIFO][0000:05:00.0][0xc000826f][f5c0bf00] attached PVP context
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 0 - RT_FAULT - Address
0020404c40
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 0 - e0c: 00000000, e18:
00000000, e1c: 00400010, e20: 00001100, e24: 00030000
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 1 - RT_FAULT - Address
0020404000
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 1 - e0c: 00000000, e18:
00000000, e1c: 00340000, e20: 00001100, e24: 00030000
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 2 - RT_FAULT - Address
0020404040
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 2 - e0c: 00000000, e18:
00000000, e1c: 00340010, e20: 00001100, e24: 00030000
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 3 - RT_FAULT - Address
0020404080
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 3 - e0c: 00000000, e18:
00000000, e1c: 00340020, e20: 00001100, e24: 00030000
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 4 - RT_FAULT - Address
00204040c0
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 4 - e0c: 00000000, e18:
00000000, e1c: 00340030, e20: 00001100, e24: 00030000
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 5 - RT_FAULT - Address
0020404c00
nouveau E[  PGRAPH][0000:05:00.0] TRAP_PROP - TP 5 - e0c: 00000000, e18:
00000000, e1c: 00400000, e20: 00001100, e24: 00030000
nouveau E[  PGRAPH][0000:05:00.0] ch 4 [0x00178fb000 mplayer[7033]] subc 3
class 0x8297 mthd 0x1b0c data 0x1000f010
nouveau E[     PFB][0000:05:00.0] trapped write at 0x00204040c0 on channel
0x000178fb [mplayer[7033]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT
nouveau D[   PFIFO][0000:05:00.0][0xc000826f][f5f05e40] detached PBSP context
nouveau D[   PFIFO][0000:05:00.0][0xc000826f][f5c0bf00] detached PVP context
nouveau E[     PFB][0000:05:00.0] trapped write at 0x002050c6c0 on channel
0x000178fb [mplayer[7033]] PGRAPH/PROP/RT0 reason: PAGE_NOT_PRESENT


And then things go downhill. I wonder why it detaches the PBSP/PVP contexts,
that's a bit odd.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408507464.DD7F012.1744--

--===============1126793667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1126793667==--
