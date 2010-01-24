From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26188] [regression] Some strange things with latest
	git on NV31
Date: Sun, 24 Jan 2010 04:01:55 -0800 (PST)
Message-ID: <20100124120155.731DC1300BA@annarchy.freedesktop.org>
References: <bug-26188-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26188-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26188





--- Comment #2 from Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>  2010-01-24 04:01:53 PST ---
Created an attachment (id=32791)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=32791)
Xorg.0.log with 3D

(In reply to comment #1)
> Are you sure you are using Mesa's libGL and not nvidia's one ?
> 

Yes, I am really sure that I am using Mesa's libGL.
(As nouveau packager for openSUSE I can say it...)

Here is an example how Kubrick looks like when 3D is enabled :

http://www.freeimagehosting.net/uploads/1d696cbd62.png

(There should be at least 1 cube with a black background -> shown is the window
which was previously "above" it [Konqueror]...)

A Xorg.0.log with 3D enabled is attached...

Shall we assign this bug to Mesa?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
