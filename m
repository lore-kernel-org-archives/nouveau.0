From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28626] New: Oops: kernel NULL pointer dereference in
 nouveau_connector_get_modes
Date: Sun, 20 Jun 2010 09:26:57 -0700 (PDT)
Message-ID: <bug-28626-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28626

           Summary: Oops: kernel NULL pointer dereference in
                    nouveau_connector_get_modes
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: albrt-hi6Y0CQ0nG0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=36380)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=36380)
dmesg with the oops

Booting with nouveau/linux-2.6 from git results in a kernel oops:
[    3.817681] BUG: unable to handle kernel NULL pointer dereference at
0000000000000060
[    3.818051] IP: [<ffffffffa01128b0>] nouveau_connector_get_modes+0x180/0x410
[nouveau]
Please see attached dmesg for the full oops.

System environment:
-- chipset: intel PM965 + G86 [GeForce 8400M GT]
-- system architecture: 64-bit
-- xf86-video-nouveau: git, db98ad2363 (20 June)
-- xserver: 1.7.5
-- libdrm: 2.4.20
-- kernel: 2.6.34 + nouveau/linux from git: 48f4092e87
-- Machine: laptop, Sony Vaio FZ21-M
-- Display connector: LVDS (1280x800) + HDMI (1680x1050)

Reverting commit "drm/nouveau: move LVDS detection back to connector detect()
time" solved the oops.
Further debugging showed nv_encoder was NULL in nouveau_connector_get_modes.
Attached patch solves the problem for me.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
