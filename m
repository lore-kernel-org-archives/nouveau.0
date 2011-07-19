From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39362] NVAF (320M) crash on modprobe
Date: Tue, 19 Jul 2011 11:24:37 -0700 (PDT)
Message-ID: <20110719182437.EB7EC1300FE@annarchy.freedesktop.org>
References: <bug-39362-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39362-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=39362

--- Comment #2 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-07-19 11:24:37 PDT ---
Hi Ben

How would you feel about the idea of a static table in *_pm.h that lists the
PLLs that should be ignored

"ignored" can be defined as

* do not read/set the pll and report 0 for it
* do not read/set the pll and report that there is no such pll
* or any other combination

I'm talking about cards lacking different plls
* IGPs - mpll
* some nv50 generation lacking core_unk[4,8]
* possibly the nva3+/nvc0+ have such examples?

Eg.

...
#define IGNORE_MPLL                 0x0001
#define DOES_NOT_EXIST_CORE_UNK8PLL 0x0002
#define IGNORE_VDEC_PLL             0x0004
....
struct pll_ignore_list {
  uint chipset;
  uint caps;
}

struct pll_ignore_list ilist[] = { .....
                                   0xaf, 0x0001 // ignore the MPLL for nvaf
                                   ........... }

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
