From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58378] Distorted graphics on NVIDIA GeForce 8400M G
 after upgrade the kernel to 3.7.0 version
Date: Thu, 28 Nov 2013 11:17:49 +0000
Message-ID: <bug-58378-8800-Mi0srmKPe2@http.bugs.freedesktop.org/>
References: <bug-58378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1338903566=="
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


--===============1338903566==
Content-Type: multipart/alternative; boundary="1385637469.370a5.29535"; charset="us-ascii"


--1385637469.370a5.29535
Date: Thu, 28 Nov 2013 11:17:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58378

--- Comment #13 from torsten.stocklossa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Hi, same here after updating to Ubuntu 12.04.3 

Kernel 3.8.0-33-generic


lspci -nnvv says:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G86M [GeForce
8400M G] [10de:0428] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: Fujitsu Limited. Device [10cf:1422]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
    Latency: 0, Cache Line Size: 64 bytes
    Interrupt: pin A routed to IRQ 16
    Region 0: Memory at de000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at e0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at dc000000 (64-bit, non-prefetchable) [size=32M]
    Region 5: I/O ports at 2000 [size=128]
    Expansion ROM at <unassigned> [disabled]
    Capabilities: <access denied>
    Kernel driver in use: nouveau
    Kernel modules: nouveau, nvidiafb

Graphic is distorted once it happens the system is frozen ( with some luck I
may reach a terminal ) 

Before it happens the fontcolor in Windowframes changes to "white on white "
e.g. same as the background color 
I run a E8410 Lifebook 

BTW : Using the Nvidia proprietary drivers is not an option they made the
system unusable at all and forced me to reinstall several times

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1385637469.370a5.29535
Date: Thu, 28 Nov 2013 11:17:49 +0000
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
   title="NEW --- - Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Distorted graphics on NVIDIA GeForce 8400M G after upgrade the kernel to 3.7.0 version"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58378">bug 58378</a>
              from <span class="vcard"><a class="email" href="mailto:torsten.stocklossa&#64;gmail.com" title="torsten.stocklossa&#64;gmail.com">torsten.stocklossa&#64;gmail.com</a>
</span></b>
        <pre>Hi, same here after updating to Ubuntu 12.04.3 

Kernel 3.8.0-33-generic


lspci -nnvv says:
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation G86M [GeForce
8400M G] [10de:0428] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: Fujitsu Limited. Device [10cf:1422]
    Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR+ FastB2B- DisINTx-
    Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast &gt;TAbort- &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
    Latency: 0, Cache Line Size: 64 bytes
    Interrupt: pin A routed to IRQ 16
    Region 0: Memory at de000000 (32-bit, non-prefetchable) [size=16M]
    Region 1: Memory at e0000000 (64-bit, prefetchable) [size=256M]
    Region 3: Memory at dc000000 (64-bit, non-prefetchable) [size=32M]
    Region 5: I/O ports at 2000 [size=128]
    Expansion ROM at &lt;unassigned&gt; [disabled]
    Capabilities: &lt;access denied&gt;
    Kernel driver in use: nouveau
    Kernel modules: nouveau, nvidiafb

Graphic is distorted once it happens the system is frozen ( with some luck I
may reach a terminal ) 

Before it happens the fontcolor in Windowframes changes to &quot;white on white &quot;
e.g. same as the background color 
I run a E8410 Lifebook 

BTW : Using the Nvidia proprietary drivers is not an option they made the
system unusable at all and forced me to reinstall several times</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1385637469.370a5.29535--

--===============1338903566==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1338903566==--
