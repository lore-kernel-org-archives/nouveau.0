From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Wed, 15 Jan 2014 23:21:26 +0000
Message-ID: <bug-58378-8800-3jc6vlmVPc@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1497514338=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58378-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1497514338==
Content-Type: multipart/alternative; boundary="1389828086.ED473.19904"; charset="us-ascii"


--1389828086.ED473.19904
Date: Wed, 15 Jan 2014 23:21:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #80 from Thomas <tomshere-zqRNUXuvxA0b1SvskN2V4Q@public.gmane.org> ---
Hello,

I have the same NVIDIA GeForce NVS 130M with the disabled functions.
I checked with nvapeek:
0000154c: 0000009c
00001540: b1010001

uname -a delivers
Linux mobuntu 3.11.0-15-generic #23-Ubuntu SMP Mon Dec 9 18:17:04 UTC 2013
x86_64 x86_64 x86_64 GNU/Linux

I do not have any issues with distorted graphics during normal usage but my
problem is that resume from suspend mode makes X hang.

I also have these errors in dmesg 

[   18.985158] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x00fd94
[   18.986213] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x103d94
[   19.026027] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010 FAULT
at 0x10200c

but also

[   18.984164] nouveau E[  PTHERM][0000:01:00.0] unhandled intr 0x00000161

When I use the kernel option nouveau.config=PCRYPT=0 it doesn't eliminate the
errors and X still hangs when resuming.
I was not sure if I have to set the parameter in quotes.
As you can see I'm not a linux specialist ;)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389828086.ED473.19904
Date: Wed, 15 Jan 2014 23:21:26 +0000
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
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c80">Comment # 80</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:tomshere&#64;t-online.de" title="Thomas &lt;tomshere&#64;t-online.de&gt;"> <span class="fn">Thomas</span></a>
</span></b>
        <pre>Hello,

I have the same NVIDIA GeForce NVS 130M with the disabled functions.
I checked with nvapeek:
0000154c: 0000009c
00001540: b1010001

uname -a delivers
Linux mobuntu 3.11.0-15-generic #23-Ubuntu SMP Mon Dec 9 18:17:04 UTC 2013
x86_64 x86_64 x86_64 GNU/Linux

I do not have any issues with distorted graphics during normal usage but my
problem is that resume from suspend mode makes X hang.

I also have these errors in dmesg 

[   18.985158] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x00fd94
[   18.986213] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT
at 0x103d94
[   19.026027] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010 FAULT
at 0x10200c

but also

[   18.984164] nouveau E[  PTHERM][0000:01:00.0] unhandled intr 0x00000161

When I use the kernel option nouveau.config=PCRYPT=0 it doesn't eliminate the
errors and X still hangs when resuming.
I was not sure if I have to set the parameter in quotes.
As you can see I'm not a linux specialist ;)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389828086.ED473.19904--

--===============1497514338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1497514338==--
