From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21124] nouveau: fonts "chipped" on NV44
Date: Tue, 17 Aug 2010 05:48:13 -0700 (PDT)
Message-ID: <20100817124813.29A6E1300A5@annarchy.freedesktop.org>
References: <bug-21124-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21124-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=21124

--- Comment #8 from Vlado Plaga <rechner-dLI15PoULosb1SvskN2V4Q@public.gmane.org> 2010-08-17 05:48:12 PDT ---
(In reply to comment #6)

> It changed when I played around with KDE's "sub-pixel rendering" and "hinting
> style" settings, see for yourself in the attached PNG.

Thank you very much, Patrick! I now had similar problems with damaged fonts
(most often in letters like "l", "i", or symbols like ":" and "." for about
half a year!

Changing the sub-pixel rendering settings in KDE (System Settings/ Application
Appearance/ fonts/) made fonts on my system look great again! I had to chose
"deactivated" (looks ugly) or "activated" instead of the preset "system
default".

The problems often only occurred after I had started a few applications and
used them for some time. I tried different operating systems (Fedora, Debian,
Ubuntu) with different versions of nouveau. With the "nv" driver I newer had
such problems. I'm so glad this seems fixed for me now!

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
