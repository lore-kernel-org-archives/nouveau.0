From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25410] Screen Turns Off On Resume (Geforce GT 230M)
Date: Sun, 13 Dec 2009 19:17:25 -0800 (PST)
Message-ID: <20091214031725.D37B1130094@annarchy.freedesktop.org>
References: <bug-25410-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25410-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25410





--- Comment #10 from Manuel Garcia <manuel.gwolff-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-12-13 19:17:24 PST ---
I have been using the latest git release for about half an hour now and it has
not frozen yet. However, there are some screen artifacts in the top left
corner, it seems like parts from other sections of the screen. 
Or if I run "find" I will see a black rectangle and yellow artifacts.
I have not seen anything weird in the logs, except maybe this:

Dec 13 22:07:55 [kernel] [  958.740892] [drm] nouveau 0000:01:00.0: DCB I2C
port type 6 unknown
Dec 13 22:07:55 [kernel] [  958.788065] [drm] nouveau 0000:01:00.0: DCB I2C
port type 6 unknown


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
