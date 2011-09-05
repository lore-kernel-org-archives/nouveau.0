From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40548] Displayport not working on NV50
Date: Mon,  5 Sep 2011 12:54:28 -0700 (PDT)
Message-ID: <20110905195428.3891B130117@annarchy.freedesktop.org>
References: <bug-40548-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40548-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40548

--- Comment #10 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-05 12:54:27 PDT ---
By bad forgot the Optimus link [1]

Whereas for the two GPU/cards I got this from your dmesg


[    0.807677] [drm] radeon defaulting to kernel modesetting.
[    0.807678] [drm] radeon kernel modesetting enabled.



[    2.141658] MXM: GUID detected in BIOS
[    2.141736] nouveau 0000:01:00.0: power state changed by ACPI to D0
[    2.141741] nouveau 0000:01:00.0: power state changed by ACPI to D0
[    2.141753] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[    2.141759] nouveau 0000:01:00.0: setting latency timer to 64
[    2.144701] [drm] nouveau 0000:01:00.0: Detected an NV50 generation card
(0x0a5e00a2)

Can you attach the output of lspci just to confirm/dismiss the above


You can try the following 
1. Append "video=LVDS-1:d" to your kernel command line to disable the LVDS
2. Choose a lower resolution for your DP monitor - "video=DP-1:1024x768@60"

Cheers
Emil


[1] http://nouveau.freedesktop.org/wiki/Optimus

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
