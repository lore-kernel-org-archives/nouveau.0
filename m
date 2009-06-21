From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 22317] Interlace does not work with Geforce 6200 /
	NV44a
Date: Sun, 21 Jun 2009 04:22:32 -0700 (PDT)
Message-ID: <20090621112232.67340130016@annarchy.freedesktop.org>
References: <bug-22317-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-22317-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=22317





--- Comment #6 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2009-06-21 04:22:31 PST ---
Created an attachment (id=26994)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=26994)
nv17_interlace.patch

Here on nv17, the attached patch seems necessary in addition to your patch for
interlaced modes to work.

Without clearing NV_PCRTC_CONFIG_START_ADDRESS_HSYNC I get a meaningful image
but only the odd fields (or the even ones, I don't know for sure ;-) are
displayed. The blob seems to set NV_CIO_CRE_43 to 0x1 on all the hardware i've
got around (nv34, nv35, nv40) but on this nv17 when an interlaced mode is being
used, not doing it causes some weird diagonal lines to be displayed.

I don't know what the problem is with interlaced modes on nv2x, these patches
might also fix them but I don't have any at hand.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
