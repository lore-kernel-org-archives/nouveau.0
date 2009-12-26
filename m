From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25802] New: nouveau driver crashes in exa
Date: Sat, 26 Dec 2009 14:24:20 -0800 (PST)
Message-ID: <bug-25802-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25802

           Summary: nouveau driver crashes in exa
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: cowhead-hi6Y0CQ0nG0@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=32305)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=32305)
output of dmesg| grep nouveau

The nouveau driver crashes somwhere while doing EXA stuff ( I can reproduce it
by opening the noscript menu in firefox or using thunderbird for some time..)
gdb gave me this output:

Program received signal SIGSEGV, Segmentation fault.
0xb730ae4e in NVAccelUploadM2MF ()
   from /usr/lib/xorg/modules/drivers/nouveau_drv.so
(gdb) bt
#0  0xb730ae4e in NVAccelUploadM2MF ()
   from /usr/lib/xorg/modules/drivers/nouveau_drv.so
#1  0xb730b46e in nouveau_exa_upload_to_screen ()
   from /usr/lib/xorg/modules/drivers/nouveau_drv.so
#2  0xb60fe1ae in exaHWCopyNtoN () from /usr/lib/xorg/modules/libexa.so
#3  0xb60fe6d8 in exaCopyNtoN () from /usr/lib/xorg/modules/libexa.so
#4  0x081b677a in miCopyRegion ()
#5  0x081b6d25 in miDoCopy ()
#6  0xb60fcae6 in exaCopyArea () from /usr/lib/xorg/modules/libexa.so
#7  0x08108a3f in damageCopyArea ()
#8  0x08089a4c in ProcCopyArea ()
#9  0x0808bd87 in Dispatch ()
#10 0x080638ab in main ()


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
