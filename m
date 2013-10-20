From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69928] [NVAA] Boot of linux kernel 3.12-rc2 hangs
Date: Sun, 20 Oct 2013 13:56:53 +0000
Message-ID: <bug-69928-8800-0YILCNyRdh@http.bugs.freedesktop.org/>
References: <bug-69928-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0186721493=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69928-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0186721493==
Content-Type: multipart/alternative; boundary="1382277413.6Cc51.11032"; charset="us-ascii"


--1382277413.6Cc51.11032
Date: Sun, 20 Oct 2013 13:56:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69928

--- Comment #13 from dirkneukirchen-S0/GAf8tV78@public.gmane.org ---
(In reply to comment #12)
> The request to see /proc/interrupts was just to see if it was using MSI or
> not, not for the actual interrupt counts.
> 
>  20:       5187   IO-APIC-fasteoi   ehci_hcd:usb2, nvidia
> 
> Sadly it's not using MSI. (If it were, it'd say PCI-MSI-edge or something
> like that.) Would it be possible for you to get a version that enables MSI?
> I believe 325 and newer do this. If it does enable MSI, Ben could use a
> trace.

MSI is indeed enabled in 325.15

Creating a test system (ubuntu 13.10) took a while my setup is:
- apply a patch to NVIDIA drivers because Kernel 3.11 is used (via google)
- disable modeset (kernel cmdline: nomodeset )
- blacklist vesafb, nouveau (modprobe.d entries and cmdline:
rdblacklist=nouveau  nouveau.blacklist=1  nouveau.modeset=0)
- enable vga console (cmdline: video=vesa:off vga=normal )
- install nvidia custom driver (created by --apply-patch patch311.patch)
- reboot

two mmiotraces are attached

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382277413.6Cc51.11032
Date: Sun, 20 Oct 2013 13:56:53 +0000
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
   title="NEW --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69928">bug 69928</a>
              from <span class="vcard"><a class="email" href="mailto:dirkneukirchen&#64;web.de" title="dirkneukirchen&#64;web.de">dirkneukirchen&#64;web.de</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=69928#c12">comment #12</a>)
<span class="quote">&gt; The request to see /proc/interrupts was just to see if it was using MSI or
&gt; not, not for the actual interrupt counts.
&gt; 
&gt;  20:       5187   IO-APIC-fasteoi   ehci_hcd:usb2, nvidia
&gt; 
&gt; Sadly it's not using MSI. (If it were, it'd say PCI-MSI-edge or something
&gt; like that.) Would it be possible for you to get a version that enables MSI?
&gt; I believe 325 and newer do this. If it does enable MSI, Ben could use a
&gt; trace.</span >

MSI is indeed enabled in 325.15

Creating a test system (ubuntu 13.10) took a while my setup is:
- apply a patch to NVIDIA drivers because Kernel 3.11 is used (via google)
- disable modeset (kernel cmdline: nomodeset )
- blacklist vesafb, nouveau (modprobe.d entries and cmdline:
rdblacklist=nouveau  nouveau.blacklist=1  nouveau.modeset=0)
- enable vga console (cmdline: video=vesa:off vga=normal )
- install nvidia custom driver (created by --apply-patch patch311.patch)
- reboot

two mmiotraces are attached</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382277413.6Cc51.11032--

--===============0186721493==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0186721493==--
