From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33887] nouveau causes graphic corruption were you
 cant do anything
Date: Sat,  5 Feb 2011 14:07:47 -0800 (PST)
Message-ID: <20110205220747.C7C6B13004E@annarchy.freedesktop.org>
References: <bug-33887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33887

--- Comment #13 from zeruke <oninekoze-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-02-05 14:07:47 PST ---
(In reply to comment #12)
> (In reply to comment #11)
> > @ Maarten Maathuis
> > 
> > i would do the mmio trace if i could but right now until nvidia updates the
> > beta driver to support the new xorg stuff then i wont be able to use the closed
> > source drivers unless i downgrade which at the moment i don't really want to do
> 
> Which xorg version and which nvidia version are you using ?
> http://nouveau.freedesktop.org/wiki/BlobVersions

right now because how im using ubuntu 11.04 alpha2 the xserver is
1.9.99.901+git20110131.be3be768-0ubuntu3 which is seen as xserver 1.10 and
nvidia only had preliminary support with the 270.18 which 270.18 has a problem
with the ABI right now and if i set it to ignoreABI it then i get segfaults
which is a known problem which should be fixed in the next release 

so right now im not running nvidia drivers so im using the basic xorg graphics
because i have to modeset=0 to nouveau so i can see things correctly

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
