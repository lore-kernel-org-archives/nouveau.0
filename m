From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29455] Nouveau TV-out incorrectly detecting load on
	NV18
Date: Thu, 12 Aug 2010 14:04:59 -0700 (PDT)
Message-ID: <20100812210459.43FF2130113@annarchy.freedesktop.org>
References: <bug-29455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29455-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29455

--- Comment #8 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-08-12 14:04:58 PDT ---
Created an attachment (id=37826)
 View: https://bugs.freedesktop.org/attachment.cgi?id=37826
 Review: https://bugs.freedesktop.org/review?bug=29455&attachment=37826

nouveau_imac_g4_tvout.patch

(In reply to comment #7)
> (In reply to comment #6)
> > Your DCB tables are a little bit unusual... Does your card really have a TV
> > output?
> 
> It's not a normal TV output, but the "mini-VGA video output" on my iMac's back
> allegedly can do s-video and composite output with the help of an adapter:
> http://store.apple.com/us/product/M9109G/A?mco=MTY3ODQ5OTY

Ah, that explains a few things. TV load detection probably fails because in VGA
mode the TV encoder lines aren't even electrically connected to the mini-VGA
port.

Most likely there's a GPIO-controlled switch you have to poke to make TV-out
work: the attached patch is just a wild guess, if it has no effect you could
try to play a bit with the "gpio->line" parameter (values in 7-9 and 2-4 should
be safe).

BTW, do you happen to have access to one of these adapters?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
