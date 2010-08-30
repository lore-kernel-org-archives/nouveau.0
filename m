From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29800] drm detects GPU lockup with dual cards/Xorg
 hard locks even with single screen
Date: Mon, 30 Aug 2010 11:57:10 -0700 (PDT)
Message-ID: <20100830185710.771921300B7@annarchy.freedesktop.org>
References: <bug-29800-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29800-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29800

--- Comment #9 from Thomas Spear <Speeddymon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-08-30 11:57:10 PDT ---
After a coworker got his F13 x86 install working with 3 monitors (with the
blob) by removing NetworkManager, I started looking into my problem some more,
and first tried removing NetworkManager. That did not change anything.

So I googled for the NVIDIA(0) WAIT error that I had from the bottom of the X
log from when I used the blob. Sure enough, first result is a redhat bug
(closed as notabug). The error is apparently in the Intel IOMMU, and adding
intel_iommu=off to the boot command line seems to fix the hard lockup and
allows my x86_64 install of F13 to use all 3 screens on both cards with the
blob.

I will check if this has also fixed nouveau sometime soon and report back if it
has.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
