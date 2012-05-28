From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50280] Mesa 8.0.3 fails to build dri/nouveau against
 libdrm 2.4.34
Date: Mon, 28 May 2012 19:41:15 +0000
Message-ID: <bug-50280-8800-OzaBWE36gE@http.bugs.freedesktop.org/>
References: <bug-50280-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50280-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=50280

--- Comment #1 from Giovanni Mariani <mc2374-dP4/7z9UC85eoWH0uzbU5w@public.gmane.org> 2012-05-28 12:41:15 PDT ---
This happens because nobody settled to back-port to the stable 8.0.x branch the
changes made at the various nouveau drivers in the master tree between
13/04/2012 and 15/04/2012 to allow them use the new stable DRM interface.

So, this problem affects not only the dri-based nouveau driver (nouveau-vieux),
but also the gallium and the xorg-base ones: they are unbuildable in the stable
branch because all based on an interface now removed from libdrm.

To solve this bug it will need to adapt at the stable branch at least the
master git commits:
2e47d01c9e5325906cf3bb979279599991c6328e,
6d1cdec3ba151168bfc3aef222fba6265dfb41fb and
f2509df95cd1d055e91b1558c5d9c5a935067d78.

However all those don't apply well to the stable branch, because they depends
on the automake-ification of the building for src/mesa/dri/ and this also
happened on 20/01/2012, ie after the cutting of the stable branch (13/01/2012),
and it was never backported on it.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
