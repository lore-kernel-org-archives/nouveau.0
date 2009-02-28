From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20006] powerpc64: Black screen using RandR12
Date: Sat, 28 Feb 2009 07:30:04 -0800 (PST)
Message-ID: <20090228153004.7FBF413005C@annarchy.freedesktop.org>
References: <bug-20006-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20006-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20006


bmaass <bmaass-o02PS0xoJP/7u6qtEXMtuoQuADTiUCJX@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED




--- Comment #45 from bmaass <bmaass-o02PS0xoJP/7u6qtEXMtuoQuADTiUCJX@public.gmane.org>  2009-02-28 07:30:03 PST ---
(In reply to comment #44)
> Thanks for the effort, I wasn't expecting you to have to find a copy :)

No problem, I was planning to do it some day so I could replay some of my old
games. :-)

> According to http://en.wikipedia.org/wiki/Nvidia_Quadro the fx4500 (the Apple
> option for 2 x dual-link) is the same silicon as the 7800gtx, which according
> to http://www.nvidia.com/object/extreme_hd_gpu.html is only 1 x dual-link; the
> difference is normally whether the board manufacturer has connected up the
> traces for the second link pins, and it seems your board manufacturer did, but
> then crippled it in the bios image.  We can't really ignore the image though,
> as there's going to be a majority of cases where the extra link isn't wired up.
> 
> As for using 2 x dual-link, I don't know :)  It's certainly possible that the
> card isn't clocked high enough for some part to have the bandwidth to drive two
> such displays, or (less likely) that the board is populated with some cheaper
> components that can't handle the additional electrical demands.  Assuming you
> don't have access to another 30" :) we're probably not going to find out.
> 
> Unless you can argue a good case for it, I think I'll leave things as they are
> -- an option for "let me do 2 x dual link on a card I bought thinking it
> couldn't" seems like something with very low demand (I guess I could add a pci
> id based override for this Apple card, but that still doesn't resolve whether
> the hardware can run 2 x dual-link simultaneously).

There is some oddity about an Apple S-Video adapter only working on DVI-I-0 on
these cards, I think, so there actually may be cases where people would want to
drive their 30" on DVI-I-1. But considering that there probably are less than a
10000 of these machine-card combinations out there, 99 per cent of which
probably will never run anything but OSX, the effort seems wasted.

Nevertheless, thanks a bunch for fixing this so promptly, I'm a happier person
now. ;-)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
