From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24002] New: PFIFO_CACHE_ERROR PGRAPH_ERROR
Date: Thu, 17 Sep 2009 13:02:46 -0700 (PDT)
Message-ID: <bug-24002-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24002

           Summary: PFIFO_CACHE_ERROR PGRAPH_ERROR
           Product: xorg
           Version: unspecified
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: Martijn.Ras-38QdudLKEwwAvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Heya Folks,

Since updating to Fedora 11 I run into a problem with nouveau.

When I've been away, on returning there's no response to either keyboard or
mouse input, so I can't get out of the xscreensaver. Sometimes this happens
while I'm working, in which case the screen gets garbled, in those cases the
mouse still works, but the keyboard doesn't.

In both cases I need to restart the machine remotely.

Today I finally got something that might be helpful in /var/log/messages:

Sep 17 08:03:26 localhost kernel: usb 2-2: USB disconnect, address 7
Sep 17 17:25:08 localhost kernel: nouveau 0000:05:00.0: PFIFO_CACHE_ERROR - Ch
1/7 Mthd 0x0184 Data 0xd8000002
Sep 17 17:25:08 localhost kernel: nouveau 0000:05:00.0: PFIFO_CACHE_ERROR - Ch
1/7 Mthd 0x0188 Data 0xd8000001
Sep 17 17:25:08 localhost kernel: nouveau 0000:05:00.0: PGRAPH_ERROR - nSource:
DMA_W_PROTECTION, nStatus: PROTECTION_FAULT
Sep 17 17:25:08 localhost kernel: nouveau 0000:05:00.0: PGRAPH_ERROR - Ch 1/7
Class 0x0039 Mthd 0x0328 Data 0x0454d26c:0x00000000

The first message is from this morning when I unplugged my PDA.
The remainder are when I powered on my monitor upon my return.

$ lspci | grep nVidia
05:00.0 VGA compatible controller: nVidia Corporation NV36.2 [GeForce FX 5700]
(rev a1)

Mazzel,

Martijn.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
