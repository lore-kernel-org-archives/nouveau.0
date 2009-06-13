From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 22265] New: GeForce3 Ti 500 - Unknown DCB 1.5 entry
Date: Fri, 12 Jun 2009 21:15:19 -0700 (PDT)
Message-ID: <bug-22265-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=22265

           Summary: GeForce3 Ti 500 - Unknown DCB 1.5 entry
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: neuerversuch-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=26746)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=26746)
Zipfile containing Xorg.0.log and the output of lspci -vvnn

I've tried to use the Nouveau Driver on an Fedora 11 installation
Linux  2.6.29.4-167.fc11.i586 #1 SMP Wed May 27 17:14:37 EDT 2009 i686 athlon
i386 GNU/Linux

Video Card is a GeForce3 Ti 500 

Using the nouveau driver in my xorg.conf I get a blank screen after booting the
system. (Text Console works) 

Looking at Xorg.0.log the following lines are found

(II) NOUVEAU(0): BMP BIOS found
(II) NOUVEAU(0): BMP version 5.20
(II) NOUVEAU(0): Bios version 03.20.00.20
(II) NOUVEAU(0): Found Display Configuration Block version 1.5
(!!) NOUVEAU(0): Raw DCB entry 0: f0003f00 000088b8
(!!) NOUVEAU(0): Raw DCB entry 1: f2205002 ffffffff
(EE) NOUVEAU(0): Unknown DCB 1.5 entry, please report

Backtrace:
0: /usr/bin/Xorg(xorg_backtrace+0x3b) [0x812d07b]
1: /usr/bin/Xorg(xf86SigHandler+0x9e) [0x80c061e]
2: [0xc1a400]
3: /usr/lib/xorg/modules/drivers//nouveau_drv.so(NvSetupOutputs+0x3b)
[0x1f16ab]
4: /usr/lib/xorg/modules/drivers//nouveau_drv.so [0x1e8c4a]
5: /usr/bin/Xorg(InitOutput+0x4e9) [0x80a8e39]
6: /usr/bin/Xorg(main+0x1cb) [0x806b92b]
7: /lib/libc.so.6(__libc_start_main+0xe6) [0xaa5a66]
8: /usr/bin/Xorg [0x806afa1]

Fatal server error:
Caught signal 11.  Server aborting

Is there a workaround (special configuration entry, kernel parameter etc.)
available?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
