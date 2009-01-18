From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 19644] FreeBSD port of kernel-side code
Date: Sun, 18 Jan 2009 14:20:52 -0800 (PST)
Message-ID: <20090118222052.7E497130054@annarchy.freedesktop.org>
References: <bug-19644-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-19644-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=19644





--- Comment #2 from Henrik Friedrichsen <h1web-WM9rSkgN7VnQT0dZR+AlfA@public.gmane.org>  2009-01-18 14:20:52 PST ---
(In reply to comment #1)
> There are a few buts here. None of the active Nouveau developers are working on
> any BSD. There are few people, who are porting DRM in general and some drivers
> to various BSDs, but it is not a small task. The Nouveau linux-specific part of
> the code might be small, but the general linux-specific DRM infrastructure is
> not. And things will get worse with e.g. kernel mode setting. The whole
> graphics stack revolution is primarily on Linux, and the very few BSD devels
> are trying their best to keep up.
> 
> If you want it to happen sooner than later (if ever), lend a hand, and come to
> #nouveau and #dri-devel irc channels. The BSD devels there could tell you what
> is needed.
> 

Ok, please excuse my lacking knowledge.
How is 'radeonhd' able to run on so many platforms and why doesn't nouveau?
They apparently don't rely on kernel/os specific code, but how can they achieve
the same goal then?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
