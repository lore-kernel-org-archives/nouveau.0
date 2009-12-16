From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25658] Move to loadable firmware breaks suspend on
	nVidia 9800M
Date: Tue, 15 Dec 2009 16:01:21 -0800 (PST)
Message-ID: <20091216000121.A29DF2DC105@annarchy.freedesktop.org>
References: <bug-25658-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25658-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25658





--- Comment #3 from Tavian Barnes <tavianator-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-12-15 16:01:21 PST ---
(In reply to comment #2)
> What disk partition does nouveau leave firmware on or is it built into initrd?
> 
> If the partition containing firmware isnt mounted when nouveau tries
> to reload on resume wont there be problems?
> 

The firmware is in /lib/firmware/nouveau on both my root partition and the
initrd.  But I don't think that's the issue anyway, since it never suspends in
the first place; it just sits there blinking.  I'm wondering if there was a
mistake in extracting the firmware from the C source, or if there's something
broken about the firmware interface and suspend.  Does it work with other
(non-NV92) cards?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
