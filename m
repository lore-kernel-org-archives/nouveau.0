From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87983] [NV86] GPU hangs on start,
	disabling MSI fixes it
Date: Fri, 02 Jan 2015 23:04:29 +0000
Message-ID: <bug-87983-8800-qVtzhvqc90@http.bugs.freedesktop.org/>
References: <bug-87983-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1511127036=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87983-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1511127036==
Content-Type: multipart/alternative; boundary="1420239869.58Ea21.14651"; charset="UTF-8"


--1420239869.58Ea21.14651
Date: Fri, 2 Jan 2015 23:04:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87983

--- Comment #9 from bofh666-RbZlAiThDcE@public.gmane.org ---
Output from `cat /proc/interrupts` in ssh after reenabling msi:
           CPU0       CPU1       
  0:        141          0   IO-APIC-edge      timer
  1:         12          0   IO-APIC-edge      i8042
  7:          0          0   IO-APIC-edge      parport0
  8:          0          0   IO-APIC-edge      rtc0
  9:          0          0   IO-APIC-fasteoi   acpi
 14:        174          0   IO-APIC-edge      pata_via
 15:          0          0   IO-APIC-edge      pata_via
 20:          0          0   IO-APIC  20-fasteoi   uhci_hcd:usb2
 21:       6405          0   IO-APIC  21-fasteoi   ehci_hcd:usb1,
uhci_hcd:usb4, sata_via
 22:         39          0   IO-APIC  22-fasteoi   uhci_hcd:usb3
 23:        286          0   IO-APIC  23-fasteoi   uhci_hcd:usb5, enp0s18
 29:          0          0   PCI-MSI-edge      nouveau
 30:       6171          0   PCI-MSI-edge      snd_hda_intel
NMI:         22         25   Non-maskable interrupts
LOC:    1223029     976317   Local timer interrupts
SPU:          0          0   Spurious interrupts
PMI:         22         25   Performance monitoring interrupts
IWI:          0          0   IRQ work interrupts
RTR:          0          0   APIC ICR read retries
RES:      13372      12819   Rescheduling interrupts
CAL:        282        432   Function call interrupts
TLB:         42         38   TLB shootdowns
TRM:          0          0   Thermal event interrupts
THR:          0          0   Threshold APIC interrupts
MCE:          0          0   Machine check exceptions
MCP:          1          1   Machine check polls
THR:          0          0   Hypervisor callback interrupts
ERR:          0
MIS:          0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420239869.58Ea21.14651
Date: Fri, 2 Jan 2015 23:04:29 +0000
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
   title="NEW - [NV86] GPU hangs on start, disabling MSI fixes it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87983#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV86] GPU hangs on start, disabling MSI fixes it"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87983">bug 87983</a>
              from <span class="vcard"><a class="email" href="mailto:bofh666&#64;gmx.at" title="bofh666&#64;gmx.at">bofh666&#64;gmx.at</a>
</span></b>
        <pre>Output from `cat /proc/interrupts` in ssh after reenabling msi:
           CPU0       CPU1       
  0:        141          0   IO-APIC-edge      timer
  1:         12          0   IO-APIC-edge      i8042
  7:          0          0   IO-APIC-edge      parport0
  8:          0          0   IO-APIC-edge      rtc0
  9:          0          0   IO-APIC-fasteoi   acpi
 14:        174          0   IO-APIC-edge      pata_via
 15:          0          0   IO-APIC-edge      pata_via
 20:          0          0   IO-APIC  20-fasteoi   uhci_hcd:usb2
 21:       6405          0   IO-APIC  21-fasteoi   ehci_hcd:usb1,
uhci_hcd:usb4, sata_via
 22:         39          0   IO-APIC  22-fasteoi   uhci_hcd:usb3
 23:        286          0   IO-APIC  23-fasteoi   uhci_hcd:usb5, enp0s18
 29:          0          0   PCI-MSI-edge      nouveau
 30:       6171          0   PCI-MSI-edge      snd_hda_intel
NMI:         22         25   Non-maskable interrupts
LOC:    1223029     976317   Local timer interrupts
SPU:          0          0   Spurious interrupts
PMI:         22         25   Performance monitoring interrupts
IWI:          0          0   IRQ work interrupts
RTR:          0          0   APIC ICR read retries
RES:      13372      12819   Rescheduling interrupts
CAL:        282        432   Function call interrupts
TLB:         42         38   TLB shootdowns
TRM:          0          0   Thermal event interrupts
THR:          0          0   Threshold APIC interrupts
MCE:          0          0   Machine check exceptions
MCP:          1          1   Machine check polls
THR:          0          0   Hypervisor callback interrupts
ERR:          0
MIS:          0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420239869.58Ea21.14651--

--===============1511127036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1511127036==--
