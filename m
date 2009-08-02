From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23092] New: Syslog flooded with "nouveau
 0000:01:00.0: Unhandled PFIFO_INTR - 0x00000010"
Date: Sun,  2 Aug 2009 11:04:57 -0700 (PDT)
Message-ID: <bug-23092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=23092

           Summary: Syslog flooded with "nouveau 0000:01:00.0: Unhandled
                    PFIFO_INTR - 0x00000010"
           Product: xorg
           Version: 7.4
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: julien.ozog+freedesktop-1155aFL98BxeoWH0uzbU5w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Hi, I try to use Nouveau for the first time today. Everything seems to work
fine, except that my syslog is flooded with this message :
"kernel: nouveau 0000:01:00.0: Unhandled PFIFO_INTR - 0x00000010"

In the previous 3 hours, this message has been logged ~25000 times.

It seems related with my activity, with an empty desktop and doing nothing, the
message still print but much less often. As soon as I began typing or opening a
menu, the message is logged as much as 50 times per second.

I use DDX, libdrm and DRM snapshots from today. DRM comes from the
master-compat branch (commit         4ea84bc8aeaccc57958b8fb2847965d52b6bda72).
I don't use KMS.
Composite is enabled and used with metacity.

X.Org X Server 1.6.3
Linux 2.6.30.3

My card is :
PCI:*(0:1:0:0) 10de:0407:14c0:0025 nVidia Corporation G84 [GeForce 8600M GT]
rev 161, Mem @ 0xc6000000/16777216, 0xd0000000/268435456, 0xc4000000/33554432,
I/O @ 0x00002000/128


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
