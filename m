From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30370] Nouveau module crashes with "divide error"
Date: Tue, 15 Feb 2011 02:21:35 -0800 (PST)
Message-ID: <20110215102135.B810B2DC101@annarchy.freedesktop.org>
References: <bug-30370-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30370-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30370

--- Comment #8 from Emil Velikov <eeydev-QabDm/c3fAmwa9SdKMSz+Q@public.gmane.org> 2011-02-15 02:21:35 PST ---
Currently there is a patch that does "handle" this situation [1]. Unfortunately
I was
 silly enough to assume perfect PLL limits table, therefore on some cards it
introduces
 a recession. It is mainly related to understanding/mapping the correct
registers on 
the all of the cards (thus my request for a Power-management dump).
As the mappings can be quite extensive and currently not fully known I would
opt out
 of my solution and prefer the one given by Marcin Slusarz [2]

[1]
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=eadc69cc9054594ff7860d407f855536af13af99
[2] https://bugs.freedesktop.org/attachment.cgi?id=38950
________________________________________
From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org [bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org]
Sent: 15 February 2011 09:58
To: eeydev-QabDm/c3fAmwa9SdKMSz+Q@public.gmane.org
Subject: [Bug 30370] Nouveau module crashes with "divide error"

https://bugs.freedesktop.org/show_bug.cgi?id=30370

Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |eeydev-QabDm/c3fAmwa9SdKMSz+Q@public.gmane.org

--- Comment #7 from Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> 2011-02-15 01:58:17 PST ---
@Emil: could you please comment on this? Do we still need something or should
we close this bug as the reported problem is apparently fixed?

--
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
This message and any attachment are intended solely for the addressee and may
contain confidential information. If you have received this message in error,
please send it back to me, and immediately delete it.   Please do not use, copy
or disclose the information contained in this message or in any attachment. 
Any views or opinions expressed by the author of this email do not necessarily
reflect the views of the University of Nottingham.

This message has been checked for viruses but the contents of an attachment
may still contain software viruses which could damage your computer system:
you are advised to perform your own checks. Email communications with the
University of Nottingham may be monitored as permitted by UK legislation.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
