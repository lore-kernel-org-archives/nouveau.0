From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40747] The new nouveau kernel module fails to use my
 monitor's native resolution
Date: Sat, 10 Sep 2011 07:09:26 -0700 (PDT)
Message-ID: <20110910140926.DFBD01300DA@annarchy.freedesktop.org>
References: <bug-40747-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40747-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40747

--- Comment #6 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2011-09-10 07:09:26 PDT ---
(In reply to comment #4)
> > 2.6.32 kernel allowed to use higher resolution because it didn't take into
> > account hardware limitations - NV44's tmds maximum pixel clock is 155MHz and
> > 1600x1200 needs 162MHz.
> 
> Hmm... I must admit I had no idea of such a limitation.  And I've had this
> machine for 5 years or so, now.  I've always used it at 1600x1200.  At the
> beginning, I used it at that resolution via VGA rather than DVI (not sure if
> that tmds limit applies to VGA),

No, as Marcin said that limit only applies to your TMDS encoder.

> but the nvidia driver was also happy to set it to 1600x1200 over DVI

The nvidia binary driver probably doesn't use your monitor's native mode
either, but rather a reduced-blanking mode of the same resolution. To make
nouveau do the same for the kernel framebuffer use something like
"video=DVI-D-1:1600x1200MR".

> (tho the nv driver always limited itself to 1280x1024
> over DVI, which is why I used VGA until nouveau matured).  And ever since
> nouveau's kernel module started to work, I've used it for 1600x1200 over DVI.
> 
> I must say I'm shocked that a graphics card of the 21st century would not be
> able to go up to 1600x1200.  Hell, my old Matrox Millenium II went up to
> 1800x1400 without complaining, more than 15 years ago.  Are you *really* sure
> of this 155 limit?
> 
Pretty much. If you want to be 100% sure just try to get the nvidia blob to set
a mode over the limit.

> So I guess I have 2 options:
> - find a way to convince nouveau to go past this limit.  Could we get an option
>   to get back the pre-2.6.37 behavior of limiting the tmds to 165?
> - find a way to tell nouveau to use a modeline which gives me 1600x1200 but
>   without the annoying "non optimal mode" warning on my monitor.
>   Is there a way to get finer control on the modeline than "video=NNNxMMM"?
> 
> BTW, the 3.0.0-1 log shows that providing a "video=1600x1200" argument
> convinces nouveau to use 1600x1200 and while it doesn't use the native modeline
> (at 162Mhz) it does use a modeline at more than 155MHz:
> 
> [    7.316860] [drm:drm_mode_debug_printmodeline], Modeline 48:"1600x1200" 0
> 160961 1600 1704 1880 2160 1200 1201 1204 1242 0x0 0x6
> 
> Not sure where that modeline comes from, nor why nouveau seems to ignore the
> 155MHz limit for it.

The fact that it's ignored is probably a bug of the common KMS layer.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
