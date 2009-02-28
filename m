From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20006] powerpc64: Black screen using RandR12
Date: Sat, 28 Feb 2009 06:32:02 -0800 (PST)
Message-ID: <20090228143202.DE4DB13005A@annarchy.freedesktop.org>
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





--- Comment #44 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2009-02-28 06:32:01 PST ---
(In reply to comment #42)
> Sorry this took so long, I needed to get hold of a copy of OSX. As anticipated,
> OSX would only drive the panel at 1920x1200 on DVI-I-1 (just like nouveau in
> non-randr12 mode).

Thanks for the effort, I wasn't expecting you to have to find a copy :)

> However, with the change you proposed, nouveau will do dual-link on the second
> connector without complaining.
> 
> What is this? Did Apple cripple a dual-dual-link card so the could sell more
> high-end cards instead? Or might this break down if I tried to drive two
> dual-link displays simultaneously?

According to http://en.wikipedia.org/wiki/Nvidia_Quadro the fx4500 (the Apple
option for 2 x dual-link) is the same silicon as the 7800gtx, which according
to http://www.nvidia.com/object/extreme_hd_gpu.html is only 1 x dual-link; the
difference is normally whether the board manufacturer has connected up the
traces for the second link pins, and it seems your board manufacturer did, but
then crippled it in the bios image.  We can't really ignore the image though,
as there's going to be a majority of cases where the extra link isn't wired up.

As for using 2 x dual-link, I don't know :)  It's certainly possible that the
card isn't clocked high enough for some part to have the bandwidth to drive two
such displays, or (less likely) that the board is populated with some cheaper
components that can't handle the additional electrical demands.  Assuming you
don't have access to another 30" :) we're probably not going to find out.

Unless you can argue a good case for it, I think I'll leave things as they are
-- an option for "let me do 2 x dual link on a card I bought thinking it
couldn't" seems like something with very low demand (I guess I could add a pci
id based override for this Apple card, but that still doesn't resolve whether
the hardware can run 2 x dual-link simultaneously).


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
