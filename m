From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10547] nouveau: __ucmpdi2 unresolved on ppc32
Date: Wed,  6 Feb 2008 04:55:51 -0800 (PST)
Message-ID: <20080206125551.7243E130055@annarchy.freedesktop.org>
References: <bug-10547-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-10547-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10547


Emanuele <emanuele.zamprogno-B2aCaCA9eTITvJdVw9/FMWGXanvQGlWp@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |emanuele.zamprogno@medicinao
                   |                            |pen.info




--- Comment #9 from Emanuele <emanuele.zamprogno-B2aCaCA9eTITvJdVw9/FMWGXanvQGlWp@public.gmane.org>  2008-02-06 04:55:50 PST ---
Hi,

I'm using an gcc 4.2.3 from Debian and a Kernel 2.6.24 in a Powerbook G4
[ppc32], but when i conpile DRM, i continue to have the problem.

[drm] Initialized drm 1.1.0 20060810
nouveau: Unknown symbol __ucmpdi2


Any ideas? or anything  i can bring here to explain these?

Thanks


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
