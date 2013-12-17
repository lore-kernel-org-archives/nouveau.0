From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] [NV86] Distorted graphics on NVIDIA GeForce
 8400M G after upgrade the kernel to 3.7.0 version
Date: Tue, 17 Dec 2013 21:34:34 +0000
Message-ID: <bug-58378-8800-nxcIDhswvF@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2023525179=="
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


--===============2023525179==
Content-Type: multipart/alternative; boundary="1387316074.7f0Ff1c6.27188"; charset="us-ascii"


--1387316074.7f0Ff1c6.27188
Date: Tue, 17 Dec 2013 21:34:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #44 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Try commenting the same line out and see what happens... (i.e. the one with
0x74c1)

FWIW I do remember seeing some PCRYPT-related (and PVP/PBSP-related) errors on
start in the form of MMIO write failures in your log and thinking it odd:

nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010 FAULT at 0x10200c

Which of course is an enable of FIFO_ACCESS... probably pretty important. (See
https://github.com/envytools/envytools/blob/master/rnndb/vdec/vp2/pcrypt2.xml)
But why do you get that error... anyone's guess. If you have the blob
installed, would be interested to know if VDPAU hw decode acceleration works
for H.264 (i.e. things are actually accelerated), because you get similar
errors for the VP/BSP engines:

nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT at 0x00fd94
nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT at 0x103d94

And they're all interconnected, I think. [Sadly none of the other bug
commenters were kind enough to leave a kernel log around, so can't easily tell
if that was their issue as well.]

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1387316074.7f0Ff1c6.27188
Date: Tue, 17 Dec 2013 21:34:34 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c44">Comment # 44</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Try commenting the same line out and see what happens... (i.e. the one with
0x74c1)

FWIW I do remember seeing some PCRYPT-related (and PVP/PBSP-related) errors on
start in the form of MMIO write failures in your log and thinking it odd:

nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000010 FAULT at 0x10200c

Which of course is an enable of FIFO_ACCESS... probably pretty important. (See
<a href="https://github.com/envytools/envytools/blob/master/rnndb/vdec/vp2/pcrypt2.xml">https://github.com/envytools/envytools/blob/master/rnndb/vdec/vp2/pcrypt2.xml</a>)
But why do you get that error... anyone's guess. If you have the blob
installed, would be interested to know if VDPAU hw decode acceleration works
for H.264 (i.e. things are actually accelerated), because you get similar
errors for the VP/BSP engines:

nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT at 0x00fd94
nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00000000 FAULT at 0x103d94

And they're all interconnected, I think. [Sadly none of the other bug
commenters were kind enough to leave a kernel log around, so can't easily tell
if that was their issue as well.]</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1387316074.7f0Ff1c6.27188--

--===============2023525179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2023525179==--
