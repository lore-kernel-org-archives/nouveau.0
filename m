From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] NVA3 / NVA5 / NVA8 / NVAF (GT2xx/GT3xx) with
 nouveau: random GPU lockups
Date: Sat, 26 Feb 2011 15:51:39 -0800 (PST)
Message-ID: <20110226235139.3D6AB130009@annarchy.freedesktop.org>
References: <bug-26980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26980

--- Comment #50 from Thomas Schwinge <thomas-1XcWbA+8eGGLwutG50LtGA@public.gmane.org> 2011-02-26 15:51:38 PST ---
Created an attachment (id=43864)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=43864)
peek_10a000_1000-tschwinge.tar.bz2

Marcin, in case you need further data, see the
peek_10a000_1000-tschwinge.tar.bz2 which I'm just attaching.  The files'
names should be explanatory.  I ran each of the invokations three times.

I will now switch to using nouveau.noaccel=1, but please tell if you need
further data or need something tested.

This system is a DELL PRECISION M4500, the graphics card's lspci output:

01:00.0 VGA compatible controller: nVidia Corporation GT216 [Quadro FX 880M]
(rev a2)


I hit this while setting up the system, roughly one hour after finishing
a fresh Ubuntu 10.10 maverick installation, while browsing in Firfox some
web pages about how to get suspend / hibernate / resume working reliably
-- oh the joy of installing GNU/Linux systems on new hardware.  :-)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
