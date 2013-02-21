From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59057] Black screen after resume from s2ram
Date: Thu, 21 Feb 2013 11:30:38 +0000
Message-ID: <bug-59057-8800-Ptu8a6cjNp@http.bugs.freedesktop.org/>
References: <bug-59057-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0239741704=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-59057-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0239741704==
Content-Type: multipart/alternative; boundary="1361446239.081EFE75.10215"; charset="us-ascii"


--1361446239.081EFE75.10215
Date: Thu, 21 Feb 2013 11:30:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59057

--- Comment #25 from Alin M Elena <alinm.elena-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Just to summarise the hardware on which this was confirmed

Hardware is 8400M GS (10de:0427) in a Dell XPS M1330.

nvidia 320m in a macbook pro
04:00.0 VGA compatible controller: NVIDIA Corporation Device 08a0 (rev a2)
(prog-if 00 [VGA controller])
        Subsystem: Apple Inc. Device 00c2
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at d2000000 (32-bit, non-prefetchable) [size=16M]
        Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Memory at d0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at 1000 [size=128]
        Expansion ROM at d3000000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [e0] Vendor Specific Information: Len=14 <?>
        Kernel driver in use: nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361446239.081EFE75.10215
Date: Thu, 21 Feb 2013 11:30:39 +0000
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
   title="NEW --- - Black screen after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59057#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Black screen after resume from s2ram"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59057">bug 59057</a>
              from <span class="vcard"><a class="email" href="mailto:alinm.elena&#64;gmail.com" title="Alin M Elena &lt;alinm.elena&#64;gmail.com&gt;"> <span class="fn">Alin M Elena</span></a>
</span></b>
        <pre>Just to summarise the hardware on which this was confirmed

Hardware is 8400M GS (10de:0427) in a Dell XPS M1330.

nvidia 320m in a macbook pro
04:00.0 VGA compatible controller: NVIDIA Corporation Device 08a0 (rev a2)
(prog-if 00 [VGA controller])
        Subsystem: Apple Inc. Device 00c2
        Flags: bus master, fast devsel, latency 0, IRQ 16
        Memory at d2000000 (32-bit, non-prefetchable) [size=16M]
        Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Memory at d0000000 (64-bit, prefetchable) [size=32M]
        I/O ports at 1000 [size=128]
        Expansion ROM at d3000000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Capabilities: [e0] Vendor Specific Information: Len=14 &lt;?&gt;
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

--1361446239.081EFE75.10215--

--===============0239741704==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0239741704==--
