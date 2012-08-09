From: Chris <chrisengel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re:
	=?utf-8?q?=5BBug_53101=5D_Fedora_17_=22PFIFO_-_playlist?=
	=?utf-8?q?_update_failed=22_on=09boot?=
Date: Thu, 9 Aug 2012 14:09:06 +0000 (UTC)
Message-ID: <loom.20120809T160601-338@post.gmane.org>
References: <bug-53101-8800@http.bugs.freedesktop.org/>
	<bug-53101-8800-7hZx4f3xT8@http.bugs.freedesktop.org/>
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

 <bugzilla-daemon@...> writes:

> 
> https://bugs.freedesktop.org/show_bug.cgi?id=53101
> 
> --- Comment #1 from mog55356@... 2012-08-03
> 18:54:38 UTC ---
> I was asked to try booting with option nouveau.noaccel=1. Grub didn't complain
> when I added it to the boot instructions, but the results were identical so I'm
> not sure whether or not the command "took." Below is a pastebin link to the new
> /var/log/messages. I hope it is useful.
> 
> http://pastebin.com/t39ZHCwP
> 


I'm hitting similar failures with the latest updates to F17 but only when I
attempt to come out of suspend.  The initial boot works fine.

Aug  9 08:59:10 cengel kernel: [33296.674903] [drm] nouveau 0000:01:00.0: Failed
to idle channel 1.
Aug  9 08:59:12 cengel kernel: [33298.674948] [drm] nouveau 0000:01:00.0: 0x2634
!= chid: 0x00100001
Aug  9 08:59:14 cengel kernel: [33300.674816] [drm] nouveau 0000:01:00.0: PFIFO
- playlist update failed
Aug  9 08:59:17 cengel kernel: [33303.674113] [drm] nouveau 0000:01:00.0: Failed
to idle channel 2.
Aug  9 08:59:19 cengel kernel: [33305.674063] [drm] nouveau 0000:01:00.0: 0x2634
!= chid: 0x00100002
Aug  9 08:59:21 cengel kernel: [33307.673952] [drm] nouveau 0000:01:00.0: PFIFO
- playlist update failed
