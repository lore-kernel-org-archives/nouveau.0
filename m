From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70389] [prime] unsynchronised rendering on secondary
	displays
Date: Wed, 13 Nov 2013 01:59:32 +0000
Message-ID: <bug-70389-8800-SI216cYoRh@http.bugs.freedesktop.org/>
References: <bug-70389-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1452512838=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70389-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1452512838==
Content-Type: multipart/alternative; boundary="1384307972.DBa12.14608"; charset="us-ascii"


--1384307972.DBa12.14608
Date: Wed, 13 Nov 2013 01:59:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70389

--- Comment #1 from Kevin Murphy <kemurphy.cmu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Also experiencing this on a Thinkpad T530 running Arch with kernel 3.11.6.

00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core processor
Graphics Controller (rev 09) (prog-if 00 [VGA controller])
        Subsystem: Lenovo Device 21f5
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 47
        Region 0: Memory at f1400000 (64-bit, non-prefetchable) [size=4M]
        Region 2: Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Region 4: I/O ports at 5000 [size=64]
        Expansion ROM at <unassigned> [disabled]
        Capabilities: <access denied>
        Kernel driver in use: i915
        Kernel modules: i915

01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [NVS 5400M] (rev
a1) (prog-if 00 [VGA controller])
        Subsystem: Lenovo Device 21f5
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 16
        Region 0: Memory at f0000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at d0000000 (64-bit, prefetchable) [size=32M]
        Region 5: I/O ports at 4000 [size=128]
        Expansion ROM at f1000000 [disabled] [size=512K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384307972.DBa12.14608
Date: Wed, 13 Nov 2013 01:59:32 +0000
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
   title="NEW --- - [prime] unsynchronised rendering on secondary displays"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70389#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [prime] unsynchronised rendering on secondary displays"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70389">bug 70389</a>
              from <span class="vcard"><a class="email" href="mailto:kemurphy.cmu&#64;gmail.com" title="Kevin Murphy &lt;kemurphy.cmu&#64;gmail.com&gt;"> <span class="fn">Kevin Murphy</span></a>
</span></b>
        <pre>Also experiencing this on a Thinkpad T530 running Arch with kernel 3.11.6.

00:02.0 VGA compatible controller: Intel Corporation 3rd Gen Core processor
Graphics Controller (rev 09) (prog-if 00 [VGA controller])
        Subsystem: Lenovo Device 21f5
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=fast &gt;TAbort- &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 47
        Region 0: Memory at f1400000 (64-bit, non-prefetchable) [size=4M]
        Region 2: Memory at e0000000 (64-bit, prefetchable) [size=256M]
        Region 4: I/O ports at 5000 [size=64]
        Expansion ROM at &lt;unassigned&gt; [disabled]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: i915
        Kernel modules: i915

01:00.0 VGA compatible controller: NVIDIA Corporation GF108M [NVS 5400M] (rev
a1) (prog-if 00 [VGA controller])
        Subsystem: Lenovo Device 21f5
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast &gt;TAbort- &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 16
        Region 0: Memory at f0000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at d0000000 (64-bit, prefetchable) [size=32M]
        Region 5: I/O ports at 4000 [size=128]
        Expansion ROM at f1000000 [disabled] [size=512K]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384307972.DBa12.14608--

--===============1452512838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1452512838==--
