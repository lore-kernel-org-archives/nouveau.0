From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23792] Getting inverted colors after having launched
 Virtualbox with Nouveau driver
Date: Sun, 27 Sep 2009 04:47:15 -0700 (PDT)
Message-ID: <20090927114715.CE779130058@annarchy.freedesktop.org>
References: <bug-23792-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23792-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23792





--- Comment #9 from Thomas PEGEOT <thomas.pegeot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-09-27 04:47:15 PST ---
> Were you using the Nouveau Gallium/DRI driver or swrast?
Actually, I've been using the Mesa ebuild from the X11 overlay for a while with
gallium support enabled, as well as Nouveau (VIDEO_CARDS="nouveau)". 
What is swrast? 

> Is you X in 256-color paletted mode? I don't know if we even support that, so
all this is unlikely.
According to xdpyinfo, the default number of colormap cells is 256. Is that
what you want to know ? If i'm wrong, just tell me where i can find this and
i'll tell you. ;)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
