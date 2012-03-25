From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47790] sys-kernel/gentoo-sources-3.3.0 - black
 screen on second nouveau display
Date: Sun, 25 Mar 2012 14:20:32 +0000
Message-ID: <bug-47790-8800-h5Jq97YbUU@http.bugs.freedesktop.org/>
References: <bug-47790-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47790-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=47790

--- Comment #7 from Frej Drejhammar <frej.drejhammar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-03-25 07:20:32 PDT ---
Running on NV34 [GeForce FX 5200] (rev a1) and upgrading from 3.2.10
to 3.3 (both mainline, ie not gentoo-sources) I experience the same
symptoms, but in this case it is the primary (and only) VGA monitor
that turns black when drm initializes during boot.

Just as in Dan Goodliffe's bug report in Gentoo's bug tracker
everything seems to work normally except that the console stays black,
my monitor reports a valid graphics mode, and DPMS turns off the
monitor after the expected idle interval.

In contrast to Dan Goodliffe I have had better luck during bisecting
and end up with dea7e0ac45fd28f90bbc38ff226d36a9f788efbf as the
culprit:

dea7e0ac45fd28f90bbc38ff226d36a9f788efbf is the first bad commit
commit dea7e0ac45fd28f90bbc38ff226d36a9f788efbf
Author: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Tue Jan 3 17:37:37 2012 -0500

    ttm: fix agp since ttm tt rework

    ttm tt rework modified the way we allocate and populate the
    ttm_tt structure, the AGP side was missing some bit to properly
    work. Fix those and fix radeon and nouveau AGP support.

    Tested on radeon only so far.

    Signed-off-by: Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
    Reviewed-by: Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
    Signed-off-by: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Regards,
Frej

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
