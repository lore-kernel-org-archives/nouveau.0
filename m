From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 42384] New: X fails on NV11 with Error allocating
 scanout buffer: 0
Date: Sat, 29 Oct 2011 12:40:57 +0000
Message-ID: <bug-42384-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=42384

             Bug #: 42384
           Summary: X fails on NV11 with Error allocating scanout buffer:
                    0
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: chris-Tc38MJj1weLQT0dZR+AlfA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 52902
  --> https://bugs.freedesktop.org/attachment.cgi?id=52902
xorg log

Hi,

I have an old Geforce2Go card (NV11). The nouveau framebuffer is working fine
(KMS enabled), but X won't start with the nouveau driver (it's okay with
fbdev):

[    54.231] (II) NOUVEAU(0): Opened GPU channel 1
[    54.231] (II) NOUVEAU(0): [DRI2] Setup complete
[    54.231] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau_vieux
[    54.231] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau_vieux
[    54.233] (EE) NOUVEAU(0): Error allocating scanout buffer: 0
[    54.233] 
Fatal server error:
[    54.233] AddScreen/ScreenInit failed for driver 0

I'm on Fedora 15 and I have tried with the latest packaged driver and with a
build of xf86-video-nouveau from git.

xf86-video-nouveau: git 29 Oct 2011
libdrm-2.4.26-1.fc15.i686
xorg-x11-server-Xorg-1.10.4-1.fc15.i686

I'm not interested in 3D, but I can't work out if there's something I've failed
to disable. If you need me to enable more debug, please point to some
instructions on how to do this.

dmesg, Xorg logs & cfg attached.

Regards,
Chris.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
