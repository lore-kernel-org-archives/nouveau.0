From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32645] NV20 GF 3 Ti 200, displays blank screen to DVI
Date: Mon,  3 Jan 2011 11:06:32 -0800 (PST)
Message-ID: <20110103190632.80C2313004E@annarchy.freedesktop.org>
References: <bug-32645-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-32645-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=32645

--- Comment #15 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2011-01-03 11:06:32 PST ---
(In reply to comment #14)
> Oops.. you are correct
> here are two videos documenting the two issues I've seen so far:
> Bootup:  About a third of the screen flashes on the bottom, then the top,this
> happens repeatadly.  Also happens when playing videos.
> https://docs.google.com/leaf?id=0B9PdLrdrtm1wOGQzMzYwNjMtZjgwMC00ZTljLThlOGEtZDFmODM0ZDIwMWNh&hl=en&authkey=CNngh6UD
> Small artifacts:  Note on the top of the video (side of the screen) When the
> mouse is over certain objects small artifacts appear.
> https://docs.google.com/leaf?id=0B9PdLrdrtm1wMGNiOGQ4YzMtZWUwOC00Mzg2LWIwN2EtMzRhZmMzNDAwNTk5&hl=en&authkey=CPygr9cM

So, if I've understood correctly, you only get artifacts with this monitor and
not with the other one? Could you please try "nv" or the nvidia binary driver?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
