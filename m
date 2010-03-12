From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26800] Nouveau TV-out incorrectly detecting load
Date: Fri, 12 Mar 2010 13:46:05 -0800 (PST)
Message-ID: <20100312214605.E14E61300AB@annarchy.freedesktop.org>
References: <bug-26800-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26800-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=26800





--- Comment #14 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2010-03-12 13:46:05 PST ---
(In reply to comment #13)
> (In reply to comment #12)
> > Created an attachment (id=34006)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=34006) [details] [details]
> > nv67_tvdac_load_2.patch
> > 
> > 
> > Does the attached patch have the same effect?
> > 
> 
> Do I need to revert the previous patch to apply this one? 
> 
Yes.

> > Actually it's a bit unexpected, TV-out is supposed to work on all the nv40-like
> > cards, but I think you're the first one to try it on an nv6x. 
> 
> Hmmm ok. According to the status matrix, it is showing that it's the nv30 that
> is supposed to have functional TV-out, with NV40 cards marked as "mostly."
> 
> This is interesting, because I have a 6600 chip in my media machine, and I was
> unable to get TV out from that as well, which I think is an NV40 card. I didn't
> spend much time on that, so I'll do more testing.
> 
That one was reported to work IIRC.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
