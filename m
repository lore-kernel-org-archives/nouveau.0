From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 53101] Fedora 17 "PFIFO - playlist update failed" on
	boot
Date: Wed, 15 Aug 2012 17:44:45 +0000
Message-ID: <bug-53101-8800-hmLbGQxnQX@http.bugs.freedesktop.org/>
References: <bug-53101-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-53101-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=53101

--- Comment #2 from michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2012-08-15 17:44:45 UTC ---
Hijacking this bug as I get the same messages, just after resume.

ThinkPad W520 4276CTO NVC0 (2000M)
openSUSE 12.2 + nouveau 20120813 872dcac

* proposed nouveau.noaccel=1 crashes kernel
(nouveau_abi16_ioctl_channel_alloc>nouveau_channel_new)

* Booting works (nox2apic, W520 ACPI table issue)
* gdm has graphics distortions though (see early dmesg excerpt)
* double ctrl+alt+backspace "fixes" this and gdm looks good
* suspend from gnome-shell 3.4.2 works
* resume shows gdm-password prompt and usually a white-noise background
** the gnome-shellish top-panel looks intact, though
** mouse cursor not movable, cpu load
** looks like "something" tries to restart gdm/X over and over again
* switching to vt possible with some insisting
* restarting gdm does lock up the system
* the "channel x kick timeout" seems new since some commits IIRC

repeatedly in dmesg:
[  156.925301] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[  159.924800] nouveau E[     DRM][0000:01:00.0] failed to idle channel
0xcccc0000
[  161.924690] nouveau E[   PFIFO][0000:01:00.0] channel 1 kick timeout
[  161.924787] nouveau  [   PFIFO][0000:01:00.0] unknown status 0x00000100
[  163.924603] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[  163.989722] nouveau  [   PFIFO][0000:01:00.0] unknown status 0x00000100
[  165.989535] nouveau E[   PFIFO][0000:01:00.0] channel 3 kick timeout
[  165.989670] nouveau  [   PFIFO][0000:01:00.0] unknown status 0x00000100
[  167.989455] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[  167.989517] nouveau ![   PFIFO][0000:01:00.0] unhandled status 0x00000001
[  170.649537] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[  172.660200] nouveau E[   PFIFO][0000:01:00.0] playlist update failed
[  185.103713] nouveau E[     DRM][0000:01:00.0] failed to idle channel
0xcccc0001
[  187.103627] nouveau E[   PFIFO][0000:01:00.0] channel 2 kick timeout

I tried a fc17 install and the original kernel (3.3.4-5.fc17.x86_64) worked.
Suspend/resume fine at least when not in docking station. After updating that
test install to 3.5.1-1.fc17.x86_64 the same issues cropped up I see in
openSUSE 12.2. So this looks distribution agnostic.

Any pointers on what to try to help diagnose this issue are welcome.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
