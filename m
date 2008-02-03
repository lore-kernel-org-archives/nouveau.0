From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13993] Display corruption when using iceWM
Date: Sun,  3 Feb 2008 05:23:04 -0800 (PST)
Message-ID: <20080203132304.A34CB130051@annarchy.freedesktop.org>
References: <bug-13993-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-13993-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=13993





--- Comment #7 from Jaime Velasco Juan <jsagarribay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-02-03 05:23:03 PST ---
Created an attachment (id=14114)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=14114)
Fix NoAccel (and ShadowFB)

I bisected the NoAccel issue, the problem was introduced with

commit 2af4a28ae1df46686e264bcda417a896b7cfa59a
Author: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Date:   Fri Nov 16 09:18:33 2007 +1100

    Hook up DMA funcs to channels/grobjs etc etc

With this patch, NoAccel works again.
Regarding the original bug with iceWM, I'm not able to test/do anything now,
but hopefully will be the next week.

Regards


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
