From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21273] Driver can't detect video output and xserver
 doesn't start
Date: Thu, 18 Nov 2010 17:35:38 -0800 (PST)
Message-ID: <20101119013538.CA67713000D@annarchy.freedesktop.org>
References: <bug-21273-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21273-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=21273

--- Comment #43 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-11-18 17:35:38 PST ---
Created an attachment (id=40401)
 View: https://bugs.freedesktop.org/attachment.cgi?id=40401
 Review: https://bugs.freedesktop.org/review?bug=21273&attachment=40401

nv17_mac_dcb.patch

(In reply to comment #36)
> (In reply to comment #33)
> > Ok, I've pushed the dvi-analogue patch in
> > http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=b7e3306ddc3693699f6f9de7b22913ee22ed31ed
> > I can't fix the dvi-digital or apple connectors without some register dumps
> > with those in use.
> I added attachment of registers with dvi-digital connector. Hope apple don't
> need.
> > 
> > I'd suggest making a new separate bug for your font problem, and leave this one
> > for the remaining connectors.
> > 
> I think this good idea.

Andrey, the patch I'm attaching should fix KMS on your card with DVI-D and
DVI-A, can you try it on a recent kernel tree and tell me if it works? If it
does, can you provide the output from "lspci -vvnn" as well?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
