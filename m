From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15350] randr12: VGA-0 always reported as
	"disconnected"
Date: Fri,  4 Apr 2008 14:38:12 -0700 (PDT)
Message-ID: <20080404213812.423E8130150@annarchy.freedesktop.org>
References: <bug-15350-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15350-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15350





--- Comment #8 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2008-04-04 14:38:11 PST ---
Last time I lookked, "Unknown" outputs were only used if nothing could be found
as definitely connected -- since the LVDS *is* connected, you lose. Saying it
is definitely connected should make the xserver use its pool of default modes.

I'm not too worried yet about the lack of ddc, as I strongly suspect (having
looked at a C51 bios image) that the integrated chipset uses a different set of
regs to read/write I2C, hence ddc is broken. Before fixing that though, I'd
like to be convinced that using the xserver's fallback default modes we can get
the screen lit up without additional trickery being required.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
