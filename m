From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20006] powerpc64: Black screen using RandR12
Date: Fri, 13 Feb 2009 03:12:13 -0800 (PST)
Message-ID: <20090213111213.33447130058@annarchy.freedesktop.org>
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





--- Comment #18 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2009-02-13 03:12:12 PST ---
(In reply to comment #17)
> Created an attachment (id=22894)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=22894) [details]
> randr12 and patches register dump

Thanks.  Some quick questions to help in making the next patch, and some other
things to try in the future:

This register dump is with all three patches, or just the first two?

> Patch 0001 didn't do anything visibly, patch 0002 "fixes" the problem (more in
> a second) and I couldn't see if patch 0003 improved anything over 0002.

Just to clarify, you tried 0003 on top of 0002, but could see no difference?

> The "fix" is that I finally get a picture (can see xterms, xclock, interact
> with them), but it's still horribly wrong somehow. Looks like the picture is
> missing vertical lines, but somehow still not everywhere (TWM resize lines may
> disappear, but there are no gaps in the windows themselves).

Hmm, might be interesting to see a picture should you have a digital camera,
but don't worry if it's not convenient.

> This is consistent over all modes I've tried (2560x1600, 1920x1200, 1280x800)
> and doesn't show up on a screenshot. It also doesn't get restored back to
> normal when quitting the X server: the brokenness remains when using the
> console afterwards.

Is it worse than the "picture degradation (bad resolution?) which isn't
recovered even when killing X" you mentioned previously, or the same?

One other thing that would be interesting to know next time you test (using a
clean checkout (no patches)), if you add `Option "FPScale" "off"' in the driver
section of your xorg.conf, and set 1280x800, whether that works any better.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
