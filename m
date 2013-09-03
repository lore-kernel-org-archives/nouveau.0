From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Tue, 03 Sep 2013 01:05:02 +0000
Message-ID: <bug-59168-8800-WIcFJRcmXZ@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1425009548=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1425009548==
Content-Type: multipart/alternative; boundary="1378170302.DAe24.5141"; charset="us-ascii"


--1378170302.DAe24.5141
Date: Tue, 3 Sep 2013 01:05:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

--- Comment #39 from Laurence Lee <rubyjedi-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I hate to resurrect a zombie thread, but I am still affected by this
suspend/resume issue. My system also reports "SHADER 0xa004021e" as a common
point of failure.

On Fedora 18, kernel 3.10.10-100.fc18.x86_64), my screen resumes from
hibernation with garbage on-screen as described in this ticket, and messages
like these are repeated in the logs:

Sep  2 14:23:38 ufo-laptop kernel: [   66.074252] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x005fbb1000 X[846]]
Sep  2 14:23:38 ufo-laptop kernel: [   66.074264] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e


lspci -nnv:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation Device [10de:1251]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: CLEVO/KAPOK Computer Device [1558:5102]
    Flags: bus master, fast devsel, latency 0, IRQ 16
    Memory at f4000000 (32-bit, non-prefetchable) [size=32M]
    Memory at e8000000 (64-bit, prefetchable) [size=128M]
    Memory at f0000000 (64-bit, prefetchable) [size=64M]
    I/O ports at e000 [size=128]
    Expansion ROM at f6000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 <?>
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting <?>
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
    Kernel driver in use: nouveau


The only thing that works at the moment is setting nouveau.noaccel=1. Setting
nouveau.config=DEVINIG=NvForcePost=1 causes bootup to Plymouth with a black,
unlit screen.

I would really like to have a long-term solution to this, and am willing to act
upon any suggestions or patches you may have to reach that goal. Thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378170302.DAe24.5141
Date: Tue, 3 Sep 2013 01:05:02 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c39">Comment # 39</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:rubyjedi&#64;gmail.com" title="Laurence Lee &lt;rubyjedi&#64;gmail.com&gt;"> <span class="fn">Laurence Lee</span></a>
</span></b>
        <pre>I hate to resurrect a zombie thread, but I am still affected by this
suspend/resume issue. My system also reports &quot;SHADER 0xa004021e&quot; as a common
point of failure.

On Fedora 18, kernel 3.10.10-100.fc18.x86_64), my screen resumes from
hibernation with garbage on-screen as described in this ticket, and messages
like these are repeated in the logs:

Sep  2 14:23:38 ufo-laptop kernel: [   66.074252] nouveau E[ 
PGRAPH][0000:01:00.0] TRAP ch 1 [0x005fbb1000 X[846]]
Sep  2 14:23:38 ufo-laptop kernel: [   66.074264] nouveau E[ 
PGRAPH][0000:01:00.0] SHADER 0xa004021e


lspci -nnv:

01:00.0 VGA compatible controller [0300]: NVIDIA Corporation Device [10de:1251]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: CLEVO/KAPOK Computer Device [1558:5102]
    Flags: bus master, fast devsel, latency 0, IRQ 16
    Memory at f4000000 (32-bit, non-prefetchable) [size=32M]
    Memory at e8000000 (64-bit, prefetchable) [size=128M]
    Memory at f0000000 (64-bit, prefetchable) [size=64M]
    I/O ports at e000 [size=128]
    Expansion ROM at f6000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting &lt;?&gt;
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 &lt;?&gt;
    Kernel driver in use: nouveau


The only thing that works at the moment is setting nouveau.noaccel=1. Setting
nouveau.config=DEVINIG=NvForcePost=1 causes bootup to Plymouth with a black,
unlit screen.

I would really like to have a long-term solution to this, and am willing to act
upon any suggestions or patches you may have to reach that goal. Thanks!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378170302.DAe24.5141--

--===============1425009548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1425009548==--
