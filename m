From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59168] [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic
 garbage/corruption/noise on resume
Date: Fri, 11 Apr 2014 13:40:07 +0000
Message-ID: <bug-59168-8800-dtoWoShNYI@http.bugs.freedesktop.org/>
References: <bug-59168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0980569912=="
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


--===============0980569912==
Content-Type: multipart/alternative; boundary="1397223607.58365ea1.15119"; charset="us-ascii"


--1397223607.58365ea1.15119
Date: Fri, 11 Apr 2014 13:40:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59168

cdep.illabout+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |cdep.illabout+freedesktop@g
                   |                            |mail.com

--- Comment #49 from cdep.illabout+freedesktop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I was also experiencing the problem of corruption after a suspend/resume. 
Adding "nouveau.config=PCE1=0" has seemed to fix it.

I am on Arch Linux.  Here is my lspci -v:

01:00.0 VGA compatible controller: NVIDIA Corporation GF116M [GeForce GT 560M]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: CLEVO/KAPOK Computer Device 5102
    Flags: bus master, fast devsel, latency 0, IRQ 54
    Memory at f4000000 (32-bit, non-prefetchable) [size=32M]
    Memory at e8000000 (64-bit, prefetchable) [size=128M]
    Memory at f0000000 (64-bit, prefetchable) [size=64M]
    I/O ports at e000 [size=128]
    Expansion ROM at f6000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 <?>
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting <?>
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 <?>
    Kernel driver in use: nouveau
    Kernel modules: nouveau

I got the same errors in my dmesg as everyone else.  These two lines basically
repeat forever:

[   74.912769] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 2 [0x005fba0000
X[2244]]
[   74.912788] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e

Here are my Arch Linux package versions:

extra/nouveau-dri 10.1.0-4
local/nouveau-fw 325.15-1
extra/xf86-video-nouveau 1.0.10-2

extra/libdrm 2.4.52-1

core/linux 3.14-4 (base)
core/linux-api-headers 3.13.2-1
core/linux-firmware 20140316.dec41bc-1
core/linux-headers 3.14-4

extra/mesa 10.1.0-4
extra/mesa-demos 8.1.0-1
extra/mesa-libgl 10.1.0-4

Xorg.0.log doesn't have anything particularly interesting in it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397223607.58365ea1.15119
Date: Fri, 11 Apr 2014 13:40:07 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:cdep.illabout+freedesktop&#64;gmail.com" title="cdep.illabout+freedesktop&#64;gmail.com">cdep.illabout+freedesktop&#64;gmail.com</a>
</span> changed
              <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>cdep.illabout+freedesktop&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168#c49">Comment # 49</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [nvc1/Quardro1000M|nvc3/Quadro2000M] graphic garbage/corruption/noise on resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59168">bug 59168</a>
              from <span class="vcard"><a class="email" href="mailto:cdep.illabout+freedesktop&#64;gmail.com" title="cdep.illabout+freedesktop&#64;gmail.com">cdep.illabout+freedesktop&#64;gmail.com</a>
</span></b>
        <pre>I was also experiencing the problem of corruption after a suspend/resume. 
Adding &quot;nouveau.config=PCE1=0&quot; has seemed to fix it.

I am on Arch Linux.  Here is my lspci -v:

01:00.0 VGA compatible controller: NVIDIA Corporation GF116M [GeForce GT 560M]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: CLEVO/KAPOK Computer Device 5102
    Flags: bus master, fast devsel, latency 0, IRQ 54
    Memory at f4000000 (32-bit, non-prefetchable) [size=32M]
    Memory at e8000000 (64-bit, prefetchable) [size=128M]
    Memory at f0000000 (64-bit, prefetchable) [size=64M]
    I/O ports at e000 [size=128]
    Expansion ROM at f6000000 [disabled] [size=512K]
    Capabilities: [60] Power Management version 3
    Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [b4] Vendor Specific Information: Len=14 &lt;?&gt;
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting &lt;?&gt;
    Capabilities: [600] Vendor Specific Information: ID=0001 Rev=1 Len=024 &lt;?&gt;
    Kernel driver in use: nouveau
    Kernel modules: nouveau

I got the same errors in my dmesg as everyone else.  These two lines basically
repeat forever:

[   74.912769] nouveau E[  PGRAPH][0000:01:00.0] TRAP ch 2 [0x005fba0000
X[2244]]
[   74.912788] nouveau E[  PGRAPH][0000:01:00.0] SHADER 0xa004021e

Here are my Arch Linux package versions:

extra/nouveau-dri 10.1.0-4
local/nouveau-fw 325.15-1
extra/xf86-video-nouveau 1.0.10-2

extra/libdrm 2.4.52-1

core/linux 3.14-4 (base)
core/linux-api-headers 3.13.2-1
core/linux-firmware 20140316.dec41bc-1
core/linux-headers 3.14-4

extra/mesa 10.1.0-4
extra/mesa-demos 8.1.0-1
extra/mesa-libgl 10.1.0-4

Xorg.0.log doesn't have anything particularly interesting in it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397223607.58365ea1.15119--

--===============0980569912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0980569912==--
