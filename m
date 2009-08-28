From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23445] NV46: GPU lockup with gdm prompt AND logged
	in fbcon
Date: Fri, 28 Aug 2009 15:46:24 -0700 (PDT)
Message-ID: <20090828224624.7FE2B130058@annarchy.freedesktop.org>
References: <bug-23445-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23445-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23445





--- Comment #14 from Renato Caldas <seventhguardian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-08-28 15:46:23 PST ---
The last kernel commit (b3f15458cb2660f430a68a9134a8427f7838d450) changed the
output a bit:

Aug 28 23:35:31 pinguinus login[5576]: ROOT LOGIN  on '/dev/tty1'
Aug 28 23:35:33 pinguinus [   39.975293] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 0/3 Mthd 0x1430 Data 0x00000000
Aug 28 23:35:33 pinguinus [   39.975305] nouveau 0000:01:00.0: Unhandled
PFIFO_INTR - 0x00010000
Aug 28 23:35:33 pinguinus [   39.975312] nouveau 0000:01:00.0: Unhandled
PFIFO_INTR - 0x00010000
(...)
Aug 28 23:35:33 pinguinus [   39.975678] nouveau 0000:01:00.0: Unhandled
PFIFO_INTR - 0x00010000
Aug 28 23:35:33 pinguinus [   39.975702] nouveau 0000:01:00.0: AIII,
invalid/inactive channel id 32
Aug 28 23:35:33 pinguinus [   39.975709] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 28 23:35:33 pinguinus [   39.975714] nouveau 0000:01:00.0: PGRAPH_ERROR -
Ch -1/2 Class 0x0000 Mthd 0x0c3c Data 0x00000000:0x00000000
Aug 28 23:35:33 pinguinus [   39.975724] nouveau 0000:01:00.0: AIII,
invalid/inactive channel id 32
Aug 28 23:35:33 pinguinus [   39.975731] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 28 23:35:33 pinguinus [   39.975735] nouveau 0000:01:00.0: PGRAPH_ERROR -
Ch -1/2 Class 0x0000 Mthd 0x0be4 Data 0x00000000:0x00200108
Aug 28 23:35:33 pinguinus [   39.975746] nouveau 0000:01:00.0: AIII,
invalid/inactive channel id 32
(...)
Aug 28 23:35:33 pinguinus [   39.976048] nouveau 0000:01:00.0: AIII,
invalid/inactive channel id 32
Aug 28 23:35:33 pinguinus [   39.976054] nouveau 0000:01:00.0: PGRAPH_ERROR -
nSource: ILLEGAL_MTHD, nStatus: PROTECTION_FAULT
Aug 28 23:35:33 pinguinus [   39.976058] nouveau 0000:01:00.0: PGRAPH_ERROR -
Ch -1/2 Class 0x0000 Mthd 0x0c20 Data 0x00000000:0x00000000
Aug 28 23:35:33 pinguinus [   39.976085] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 0/0 Mthd 0x0c24 Data 0x00000000
Aug 28 23:35:33 pinguinus [   39.976122] nouveau 0000:01:00.0: PFIFO_DMA_PUSHER
- Ch 1
Aug 28 23:35:33 pinguinus [   39.976128] nouveau 0000:01:00.0: Unhandled
PFIFO_INTR - 0x00010000
Aug 28 23:35:33 pinguinus [   39.976156] nouveau 0000:01:00.0: Unhandled
PFIFO_INTR - 0x00010000
Aug 28 23:35:33 pinguinus [   39.976163] nouveau 0000:01:00.0: Unhandled
PFIFO_INTR - 0x00010000
Aug 28 23:35:33 pinguinus [   40.039606] nouveau 0000:01:00.0: GPU lockup -
switching to software fbcon
Aug 28 23:36:07 pinguinus [   74.083930] SysRq : Emergency Sync
Aug 28 23:36:46 pinguinus syslog-ng[5219]: syslog-ng starting up;
version='2.1.4'

And the console didn't slowdown anymore, but that was the purpose :) I'm not
sure if this output is related to this bug though. It may be a bug with the
software fallbacks... Comments?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
