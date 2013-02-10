From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60516] nouveau driver graphics corrupted in 3.7
 kernel for nvidia FX5200 [NV34] hardware
Date: Sun, 10 Feb 2013 22:58:33 +0000
Message-ID: <bug-60516-8800-10cM1nvggJ@http.bugs.freedesktop.org/>
References: <bug-60516-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1102541757=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60516-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1102541757==
Content-Type: multipart/alternative; boundary="1360537113.4c8d4.10516"; charset="us-ascii"


--1360537113.4c8d4.10516
Date: Sun, 10 Feb 2013 22:58:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60516

--- Comment #3 from Darren <overcaff3inated-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> ---
This "corrupted display on boot" issue manifests itself with Fuduntu 2013.1 and
the 3.7.6-1 kernel as well. The screen looks similar to the screenshot linked
in the comment of 2013-02-08 20:50, though in the case of my laptop, the screen
starts out mostly black.

Several small colored vertical lines populat3 and then spread to cover the
entire screen, gradually getting lighter in color as they do so.

My video card information is below:

01:00.0 VGA compatible controller: nVidia Corporation NV31 [Quadro FX Go700]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: Dell Device 019b
    Flags: bus master, VGA palette snoop, 66MHz, medium devsel, latency 32, IRQ
11
    Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
    Memory at d0000000 (32-bit, prefetchable) [size=256M]
    Expansion ROM at fd000000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
    Capabilities: [44] AGP version 3.0
    Kernel driver in use: nouveau

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1360537113.4c8d4.10516
Date: Sun, 10 Feb 2013 22:58:33 +0000
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
   title="NEW --- - nouveau driver graphics corrupted in 3.7 kernel for nvidia FX5200 [NV34] hardware"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60516#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau driver graphics corrupted in 3.7 kernel for nvidia FX5200 [NV34] hardware"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60516">bug 60516</a>
              from <span class="vcard"><a class="email" href="mailto:overcaff3inated&#64;yahoo.com" title="Darren &lt;overcaff3inated&#64;yahoo.com&gt;"> <span class="fn">Darren</span></a>
</span></b>
        <pre>This &quot;corrupted display on boot&quot; issue manifests itself with Fuduntu 2013.1 and
the 3.7.6-1 kernel as well. The screen looks similar to the screenshot linked
in the comment of 2013-02-08 20:50, though in the case of my laptop, the screen
starts out mostly black.

Several small colored vertical lines populat3 and then spread to cover the
entire screen, gradually getting lighter in color as they do so.

My video card information is below:

01:00.0 VGA compatible controller: nVidia Corporation NV31 [Quadro FX Go700]
(rev a1) (prog-if 00 [VGA controller])
    Subsystem: Dell Device 019b
    Flags: bus master, VGA palette snoop, 66MHz, medium devsel, latency 32, IRQ
11
    Memory at fc000000 (32-bit, non-prefetchable) [size=16M]
    Memory at d0000000 (32-bit, prefetchable) [size=256M]
    Expansion ROM at fd000000 [disabled] [size=128K]
    Capabilities: [60] Power Management version 2
    Capabilities: [44] AGP version 3.0
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

--1360537113.4c8d4.10516--

--===============1102541757==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1102541757==--
