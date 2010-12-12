From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nv50 channel takedown
Date: Sun, 12 Dec 2010 11:56:19 +0100
Message-ID: <AANLkTimCGns+nKEb90yr+KUNf=d0W0A_5eA-Rnzq682s@mail.gmail.com>
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
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

I am seeing problems on 2.6.36-rc7 based kernels.

The error always happens during a channel destruction (always gallium
on channel 3 in my tests), and always looks like this :
<3>[  612.115977] [drm] nouveau 0000:01:00.0: AIII, invalid/inactive
channel id 128
<6>[  612.115987] [drm] nouveau 0000:01:00.0: PGRAPH_DATA_ERROR - Ch
-1/3 Class 0x5039 Mthd 0x0184 Data 0x00000000:0x00000e02
<6>[  612.115990] [drm] nouveau 0000:01:00.0: PGRAPH_DATA_ERROR - INVALID_OBJECT

This is associated with screen corruptions, mostly all fonts/icons disappearing.

The oldest commit where I could see the error during a full piglit run :

commit ea645107d204ebb9c6da494b8fc82e03d74e4513
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Tue Oct 12 08:01:59 2010 +1000

    drm/nouveau: fix thinko in channel locking in semaphore path

But I might have seen troubles with older commits (still 2.6.36-rc7 based).
And I still don't know if the issue is always triggered by the same
piglit tests or not.

But with a later commit, the issue became much more frequent,
triggered by many piglit tests, so I could easily isolate one
(fdo10370) which reproduces the issue almost every time :

commit 36a7ebda99e904a66188c7304d033e81780455e2
Author: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Date:   Mon Oct 18 03:53:39 2010 +0200

    drm/nouveau: Refactor context destruction to avoid a lock ordering issue.

Reversing pfifo and pgraph destruction order as before, and the issue
becomes less frequent again.

I would love to know if anyone at all ever managed to reproduce this.
