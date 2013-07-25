From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67315] System lockup with X consuming all CPU
Date: Thu, 25 Jul 2013 18:01:06 +0000
Message-ID: <bug-67315-8800-1L8ey5KPMs@http.bugs.freedesktop.org/>
References: <bug-67315-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0939467582=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67315-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0939467582==
Content-Type: multipart/alternative; boundary="1374775266.5544CB1C1.7601"; charset="us-ascii"


--1374775266.5544CB1C1.7601
Date: Thu, 25 Jul 2013 18:01:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67315

--- Comment #1 from Rick Stevens <ricks-ijgZXeOBpMSRq8AjE7tl8g@public.gmane.org> ---
Forgot to mention, this is Fedora 19, fully updated on a dual-core AMD-based
system. Video hardware is:

02:00.0 VGA compatible controller: NVIDIA Corporation C77 [GeForce 8200] (rev
a2) (prog-if 00 [VGA controller])
    Subsystem: NVIDIA Corporation Device cb84
    Flags: bus master, fast devsel, latency 0, IRQ 5
    Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
    Memory at d8000000 (64-bit, prefetchable) [size=128M]
    Memory at e6000000 (64-bit, prefetchable) [size=32M]
    I/O ports at bc00 [size=128]
    [virtual] Expansion ROM at e0000000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374775266.5544CB1C1.7601
Date: Thu, 25 Jul 2013 18:01:06 +0000
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
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - System lockup with X consuming all CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67315">bug 67315</a>
              from <span class="vcard"><a class="email" href="mailto:ricks&#64;alldigital.com" title="Rick Stevens &lt;ricks&#64;alldigital.com&gt;"> <span class="fn">Rick Stevens</span></a>
</span></b>
        <pre>Forgot to mention, this is Fedora 19, fully updated on a dual-core AMD-based
system. Video hardware is:

02:00.0 VGA compatible controller: NVIDIA Corporation C77 [GeForce 8200] (rev
a2) (prog-if 00 [VGA controller])
    Subsystem: NVIDIA Corporation Device cb84
    Flags: bus master, fast devsel, latency 0, IRQ 5
    Memory at fb000000 (32-bit, non-prefetchable) [size=16M]
    Memory at d8000000 (64-bit, prefetchable) [size=128M]
    Memory at e6000000 (64-bit, prefetchable) [size=32M]
    I/O ports at bc00 [size=128]
    [virtual] Expansion ROM at e0000000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374775266.5544CB1C1.7601--

--===============0939467582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0939467582==--
