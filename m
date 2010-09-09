From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29810] Blank screen on nouveau module load
Date: Thu,  9 Sep 2010 05:44:53 -0700 (PDT)
Message-ID: <20100909124453.F1C571300F8@annarchy.freedesktop.org>
References: <bug-29810-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29810-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29810

Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #38 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-09-09 05:44:53 PDT ---
(In reply to comment #37)
> (In reply to comment #36)
> > (In reply to comment #35)
> > > Created an attachment (id=38563)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=38563)
[details]
> > > fifth demsg output
> > > 
> > > Here you are. Debian kernel, video=nvidiafb:off argument. Your last patch only.
> > 
> > > [   15.741618] 216: NVDA,Display-A NVDA,Display-A c27813bc 0 1
> >                                                               ^^^
> > 
> > Man, that definitely means you have "nv11_emac_kms_2.patch" applied, try "git
> > reset --hard" to get a clean tree before going forward.
> 
> Hmm yes, something close to that, sorry. I reverted the patch by copying back
> the older nv04_crtc.c file and as it was older than the nv04_crtc.o the
> compiler did not recompile the object file. I did it again and the system
> started fine. It chose some funny 158x60 text mode on nouveau module load with
> tiny letters. 
> 
> So the configuration is which was intended last time. Debian experimental
> kernel, video=nvidiafb:off argument. Your last patch only.
> 
> Do you need any kernel or register dumps?

No, thanks, I've pushed the fix to master. Feel free to open a new bug about
the video crash you said you are seeing.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
