From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 54056] New: plenty of errors trapped write at plus
	PGRAPH error
Date: Sat, 25 Aug 2012 15:23:15 +0000
Message-ID: <bug-54056-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=54056

             Bug #: 54056
           Summary: plenty of errors trapped write at plus PGRAPH error
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: alinm.elena-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created attachment 66109
  --> https://bugs.freedesktop.org/attachment.cgi?id=66109
dmesg output

Hi,

I have an nvidia 320m on a mac book pro 7,1.
I run opensuse on it... nouveau from yesterday's master [   14.127006] nouveau
E[     
[alin@abbaton:~]: uname -a 
Linux abbaton.ucd.ie 3.6.0-rc2-1-desktop #1 SMP PREEMPT Tue Aug 21 16:17:16 UTC
2012 (e0fa472) x86_64 x86_64 x86_64 GNU/Linux

mesa version 
i | Mesa                    | package | 8.0.4-23.4  | x86_64 |
openSUSE-Factory-Oss


I get plenty of these...
PFB][0000:04:00.0] trapped write at 0x0000369af0 on channel 0x0000fee0
BAR/PFIFO_WRITE/FB reason: VRAM_LIMIT
[   14.127006] nouveau E[     PFB][0000:04:00.0] trapped write at 0x00003a85cc
on channel 0x0000fee0 BAR/PFIFO_WRITE/FB reason: VRAM_LIMIT
[   14.127006] nouveau E[     PFB][0000:04:00.0] trapped read at 0x00003e30f4
on channel 0x0000fee0 BAR/PFIFO_READ/FB reason: VRAM_LIMIT

plus this 
[   35.384336] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[   36.337789] nouveau E[  PGRAPH][0000:04:00.0] DATA_ERROR INVALID_VALUE
[   36.337794] nouveau  [  PGRAPH][0000:04:00.0]  DATA_ERROR
[   36.337799] nouveau E[  PGRAPH][0000:04:00.0] ch 2 [0x000fb4a000] subc 7
class 0x8697 mthd 0x16b0 data 0x00000000
[   62.805500] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable
[   64.363133] nouveau W[    PCE0][0000:04:00.0] disabled, PCE0=1 to enable


as a side effect I get randomnly crashes of X but I do not know if is related
to the write errors...

Alin

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
