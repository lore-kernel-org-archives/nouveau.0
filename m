From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39010] better handling of large pixmaps
Date: Sun, 30 Oct 2011 09:02:30 +0000
Message-ID: <bug-39010-8800-fegXFCEtwX@http.bugs.freedesktop.org/>
References: <bug-39010-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39010-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39010

--- Comment #5 from Andrew Randrianasulu <randrik-JGs/UdohzUI@public.gmane.org> 2011-10-30 02:02:30 PDT ---
(In reply to comment #3)
> Created attachment 52905 [details] [review]
> exa: set max dimensions based on available VRAM
> 
> I found a solution!
> 
> Since the VRAM size could vary inside each series of cards (e.g. NV10 cards may
> have 32, 64 or 128 MB VRAM), it would better to set max dimensions based on
> available VRAM instead of card series.
> 
> My proposed patch ensures that we always have enough space in VRAM to process
> images. It fixes memory flush on 64 MB cards, and adds back exa support for
> cards that have 32 MB or less memory (with a minimal 8 MB VRAM).
> 
> I tested this patch only on NV17 with 64 MB VRAM.

And anyway ... shouldn't big pixmaps in case of vram shortage just be placed in
GART, and used from it? (sure, xvideo will be slower ...special hint for xv
pixmaps? can't remember if its already there .....)

I have hacked up 2.6.38 kernel (frambuffer default bpp to 8, not 32 -> 5 to 1
mb of vram saved) on machine with tnt2 vanta - 8mb/AGP - it works ... even as
OpenGL hw renderer, i just need to lower resolution back to 640x480x32 for good
Quake1.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
