From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] NVA3 / NVA5 / NVA8 / NVAF (GT2xx/GT3xx) with
 nouveau: random GPU lockups
Date: Sat, 17 Sep 2011 22:01:30 -0700 (PDT)
Message-ID: <20110918050130.6F78E1300D3@annarchy.freedesktop.org>
References: <bug-26980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26980

--- Comment #66 from Arun Raghavan <arun-SJV6IgfXIPzk1uMJSBkQmQ@public.gmane.org> 2011-09-17 22:01:23 PDT ---
(In reply to comment #64)
> (In reply to comment #63)
> > (In reply to comment #62)
> > [...]
> > > Did you have any output in your kernel log from when this occurred?
> > 
> > There was no output after the initial module load messages.
> 
> Are you able to install envytools
> (http://nouveau.git.sourceforge.net/git/gitweb.cgi?p=nouveau/envytools;a=summary)
> and run "nvapeek 0x400700 4" while the GPU is hung?

All I get is a '...'.

> Also, how new are all your userspace components (xf86-video-nouveau, libdrm,
> mesa etc)?

mesa - 7.11
libdrm - 2.4.26
xf86-video-nouveau - 0.0.16_pre20110801 (that's the Gentoo package, which is
presumably a snapshot from that date)

For what it's worth, kernel's 3.0.4, and the GPU is a 9400M (PCI id 10de:0863).

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
