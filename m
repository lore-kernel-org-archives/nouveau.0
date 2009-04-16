From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21186] nouveau very slow with screen size > 1680
Date: Thu, 16 Apr 2009 05:48:19 -0700 (PDT)
Message-ID: <20090416124819.E9D35130016@annarchy.freedesktop.org>
References: <bug-21186-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21186-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=21186





--- Comment #6 from Gaetano Canepa <gaetano.canepa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-04-16 05:48:19 PST ---
(In reply to comment #5)
> 1) 3D acceleration is disabled currently, so glxgears will be much slower than
> the Nvidia driver. That is expected.
> 
> 2) Are you using Compiz or some other window manager with 3D effects? If so,
> please disable them because they will have the same problems as above. In Gnome
> you can usually look in the 'System->Preferences->Appearance->Effects' tab and
> change to 'None' to disable Compiz for example.
> 
> Otherwise I don't see why it should be really slow, I use a similar card and
> have no problems.
> 

Sorry, I'm not using Compiz: it is the first thing I disabled when the driver
started to give me problems!

Do you use a similar or the SAME card? If it is not the same card (3700LE) it
could be simply a bug that exist only on my card. The NVIDIA driver does not
work on my card but works on my NVIDIA at work (that is not a 3700LE).

Can anyone solve the problem for this card!


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
