From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36422] unable to hibernate with nouveau and NV11
	[bisected]
Date: Sun, 24 Apr 2011 15:26:53 -0700 (PDT)
Message-ID: <20110424222653.A10BD13004F@annarchy.freedesktop.org>
References: <bug-36422-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-36422-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=36422

--- Comment #8 from c sights <csights-97jfqw80gc6171pxa8y+qA@public.gmane.org> 2011-04-24 15:26:52 PDT ---
Thanks for the compile fix work around!

I've completed the git bisect:


190a43783f2c43186180c827444d4eac901b4bcf is the first bad commit
commit 190a43783f2c43186180c827444d4eac901b4bcf
Author: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Date:   Thu Jun 17 12:42:14 2010 +0200

    drm/nouveau: Don't clear AGPCMD completely on INIT_RESET.

    We just need to clear the SBA and ENABLE bits to reset the AGP
    controller: If the AGP bridge was configured to use "fast writes",
    clearing the FW bit would break the subsequent MMIO writes and
    eventually end with a lockup.

    Note that all the BIOSes I've seen do the same as we did (it works for
    them because they don't use MMIO), OTOH the blob leaves FW untouched.

    Signed-off-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 2af374ca41a86c67a662fd99fa0516df54ef3c55
89468256a014ee395b57d2ae2e1277fd8c244f31 M  drivers

I can test patches!

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
