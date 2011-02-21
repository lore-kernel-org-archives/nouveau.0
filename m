From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 34348] (regression/bisected) (2.6.37 nouveau/KMS)
 internal laptop display remains blank
Date: Mon, 21 Feb 2011 06:38:47 -0800 (PST)
Message-ID: <20110221143847.4DCDA130005@annarchy.freedesktop.org>
References: <bug-34348-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-34348-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=34348

--- Comment #4 from Dragos Delcea <dragos.delcea-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-02-21 06:38:47 PST ---
(In reply to comment #3)
..
> I'll start a new bisect with 85341f27b49833325f97580edcd687b4d90bb30b as the
> good and v2.6.37 as the bad and report back..another 13 steps..doh.

due some hardware related problems I had the internal display swapped with a
new one (the internal display was occasionally flickering badly), and now the
situation is completely upside down: 2.6.37 works, while 2.6.36 doesn't
anymore. 

The flickering display problem was going on for some time, even back in the
2.6.35 and 2.6.36 times, and it was manifesting even during BIOS POST, hence
the thinking that it was a hw problem.

However, now I'm thoroughly confused about the current situation. Is the newer
display different and triggers different (inverse) behavior? I can't see any
meaningful difference in dmesg output of 2.6.37 between working and non
working...

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
