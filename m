From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24996] Wrong display resolution in X,
 "windowed" console. FX 5600 XT
Date: Wed, 11 Nov 2009 12:18:02 -0800 (PST)
Message-ID: <20091111201802.4FF4F1300DF@annarchy.freedesktop.org>
References: <bug-24996-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24996-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24996





--- Comment #5 from Simon Siemonsma <simon-ox55uKOtYtiZyCGURLKNQw@public.gmane.org>  2009-11-11 12:18:01 PST ---
(In reply to comment #0)
> Created an attachment (id=31062)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31062) [details]
> Dmesg
> 
> I'm getting 1024x768 display resolution in X, even though my monitors native is
> 1248x1024. When using console, it doesn't fill the whole screen it is
> "windowed" in corner.
> I'm using ArchLinux with latest git build of xf86-video-nouveau and this
> http://www.archlinux.org/packages/extra/i686/nouveau-drm/ nouveau-drm package.
> Using or not using fix_resolution_detection.patch doesn't change anything
> (superficially). I have enabled kms. Without it i had artifacts in different
> programs.
> I'll add dmesg and xorg.log.
> 

I have exactly the same problem. Only I have a NV43 video chip.
I'm using Gentoo amd64. Nouveau is compiled into the kernel.
without KMS set everything looks fine.
With KMS set as described by the original poster.
No other differences in the kernel configuration.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
