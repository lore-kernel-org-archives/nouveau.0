From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28140] New: console and X display do not work with
 NVIDIA Quadro NVS 295
Date: Mon, 17 May 2010 01:02:33 -0700 (PDT)
Message-ID: <bug-28140-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28140

           Summary: console and X display do not work with NVIDIA Quadro
                    NVS 295
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: vincent-fdt-opTGSl+ZDNkdnm+yROfE0A@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=35703)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=35703)
kernel logs

Using a HP Z800 with NVIDIA Quadro NVS 295, under GNU/Linux (Debian/unstable
with linux-image-2.6.32-5-amd64, the first kernel image using the nouveau
driver):

When I boot, the screen goes black after a few lines and the monitor goes to
sleep. Some time after (once X has started, I assume) the monitor wakes up, but
with a corrupt image.

The machine is still accessible by SSH. Otherwise one cannot do anything except
switching it off.

I've attached the beginning of the logs (compressed). Then I got the same
message (thousands of times a second) until I switched off the machine:

  [drm] nouveau 0000:0f:00.0: PFIFO_INTR 0x00000010 - Ch 1

The problem disappears after blacklisting "nouveau" (and rebooting).

Bug also reported on the Debian BTS:
  http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=581830

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
