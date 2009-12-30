From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25824] KMS, Dualhead: Strange bigger console
Date: Wed, 30 Dec 2009 04:15:53 -0800 (PST)
Message-ID: <20091230121553.4DCBB13005D@annarchy.freedesktop.org>
References: <bug-25824-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25824-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25824





--- Comment #5 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2009-12-30 04:15:52 PST ---
(In reply to comment #4)
> (In reply to comment #3)
> > Case 2 you should be able to achieve with the "video" kernel command line
> > parameter, forcing the small mode on the big monitor. I hope it is documented
> > in the kernel Documentation, since I do not recall the correct syntax.
> That depends if nouveau driver uses modedb or not.
> 
> from Documentation/fb/modedb.txt

That is the legacy fb option "video". I was talking about the drmfb "video"
variant, but I cannot find the documentation. The only doc I know of is:
http://cgit.freedesktop.org/nouveau/linux-2.6/tree/drivers/gpu/drm/drm_fb_helper.c#n68

The syntax is something like:
video=<output>:<mode>

Where output is as reported by the kernel DRM/KMS.

A made-up example: video=DVI-I-1:1024x768

This option is for all DRM/KMS fb drivers AFAIK: intel, radeon and nouveau.
It's a bit odd that it isn't properly documented yet.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
