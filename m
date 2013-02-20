From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58261] [NV34] Display all whited out
Date: Wed, 20 Feb 2013 13:44:11 +0000
Message-ID: <bug-58261-8800-XsldsIDBVx@http.bugs.freedesktop.org/>
References: <bug-58261-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0197930372=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58261-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0197930372==
Content-Type: multipart/alternative; boundary="1361367852.0Cf5f4.32462"; charset="us-ascii"


--1361367852.0Cf5f4.32462
Date: Wed, 20 Feb 2013 13:44:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58261

--- Comment #9 from Alexander Stein <alexander.stein-jNDFPZUTrfQ+B2oLq8eQJv4efur1V5z/s0AfqQuZ5sE@public.gmane.org> ---
Created attachment 75172
  --> https://bugs.freedesktop.org/attachment.cgi?id=75172&action=edit
dmesg from linux-v3.8-91-g2fee6f5

I'm running nouveau on this hardware:
01:00.0 VGA compatible controller: NVIDIA Corporation NV34M [GeForce FX Go5200
64M] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Toshiba America Info Systems Device 0001
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 10
        Memory at c1000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e0000000 (32-bit, prefetchable) [size=256M]
        Expansion ROM at <unassigned> [disabled]
        Capabilities: [60] Power Management version 2
        Capabilities: [44] AGP version 3.0
        Kernel driver in use: nouveau
        Kernel modules: nouveau
This is broken since commit cb75d97e9c77743ecfcc43375be135a55a4d9b25, tested by
bisecting.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361367852.0Cf5f4.32462
Date: Wed, 20 Feb 2013 13:44:12 +0000
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
   title="NEW --- - [NV34] Display all whited out"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58261#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV34] Display all whited out"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58261">bug 58261</a>
              from <span class="vcard"><a class="email" href="mailto:alexander.stein&#64;informatik.tu-chemnitz.de" title="Alexander Stein &lt;alexander.stein&#64;informatik.tu-chemnitz.de&gt;"> <span class="fn">Alexander Stein</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=75172" name="attach_75172" title="dmesg from linux-v3.8-91-g2fee6f5">attachment 75172</a> <a href="attachment.cgi?id=75172&amp;action=edit" title="dmesg from linux-v3.8-91-g2fee6f5">[details]</a></span>
dmesg from linux-v3.8-91-g2fee6f5

I'm running nouveau on this hardware:
01:00.0 VGA compatible controller: NVIDIA Corporation NV34M [GeForce FX Go5200
64M] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Toshiba America Info Systems Device 0001
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 10
        Memory at c1000000 (32-bit, non-prefetchable) [size=16M]
        Memory at e0000000 (32-bit, prefetchable) [size=256M]
        Expansion ROM at &lt;unassigned&gt; [disabled]
        Capabilities: [60] Power Management version 2
        Capabilities: [44] AGP version 3.0
        Kernel driver in use: nouveau
        Kernel modules: nouveau
This is broken since commit cb75d97e9c77743ecfcc43375be135a55a4d9b25, tested by
bisecting.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361367852.0Cf5f4.32462--

--===============0197930372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0197930372==--
