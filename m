From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26193] nouveau falls back to NoAccel on 9400M
Date: Sun, 24 Jan 2010 16:40:35 -0800 (PST)
Message-ID: <20100125004035.56AD02DC012@annarchy.freedesktop.org>
References: <bug-26193-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26193-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26193





--- Comment #6 from Ted Phelps <phelps-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>  2010-01-24 16:40:33 PST ---
Brian: Yes, I am using a 64-bit system.

TTM_PAGE_FLAG_DMA32 is used only by ttm_tt_alloc_page(), where it causes
alloc_page() to be called with the __GFP_DMA32 flag set.  This is supposed to
cause it to return only pages in the first 4GB of RAM, so I'm baffled as to why
it's breaking anything.

FWIW, I only have 4GB of RAM in the machine, so in theory all of it could be
safe for 32-bit DMA.

I note that you're also using an x86-64 CPU, and I'd be curious to know if the
patch in comment #4 helps you.  If not, I should open a new bug report.

Thanks,
-Ted


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
