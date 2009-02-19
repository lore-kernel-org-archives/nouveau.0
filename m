From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20006] powerpc64: Black screen using RandR12
Date: Thu, 19 Feb 2009 06:50:15 -0800 (PST)
Message-ID: <20090219145015.50139130057@annarchy.freedesktop.org>
References: <bug-20006-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20006-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20006





--- Comment #31 from bmaass <bmaass-o02PS0xoJP/7u6qtEXMtuoQuADTiUCJX@public.gmane.org>  2009-02-19 06:50:14 PST ---
(In reply to comment #30)
> Created an attachment (id=23087)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=23087) [details]
> Partial fix
> 
> Ok, here's a partial fix, the other part being something wrong with scaling
> modes which I don't presently understand.  To test the fix, apply the patch,
> and to work-around the scaling problem add `Option "ScalingMode" "panel"' to
> the device section of your xorg.conf ("noscale" should work as well as panel,
> "aspect" and "fullscreen" won't).
> 
> Assuming this works and you feel like a new challenge, if booting with the
> monitor on the other dvi port gets an image with randr12 turned off (or even
> with the "nv" driver), feel free to make comparison regdumps of that and we can
> look at fixing it for randr12 :-)

Alright, bear with me here, fresh clone, patch applied, 'Option "ScalingMode"
"panel"'... black as ever. Am I missing something?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
