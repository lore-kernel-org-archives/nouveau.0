From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26812] New: [lbm-drm:drm_mode_getfb] *ERROR* invalid
 framebuffer id
Date: Sun, 28 Feb 2010 20:16:22 -0800 (PST)
Message-ID: <bug-26812-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=26812

           Summary: [lbm-drm:drm_mode_getfb] *ERROR* invalid framebuffer id
           Product: xorg
           Version: unspecified
          Platform: Other
               URL: https://bugs.edge.launchpad.net/ubuntu/+source/xserver-
                    xorg-video-nouveau/+bug/529842
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: caravena-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Open bug in Launchpad.net:
https://bugs.edge.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/529842


Message in dmesg:
[   32.361654] [lbm-drm] nouveau 0000:01:00.0: Allocating FIFO number 1
[   32.362167] [lbm-drm] nouveau 0000:01:00.0: nouveau_channel_alloc:
initialised FIFO 1
[   32.365173] [lbm-drm:drm_mode_getfb] *ERROR* invalid framebuffer id
BootDmesg:
https://bugs.edge.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/529842/comments/3


01:00.0 VGA compatible controller [0300]: nVidia Corporation G72 [GeForce 7300
LE] [10de:01d1] (rev a1)
Lspci:
https://bugs.edge.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/529842/comments/9


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
