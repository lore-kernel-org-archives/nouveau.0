From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15949] LVDS-0 has wrapped screen with Randr1.2
Date: Wed, 13 Aug 2008 04:15:09 -0700 (PDT)
Message-ID: <20080813111509.E502C130155@annarchy.freedesktop.org>
References: <bug-15949-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15949-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15949





--- Comment #11 from Joel <joel.stan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-08-13 04:15:08 PST ---
(In reply to comment #10)
> > I then modified xorg.conf to disable randr12, re-started X, there is no
> > wrapping.
> 
> Without a reboot in between, right?

Correct.

> Try changing line ~478, replacing "nVidia" with "VGA compatible controller":
> 
> @@ -475,7 +475,7 @@ We need to look through it to find the smaller region base
> address f8fffc00.
>         if(fgets(line,sizeof(line),fp) == NULL) {  /* if end of file */
>            fatal("Radeon hardware not found in lspci output.\n");
>         }
> -       if(strstr(line,"nVidia") || strstr(line,"nVidia Corp")) {  /* if line
> contains a "radeon" string */
> +       if(strstr(line,"VGA compatible controller") || strstr(line,"nVidia
> Corp")) {  /* if line contains a "radeon"
>            if(skip-- < 1) {
>               break;
>            }


For those who read this later: I had to remove the strstr(line, "nVidia Corp")
from the if too, or else it would incorrectly match on that.

Attachments of the register dumps follow.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
