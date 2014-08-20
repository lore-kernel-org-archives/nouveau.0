From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82843] [NV96][Regression][Bisected] Failure to resume
Date: Wed, 20 Aug 2014 06:27:54 +0000
Message-ID: <bug-82843-8800-rjKPOv1e9o@http.bugs.freedesktop.org/>
References: <bug-82843-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0447685104=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82843-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0447685104==
Content-Type: multipart/alternative; boundary="1408516074.Eeb4b3c31.15556"; charset="us-ascii"


--1408516074.Eeb4b3c31.15556
Date: Wed, 20 Aug 2014 06:27:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82843

--- Comment #1 from Trevor Davenport <trevor.davenport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Aug 19 21:46:27 f20 kernel: ACPI: Waking up from system sleep state S3
Aug 19 21:46:27 f20 kernel: PM: noirq resume of devices complete after 111.246
msecs
Aug 19 21:46:27 f20 kernel: PM: early resume of devices complete after 0.101
msecs
Aug 19 21:46:27 f20 kernel: usb usb3: root hub lost power or was reset
Aug 19 21:46:27 f20 kernel: usb usb4: root hub lost power or was reset
Aug 19 21:46:27 f20 kernel: nouveau  [     DRM] re-enabling device...
Aug 19 21:46:27 f20 kernel: snd_hda_intel 0000:00:1b.0: irq 50 for MSI/MSI-X
Aug 19 21:46:27 f20 kernel: nouveau  [     DRM] resuming kernel object tree...
Aug 19 21:46:27 f20 kernel: nouveau  [   VBIOS][0000:01:00.0] running init
tables
Aug 19 21:46:27 f20 kernel: usb usb5: root hub lost power or was reset
Aug 19 21:46:27 f20 kernel: usb usb6: root hub lost power or was reset
Aug 19 21:46:27 f20 kernel: usb usb7: root hub lost power or was reset
Aug 19 21:46:27 f20 kernel: usb usb8: root hub lost power or was reset
Aug 19 21:46:31 f20 kernel: r8169 0000:03:00.0: System wakeup disabled by ACPI
Aug 19 21:46:31 f20 kernel: r8169 0000:03:00.0 p1p1: link down
Aug 19 21:46:31 f20 kernel: nouveau  [    VOLT][0000:01:00.0] GPU voltage:
1050000uv
Aug 19 21:46:31 f20 kernel: nouveau  [  PTHERM][0000:01:00.0] fan management:
automatic
Aug 19 21:46:31 f20 kernel: nouveau  [     CLK][0000:01:00.0] --: core 275 MHz
shader 550 MHz memory 249 MHz
Aug 19 21:46:31 f20 kernel: nouveau  [     DRM] resuming client object trees...
Aug 19 21:46:31 f20 kernel: nouveau  [     DRM] resuming display...
Aug 19 21:46:31 f20 kernel: i8042 kbd 00:07: System wakeup disabled by ACPI
Aug 19 21:46:31 f20 kernel: ene_ir 00:09: System wakeup disabled by ACPI
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush
idle timeout fail
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  :
0x01000001 BUSY ROP
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2:
0x00200000 ROP
Aug 19 21:46:31 f20 kernel: ata5: SATA link down (SStatus 0 SControl 300)
Aug 19 21:46:31 f20 kernel: ata6: SATA link down (SStatus 0 SControl 300)
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush
idle timeout fail
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  :
0x01000001 BUSY ROP
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2:
0x00200000 ROP
Aug 19 21:46:31 f20 kernel: usb 2-4: reset high-speed USB device number 2 using
ehci-pci
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush
idle timeout fail
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  :
0x01000001 BUSY ROP
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2:
0x00200000 ROP
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush
idle timeout fail
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  :
0x01000001 BUSY ROP
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2:
0x00200000 ROP
Aug 19 21:46:31 f20 kernel: firewire_core 0000:06:00.0: rediscovered device fw0
Aug 19 21:46:31 f20 kernel: ata1: SATA link up 3.0 Gbps (SStatus 123 SControl
300)
Aug 19 21:46:31 f20 kernel: ata2: SATA link up 1.5 Gbps (SStatus 113 SControl
300)
Aug 19 21:46:31 f20 kernel: ata1.00: configured for UDMA/100
Aug 19 21:46:31 f20 kernel: sd 0:0:0:0: [sda] Starting disk
Aug 19 21:46:31 f20 kernel: ata2.00: configured for UDMA/100
Aug 19 21:46:31 f20 kernel: usb 7-2: reset full-speed USB device number 2 using
uhci_hcd
Aug 19 21:46:31 f20 kernel: PM: resume of devices complete after 8551.251 msecs
Aug 19 21:46:31 f20 kernel: nouveau E[     DRM] GPU lockup - switching to
software fbcon
Aug 19 21:46:31 f20 kernel: r8169 0000:03:00.0: no hotplug settings from
platform
Aug 19 21:46:31 f20 kernel: firewire_ohci 0000:06:00.0: no hotplug settings
from platform
Aug 19 21:46:31 f20 kernel: sdhci-pci 0000:06:00.1: no hotplug settings from
platform
Aug 19 21:46:31 f20 kernel: pci 0000:06:00.2: no hotplug settings from platform
Aug 19 21:46:31 f20 kernel: PM: Finishing wakeup.
Aug 19 21:46:31 f20 kernel: Restarting tasks ... done.
Aug 19 21:46:31 f20 kernel: jmb38x_ms 0000:06:00.3: no hotplug settings from
platform
Aug 19 21:46:31 f20 kernel: pci 0000:06:00.4: no hotplug settings from platform
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush
idle timeout fail
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  :
0x011fde03 BUSY DISPATCH VFETCH CCACHE_PREGEOM STRMOU
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0:
0x00145b4d CCACHE
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1:
0x0000002d
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2:
0x0034db40 ENG2D ROP
Aug 19 21:46:31 f20 kernel: Bluetooth: hci0 command 0x0c14 tx timeout
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush
idle timeout fail
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  :
0x011fde03 BUSY DISPATCH VFETCH CCACHE_PREGEOM STRMOU
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0:
0x00145b4d CCACHE
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1:
0x0000002d
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2:
0x0034db40 ENG2D ROP

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408516074.Eeb4b3c31.15556
Date: Wed, 20 Aug 2014 06:27:54 +0000
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
   title="NEW --- - [NV96][Regression][Bisected] Failure to resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82843#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96][Regression][Bisected] Failure to resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82843">bug 82843</a>
              from <span class="vcard"><a class="email" href="mailto:trevor.davenport&#64;gmail.com" title="Trevor Davenport &lt;trevor.davenport&#64;gmail.com&gt;"> <span class="fn">Trevor Davenport</span></a>
</span></b>
        <pre>Aug 19 21:46:27 f20 kernel: ACPI: Waking up from system sleep state S3
Aug 19 21:46:27 f20 kernel: PM: noirq resume of devices complete after 111.246
msecs
Aug 19 21:46:27 f20 kernel: PM: early resume of devices complete after 0.101
msecs
Aug 19 21:46:27 f20 kernel: usb usb3: root hub lost power or was reset
Aug 19 21:46:27 f20 kernel: usb usb4: root hub lost power or was reset
Aug 19 21:46:27 f20 kernel: nouveau  [     DRM] re-enabling device...
Aug 19 21:46:27 f20 kernel: snd_hda_intel 0000:00:1b.0: irq 50 for MSI/MSI-X
Aug 19 21:46:27 f20 kernel: nouveau  [     DRM] resuming kernel object tree...
Aug 19 21:46:27 f20 kernel: nouveau  [   VBIOS][0000:01:00.0] running init
tables
Aug 19 21:46:27 f20 kernel: usb usb5: root hub lost power or was reset
Aug 19 21:46:27 f20 kernel: usb usb6: root hub lost power or was reset
Aug 19 21:46:27 f20 kernel: usb usb7: root hub lost power or was reset
Aug 19 21:46:27 f20 kernel: usb usb8: root hub lost power or was reset
Aug 19 21:46:31 f20 kernel: r8169 0000:03:00.0: System wakeup disabled by ACPI
Aug 19 21:46:31 f20 kernel: r8169 0000:03:00.0 p1p1: link down
Aug 19 21:46:31 f20 kernel: nouveau  [    VOLT][0000:01:00.0] GPU voltage:
1050000uv
Aug 19 21:46:31 f20 kernel: nouveau  [  PTHERM][0000:01:00.0] fan management:
automatic
Aug 19 21:46:31 f20 kernel: nouveau  [     CLK][0000:01:00.0] --: core 275 MHz
shader 550 MHz memory 249 MHz
Aug 19 21:46:31 f20 kernel: nouveau  [     DRM] resuming client object trees...
Aug 19 21:46:31 f20 kernel: nouveau  [     DRM] resuming display...
Aug 19 21:46:31 f20 kernel: i8042 kbd 00:07: System wakeup disabled by ACPI
Aug 19 21:46:31 f20 kernel: ene_ir 00:09: System wakeup disabled by ACPI
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush
idle timeout fail
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  :
0x01000001 BUSY ROP
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2:
0x00200000 ROP
Aug 19 21:46:31 f20 kernel: ata5: SATA link down (SStatus 0 SControl 300)
Aug 19 21:46:31 f20 kernel: ata6: SATA link down (SStatus 0 SControl 300)
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush
idle timeout fail
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  :
0x01000001 BUSY ROP
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2:
0x00200000 ROP
Aug 19 21:46:31 f20 kernel: usb 2-4: reset high-speed USB device number 2 using
ehci-pci
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush
idle timeout fail
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  :
0x01000001 BUSY ROP
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2:
0x00200000 ROP
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush
idle timeout fail
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  :
0x01000001 BUSY ROP
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1:
0x00000000
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2:
0x00200000 ROP
Aug 19 21:46:31 f20 kernel: firewire_core 0000:06:00.0: rediscovered device fw0
Aug 19 21:46:31 f20 kernel: ata1: SATA link up 3.0 Gbps (SStatus 123 SControl
300)
Aug 19 21:46:31 f20 kernel: ata2: SATA link up 1.5 Gbps (SStatus 113 SControl
300)
Aug 19 21:46:31 f20 kernel: ata1.00: configured for UDMA/100
Aug 19 21:46:31 f20 kernel: sd 0:0:0:0: [sda] Starting disk
Aug 19 21:46:31 f20 kernel: ata2.00: configured for UDMA/100
Aug 19 21:46:31 f20 kernel: usb 7-2: reset full-speed USB device number 2 using
uhci_hcd
Aug 19 21:46:31 f20 kernel: PM: resume of devices complete after 8551.251 msecs
Aug 19 21:46:31 f20 kernel: nouveau E[     DRM] GPU lockup - switching to
software fbcon
Aug 19 21:46:31 f20 kernel: r8169 0000:03:00.0: no hotplug settings from
platform
Aug 19 21:46:31 f20 kernel: firewire_ohci 0000:06:00.0: no hotplug settings
from platform
Aug 19 21:46:31 f20 kernel: sdhci-pci 0000:06:00.1: no hotplug settings from
platform
Aug 19 21:46:31 f20 kernel: pci 0000:06:00.2: no hotplug settings from platform
Aug 19 21:46:31 f20 kernel: PM: Finishing wakeup.
Aug 19 21:46:31 f20 kernel: Restarting tasks ... done.
Aug 19 21:46:31 f20 kernel: jmb38x_ms 0000:06:00.3: no hotplug settings from
platform
Aug 19 21:46:31 f20 kernel: pci 0000:06:00.4: no hotplug settings from platform
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush
idle timeout fail
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  :
0x011fde03 BUSY DISPATCH VFETCH CCACHE_PREGEOM STRMOU
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0:
0x00145b4d CCACHE
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1:
0x0000002d
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2:
0x0034db40 ENG2D ROP
Aug 19 21:46:31 f20 kernel: Bluetooth: hci0 command 0x0c14 tx timeout
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH TLB flush
idle timeout fail
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_STATUS  :
0x011fde03 BUSY DISPATCH VFETCH CCACHE_PREGEOM STRMOU
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS0:
0x00145b4d CCACHE
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS1:
0x0000002d
Aug 19 21:46:31 f20 kernel: nouveau E[  PGRAPH][0000:01:00.0] PGRAPH_VSTATUS2:
0x0034db40 ENG2D ROP</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408516074.Eeb4b3c31.15556--

--===============0447685104==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0447685104==--
