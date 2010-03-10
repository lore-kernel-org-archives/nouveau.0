From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] GT230M/nouveau: X server hangs spontaneously
Date: Wed, 10 Mar 2010 09:14:08 -0800 (PST)
Message-ID: <20100310171408.1A06813008C@annarchy.freedesktop.org>
References: <bug-26980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26980





--- Comment #5 from Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2010-03-10 09:14:07 PST ---
(In reply to comment #4)
> Sorry for misplaced report. 
> 
> It happens again - ./peek 0x400700 output is 
> 00400700: 00100001
> 
> So, is there chance this problem resolved in git driver?
> 

17:53 < mwk> shining^: heh, ok, so the bug report looks like it could be
related...
17:53 < mwk> his failing status is 00100001, mine is 01b00001....
17:54 < shining^> mwk: well thats different :)
17:54 < mwk> not so different
17:54 < mwk> mine includes all of his bits
17:54 < mwk> too bad I don't know what most of these bits mean...
17:55 < mwk> 00800000 is CUDA MP execution, 00000001 is the whole PGRAPH... and
that's about it
17:57 < shining^> mwk: ok. and it also hangs regularly for you ?
17:57 < shining^> "usually once per 1-2 days"
17:57 < mwk> shining^: much more often when I'm playing some 3d on it
17:58 < shining^> ok
17:58 < mwk> possibly I could get more lockups out of it, and of the 00100001
kind, if I left X running for long
17:58 < shining^> I suppose the answer to that question is no then : "So, is
there chance this problem resolved in git driver?"
17:59 < mwk> with current git? /me doubts that.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
