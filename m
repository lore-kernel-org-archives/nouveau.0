From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50280] Mesa 8.0.3 fails to build dri/nouveau against
 libdrm 2.4.34
Date: Tue, 29 May 2012 18:19:39 +0000
Message-ID: <bug-50280-8800-c1VGWDTcYz@http.bugs.freedesktop.org/>
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

--- Comment #4 from Giovanni Mariani <mc2374-dP4/7z9UC85eoWH0uzbU5w@public.gmane.org> 2012-05-29 11:19:39 PDT ---
(In reply to comment #2)
> At least for mesa backporting's not going to happen.
> You can easily have both old and new versions and headers of libdrm_nouveau
> installed at the same time and it will build and work fine.

Fine for me: I'm on Radeon HW...
But see comment #3: in the case you suggested there is not feature parity for
nouveau (vieux, gallium or whatever).

And, for the sake of arguing, I would like to ask what is the point of a
*stable* mesa release going to be broken in one of their drivers by an
otherwise apparently "innocent" libdrm *stable* upgrade (which in the release
announce nobody warned against); moreover, a brokenness that will remain until
the release of Mesa 8.1 (about 3 months in the future)...
Not all the users are willing to live at the bleeding edge of the git master,
while still willing to have a graphic stack updated to the stable level.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
