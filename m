From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Mon, 25 Feb 2013 18:24:28 +0000
Message-ID: <bug-50121-8800-cSA33GUB6D@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0811984875=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0811984875==
Content-Type: multipart/alternative; boundary="1361816669.fcF25.21826"; charset="us-ascii"


--1361816669.fcF25.21826
Date: Mon, 25 Feb 2013 18:24:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=50121

--- Comment #67 from Mr-4 <mr.dash.four-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
Here we go again...

After experiencing the joy and the meaning of "stability" and what it feels
like, I decided to upgrade to kernel 3.7.9 (the latest stable) from 3.7.4 and
voila... this bug reared its ugly head again after the first hibernate/restore
cycle.

This is what I get:

kernel: PM: Syncing filesystems ... done.
kernel: Freezing user space processes ... (elapsed 0.01 seconds) done.
kernel: PM: Preallocating image memory... done (allocated 220534 pages)
kernel: PM: Allocated 882136 kbytes in 0.25 seconds (3528.54 MB/s)
kernel: Freezing remaining freezable tasks ... (elapsed 3.29 seconds) done.
kernel: Suspending console(s) (use no_console_suspend to debug)
kernel: sd 2:0:0:0: [sda] Synchronizing SCSI cache
kernel: i8042 kbd 00:0a: wake-up capability enabled by ACPI
kernel: mpu401 00:05: disabled
kernel: nouveau  [     DRM] suspending fbcon...
kernel: nouveau  [     DRM] suspending display...
kernel: nouveau  [     DRM] unpinning framebuffer(s)...
kernel: nouveau  [     DRM] evicting buffers...
kernel: pciehp 0000:00:02.0:pcie04: pciehp_suspend ENTRY
kernel: agpgart-via 0000:00:00.0: Refused to change power state, currently in
D0
kernel: pci 0000:00:13.1: wake-up capability enabled by ACPI
kernel: nouveau  [     DRM] suspending client object trees...
kernel: PM: freeze of devices complete after 343.943 msecs
kernel: PM: late freeze of devices complete after 0.310 msecs
kernel: PM: noirq freeze of devices complete after 0.488 msecs
kernel: ACPI: Preparing to enter system sleep state S4
kernel: PM: Saving platform NVS memory
kernel: Disabling non-boot CPUs ...
kernel: Broke affinity for irq 1
kernel: Broke affinity for irq 16
kernel: smpboot: CPU 1 is now offline
kernel: PM: Creating hibernation image:
kernel: PM: Need to copy 169979 pages
kernel: PM: Restoring platform NVS memory
kernel: Enabling non-boot CPUs ...
kernel: smpboot: Booting Node 0 Processor 1 APIC 0x1
kernel: CPU1 is up
kernel: ACPI: Waking up from system sleep state S4
kernel: PM: noirq restore of devices complete after 22.507 msecs
kernel: PM: early restore of devices complete after 0.121 msecs
kernel: pciehp 0000:00:02.0:pcie04: pciehp_resume ENTRY
kernel: nouveau  [     DRM] re-enabling device...
kernel: nouveau  [     DRM] resuming client object trees...
kernel: nouveau  [   VBIOS][0000:01:00.0] running init tables
kernel: pci 0000:00:13.1: wake-up capability disabled by ACPI
kernel: mpu401 00:05: activated
kernel: i8042 kbd 00:0a: wake-up capability disabled by ACPI
kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
kernel: agpgart: kworker/u:1 tried to set rate=x12. Setting to AGP3 x8 mode.
kernel: agpgart-via 0000:00:00.0: putting AGP V3 device into 8x mode
kernel: nouveau 0000:01:00.0: putting AGP V3 device into 8x mode
kernel: nouveau  [     DRM] resuming display...
kernel: nouveau  [   PFIFO][0000:01:00.0] unknown intr 0x00010000, ch 0
[...ad infinitum...]
kernel: nouveau  [   PFIFO][0000:01:00.0] still angry after 101 spins, halt
kernel: nouveau  [     DRM] 0xD3FB: Parsing digital output script table
kernel: nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
kernel: nouveau  [     DRM] 0xD3FB: Parsing digital output script table
abrt[3701]: not dumping repeating crash in '/usr/bin/Xorg'
kernel: nouveau E[    3644] failed to idle channel 0xcccc0000
abrt[3716]: saved core dump of pid 3710 (/usr/bin/Xorg) to
/var/spool/abrt/ccpp-1361815666-3710.new/coredump (3674112 bytes)
abrtd: Directory 'ccpp-1361815666-3710' creation detected
abrtd: Crash is in database already (dup of
/var/spool/abrt/ccpp-1361815646-2078)
abrtd: Deleting crash ccpp-1361815666-3710 (dup of ccpp-1361815646-2078),
sending dbus signal
kernel: nouveau E[    3710] failed to idle channel 0xcccc0000
abrt[3726]: not dumping repeating crash in '/usr/bin/Xorg'
kernel: nouveau E[    3720] failed to idle channel 0xcccc0000
[...the last two messages repeat ad-infinitum...]

So, I think that whatever was done in the nvidia kernel code after 3.7.4 (I
haven't tested with version prior to 3.7.9) brought that nasty bug back to life
and I think it should be reopened, seeing that I am not the only one
experiencing this...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1361816669.fcF25.21826
Date: Mon, 25 Feb 2013 18:24:29 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121#c67">Comment # 67</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=50121">bug 50121</a>
              from <span class="vcard"><a class="email" href="mailto:mr.dash.four&#64;googlemail.com" title="Mr-4 &lt;mr.dash.four&#64;googlemail.com&gt;"> <span class="fn">Mr-4</span></a>
</span></b>
        <pre>Here we go again...

After experiencing the joy and the meaning of &quot;stability&quot; and what it feels
like, I decided to upgrade to kernel 3.7.9 (the latest stable) from 3.7.4 and
voila... this bug reared its ugly head again after the first hibernate/restore
cycle.

This is what I get:

kernel: PM: Syncing filesystems ... done.
kernel: Freezing user space processes ... (elapsed 0.01 seconds) done.
kernel: PM: Preallocating image memory... done (allocated 220534 pages)
kernel: PM: Allocated 882136 kbytes in 0.25 seconds (3528.54 MB/s)
kernel: Freezing remaining freezable tasks ... (elapsed 3.29 seconds) done.
kernel: Suspending console(s) (use no_console_suspend to debug)
kernel: sd 2:0:0:0: [sda] Synchronizing SCSI cache
kernel: i8042 kbd 00:0a: wake-up capability enabled by ACPI
kernel: mpu401 00:05: disabled
kernel: nouveau  [     DRM] suspending fbcon...
kernel: nouveau  [     DRM] suspending display...
kernel: nouveau  [     DRM] unpinning framebuffer(s)...
kernel: nouveau  [     DRM] evicting buffers...
kernel: pciehp 0000:00:02.0:pcie04: pciehp_suspend ENTRY
kernel: agpgart-via 0000:00:00.0: Refused to change power state, currently in
D0
kernel: pci 0000:00:13.1: wake-up capability enabled by ACPI
kernel: nouveau  [     DRM] suspending client object trees...
kernel: PM: freeze of devices complete after 343.943 msecs
kernel: PM: late freeze of devices complete after 0.310 msecs
kernel: PM: noirq freeze of devices complete after 0.488 msecs
kernel: ACPI: Preparing to enter system sleep state S4
kernel: PM: Saving platform NVS memory
kernel: Disabling non-boot CPUs ...
kernel: Broke affinity for irq 1
kernel: Broke affinity for irq 16
kernel: smpboot: CPU 1 is now offline
kernel: PM: Creating hibernation image:
kernel: PM: Need to copy 169979 pages
kernel: PM: Restoring platform NVS memory
kernel: Enabling non-boot CPUs ...
kernel: smpboot: Booting Node 0 Processor 1 APIC 0x1
kernel: CPU1 is up
kernel: ACPI: Waking up from system sleep state S4
kernel: PM: noirq restore of devices complete after 22.507 msecs
kernel: PM: early restore of devices complete after 0.121 msecs
kernel: pciehp 0000:00:02.0:pcie04: pciehp_resume ENTRY
kernel: nouveau  [     DRM] re-enabling device...
kernel: nouveau  [     DRM] resuming client object trees...
kernel: nouveau  [   VBIOS][0000:01:00.0] running init tables
kernel: pci 0000:00:13.1: wake-up capability disabled by ACPI
kernel: mpu401 00:05: activated
kernel: i8042 kbd 00:0a: wake-up capability disabled by ACPI
kernel: agpgart-via 0000:00:00.0: AGP 3.5 bridge
kernel: agpgart: kworker/u:1 tried to set rate=x12. Setting to AGP3 x8 mode.
kernel: agpgart-via 0000:00:00.0: putting AGP V3 device into 8x mode
kernel: nouveau 0000:01:00.0: putting AGP V3 device into 8x mode
kernel: nouveau  [     DRM] resuming display...
kernel: nouveau  [   PFIFO][0000:01:00.0] unknown intr 0x00010000, ch 0
[...ad infinitum...]
kernel: nouveau  [   PFIFO][0000:01:00.0] still angry after 101 spins, halt
kernel: nouveau  [     DRM] 0xD3FB: Parsing digital output script table
kernel: nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
kernel: nouveau  [     DRM] 0xD3FB: Parsing digital output script table
abrt[3701]: not dumping repeating crash in '/usr/bin/Xorg'
kernel: nouveau E[    3644] failed to idle channel 0xcccc0000
abrt[3716]: saved core dump of pid 3710 (/usr/bin/Xorg) to
/var/spool/abrt/ccpp-1361815666-3710.new/coredump (3674112 bytes)
abrtd: Directory 'ccpp-1361815666-3710' creation detected
abrtd: Crash is in database already (dup of
/var/spool/abrt/ccpp-1361815646-2078)
abrtd: Deleting crash ccpp-1361815666-3710 (dup of ccpp-1361815646-2078),
sending dbus signal
kernel: nouveau E[    3710] failed to idle channel 0xcccc0000
abrt[3726]: not dumping repeating crash in '/usr/bin/Xorg'
kernel: nouveau E[    3720] failed to idle channel 0xcccc0000
[...the last two messages repeat ad-infinitum...]

So, I think that whatever was done in the nvidia kernel code after 3.7.4 (I
haven't tested with version prior to 3.7.9) brought that nasty bug back to life
and I think it should be reopened, seeing that I am not the only one
experiencing this...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1361816669.fcF25.21826--

--===============0811984875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0811984875==--
