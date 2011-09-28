From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39550] Brightness stuck to low value after
	suspend/resume
Date: Wed, 28 Sep 2011 08:01:55 -0700 (PDT)
Message-ID: <20110928150155.6178E130187@annarchy.freedesktop.org>
References: <bug-39550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39550-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39550

--- Comment #18 from rick <rick.hendricksen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-28 08:01:55 PDT ---
(In reply to comment #17)
> Peeks for "none" and "nouveau.force_post=1" would be enough - before and after
> suspend
normal boot:

# nvapeek 0xe100; nvapeek 0xe28c; nvapeek 0xe104 8; nvapeek 0xe280 8
0000e100: 001c1100
0000e28c: 00000100
0000e104: 72266640 0441474b
0000e280: 44444747 00000000
# pm-suspend
# nvapeek 0xe100; nvapeek 0xe28c; nvapeek 0xe104 8; nvapeek 0xe280 8
0000e100: 001c1100
0000e28c: 00000100
0000e104: 72266240 0441474b
0000e280: 44444747 00000000



using option: nouveau.force_post=1

# nvapeek 0xe100; nvapeek 0xe28c; nvapeek 0xe104 8; nvapeek 0xe280 8
0000e100: 001c1100
0000e28c: 00000100
0000e104: 72266240 0441474b
0000e280: 44444747 00000000
# pm-suspend
# nvapeek 0xe100; nvapeek 0xe28c; nvapeek 0xe104 8; nvapeek 0xe280 8
0000e100: 001c1100
0000e28c: 00000100
0000e104: 72266240 0441474b
0000e280: 44444747 00000000

> Can you attach your vbios as well please [2]
> 
> [2] $ nvagetvbios > vbios.rom

nvagetvbios didnt exist, so I used nvagetbios (I assume you made a typo)
> 
> Cheers
> Emil
>

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
