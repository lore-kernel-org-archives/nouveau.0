From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14597] randr12 failures on 12" powerbooks,
	and workarounds
Date: Sun,  2 Mar 2008 10:01:44 -0800 (PST)
Message-ID: <20080302180144.B19331300F8@annarchy.freedesktop.org>
References: <bug-14597-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14597-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14597





--- Comment #21 from Jacopo <sbriglie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-03-02 10:01:43 PST ---
(In reply to comment #20)
> (In reply to comment #19)
> > Following some work by sbriglie, it now looks like the change in comment 15
> > might be sufficient (with or without the change to reg 0x1588). Testing of this
> > idea welcome :)
> > 
> 
> After some testing I can say that the working code is this
> 
> @@ -2824,11 +2824,17 @@ static void call_lvds_manufacturer_script(ScrnInfoPtr
> pS
>         xf86DrvMsg(pScrn->scrnIndex, X_INFO, "Calling LVDS script %d:\n",
> script
>         nv_idx_port_wr(pScrn, CRTC_INDEX_COLOR, NV_VGA_CRTCX_OWNER,
>                    head ? NV_VGA_CRTCX_OWNER_HEADB : NV_VGA_CRTCX_OWNER_HEADA);
> -       parse_init_table(pScrn, bios, scriptofs, &iexec);
> +       //parse_init_table(pScrn, bios, scriptofs, &iexec);
> 
>         if (script == LVDS_PANEL_OFF)
>                 usleep(off_on_delay * 1000);
>         if (script == LVDS_RESET)
> +               nv32_wr(pScrn, 0x006828b4, 0x72);
> +               //nv32_wr(pScrn, 0x006828b0, 0x02);
> +               nv32_wr(pScrn, 0x006828b4, 0x01);
> +               nv32_wr(pScrn, 0x006828b0, 0x2f);
> +               nv32_wr(pScrn, 0x00001588, 0);  
> +               
>                 link_head_and_output(pScrn, head, dcb_entry);
>  }
> 
> Enabling the second nv32_wr and/or the call to parse_init_table causes the
> usual badness
> 

Of course I forgot the brackets. The correct code is
if (script == LVDS_RESET){
               nv32_wr(pScrn, 0x006828b4, 0x72);
               //nv32_wr(pScrn, 0x006828b0, 0x02);
               nv32_wr(pScrn, 0x006828b4, 0x01);
               nv32_wr(pScrn, 0x006828b0, 0x2f);
               nv32_wr(pScrn, 0x00001588, 0);  

                 link_head_and_output(pScrn, head, dcb_entry);
 }


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
