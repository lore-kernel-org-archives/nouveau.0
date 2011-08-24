From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40334] New: Kernel-BUG on resume from suspen-to-ram
 with NV GeForce Go 7600
Date: Tue, 23 Aug 2011 23:24:41 -0700 (PDT)
Message-ID: <bug-40334-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40334

           Summary: Kernel-BUG on resume from suspen-to-ram with NV
                    GeForce Go 7600
           Product: xorg
           Version: git
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: er-ri-hi6Y0CQ0nG0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=50515)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=50515)
Dmesg of a suspend-resume-cycle with "drm.debug=0x2 log_buf_len=1M"

On Tue, 23 Aug 2011 15:28:45 +0100, Erwin Rieger <er-ri-hi6Y0CQ0nG0@public.gmane.org> wrote:

> Hello,
>
> i'am trying to get suspend/resume working on a (old) asus A7T notebook
> (NV GeForce Go 7600 GPU).
>
> Suspend is OK, laptop goes to sleep and power-led is blinking.
>
> Upon resume, the laptop and backlight are starting, but there is no
> screen output (blank/black screen).
>
> After some (stuck-) time i'am able to ssh to it and it seems to be working
> okay - apart from the blank screen.
>
> Dmesg shows some "soft lockup, CPU stuck" errors, related to nouveau-drm
> (i think), see attached dmesg-output.
>
> There is no X11 involved (yet) - pure framebuffer-console.
>
> Kernel is from freedesktop-git, version "3.1.0-rc2+ #8 SMP Tue Aug 23
> 08:14:54 UTC 2011".
>
> Should this old hardware work / is it supported by current nouveau?
>
> If more info/logs is needed - please let me know.

Hi Erwin,

Afaik nouveau is supported on your hardware, thus please feel free to open
a bug report [1]. As otherwise your email may/will get lost in the ML

Please note that resolving it may take some time due to shortage of
manpower

In your case something wrong is happening in the TMDS initialization script
thus your blank display

Can you append "drm.debug=0x2 log_buf_len=1M" to your kernel command line
and attach to your bug report
1. Your dmesg output
2. Your vbios [2]

Thanks
Emil

[1] http://nouveau.freedesktop.org/wiki/Bugs
[2] http://nouveau.freedesktop.org/wiki/DumpingVideoBios

>
> Thanks
>

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
