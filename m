From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31169] no image when booting / G86 [GeForce 8400M GS]
Date: Sat, 11 Jun 2011 14:35:57 -0700 (PDT)
Message-ID: <20110611213557.9136013004E@annarchy.freedesktop.org>
References: <bug-31169-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31169-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31169

--- Comment #14 from Marius Vasilescu <marius.vasilescu-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> 2011-06-11 14:35:56 PDT ---
Created an attachment (id=47853)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=47853)
Xorg.0.log (git20110411)

Ben, I've just did a test using the latest ubuntu daily build (i386) with
xserver-xorg-video-nouveau (1:0.0.16+git20110411+8378443-1); "NOUVEAU driver
Date: Thu Mar 24 02:13:12 2011 +1000"

It still doesn't work, I wonder if the changes you were talking about were
before or after this git snapshot. "nouveau.uscript_lvds=0x0300" (or 0x0100)
worked just fine.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
