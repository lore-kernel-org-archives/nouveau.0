From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46601] New: [drm] nouveau 0000:02:00.0: DCB I2C
	entry invalid
Date: Sat, 25 Feb 2012 05:46:31 +0000
Message-ID: <bug-46601-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=46601

             Bug #: 46601
           Summary: [drm] nouveau 0000:02:00.0: DCB I2C entry invalid
    Classification: Unclassified
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: dasfox-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 57619
  --> https://bugs.freedesktop.org/attachment.cgi?id=57619
Kernel Log

Hi,

I'm running Arch i686 and after I did a core/base install and booted up Arch
for the first time I saw on the bootup/console this message;

[drm] nouveau 0000:02:00.0: DCB I2C entry invalid

Please note that I did not have anything installed other then a base install,
so there wasn't any nouveau packages installed at this time and this message is
coming from the kernel drv, not from the Xorg drv.

But these are the packages I have installed in Arch, but with them installed it
has not changed the message, it still appears.

xf86-video-nouveau-0.0.16_git20120106-1
nouveau-dri-7.11.2-1 

I'm using an Nvidia GeForce 8400 GS though a HD Samsung SyncMaster P2370HD
Monitor on HDMI.

My system boots and runs fine, it's just annoying because it's always displayed
on the screen at bootup, so if anything, it would be great to get this off the
screen and kept in the logs...


THANKS

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
