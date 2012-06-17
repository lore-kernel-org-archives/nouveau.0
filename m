From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 46557] nouveau: nv4E 2D acceleration broken on
 64-bit kernel; works on 32-bit
Date: Sun, 17 Jun 2012 15:03:12 +0000
Message-ID: <bug-46557-8800-bvn6K2eVM1@http.bugs.freedesktop.org/>
References: <bug-46557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-46557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=46557

--- Comment #14 from D. Hugh Redelmeier <hugh-pmF8o41NoarQT0dZR+AlfA@public.gmane.org> 2012-06-17 08:03:12 PDT ---
Marcin:

Thanks for the proposed patch.

I'm in "dumb Ubuntu user mode".  Would testing your patch be valuable to the
cause, valuable enough for me to learn how to learn how to rebuild Ubuntu
kernels, with patches?  (I've rebuilt CentOS kernels and long ago built
kernel.org kernels, but not debian or Ubuntu kernels.)

Is there a good test for "broken PCI/AGP" hardware?  I take it that there is a
lot broken at the 4G boundary but you suspect mine is broken at the 2G
boundary.

Possibly relevant factoid: the notebook is speced to accept 4G of RAM but won't
with this BIOS (the latest).  It will accept 4G with an older BIOS.  The
manufacturer (Acer) does not accept that this is a defect.

I had guessed (based on no evidence) that there was a sign-extension bug in the
nouveau code. That guess was based on the apparent fact that a 32-bit kernel
worked.

How do you distinguish hardware vs software bug?  Your patch should bypass
either.

I would have thought that a kernel parameter to set MAX_DMA32_PFN might be
useful.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
