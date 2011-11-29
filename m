From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 43323] New: GPU lockup - X does not start on
 MacMini4, 1 on 3.2.0-rc3-gf2d092a
Date: Tue, 29 Nov 2011 08:48:36 +0000
Message-ID: <bug-43323-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=43323

             Bug #: 43323
           Summary: GPU lockup - X does not start on MacMini4,1 on
                    3.2.0-rc3-gf2d092a
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: nico-freedesktop.org-xuaVFQXs+5hIG4jRRZ66WA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hello!

After seeing the errors described in 

http://home.schottelius.org/~nico/unix/progs/xf86-video-nouveau/dmesg

(I was also unable to start xorg there)

I upgrade to the kernel sources found in
git://anongit.freedesktop.org/git/nouveau/linux-2.6.

I've used the .config from Archlinux.

Now I get


[   41.306679] [drm] nouveau 0000:05:00.0: PFIFO still angry after 101 spins,
halt
[   47.165540] mtrr: no MTRR for d1000000,e00000 found
[   67.250247] [drm] nouveau 0000:05:00.0: GPU lockup - switching to software
fbcon
[   70.263372] [drm] nouveau 0000:05:00.0: Failed to idle channel 2.

and in Xorg.0.log I get


[    67.070] (EE) NOUVEAU(0): failed to set mode: Device or resource busy


Full logs are at

http://home.schottelius.org/~nico/unix/progs/xf86-video-nouveau/Xorg.0.log-3.2.0-rc3-ARCH-gf2d092a

and 

http://home.schottelius.org/~nico/unix/progs/xf86-video-nouveau/get-sysinfo.sh.kalamaris.log-3.2.0-rc3-ARCH-gf2d092a

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
