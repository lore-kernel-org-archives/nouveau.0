From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25938] black screen on the iMac powerpc using nouveau
Date: Thu, 14 Jan 2010 06:13:11 -0800 (PST)
Message-ID: <20100114141311.C3EDD13006F@annarchy.freedesktop.org>
References: <bug-25938-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25938-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25938





--- Comment #7 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2010-01-14 06:13:11 PST ---
(In reply to comment #6)
> From: Andrea Tacconi <tacconet-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org>
> 
> Subject: [PATCH] drm/nouveau: add NV18 device id to
> call_lvds_manufacturer_script 
> 
> This fixes imac black screen (NV18 card)  
> 
> Signed-off-by: Andrea Tacconi <tacconet-VGgt2q2+T+FeoWH0uzbU5w@public.gmane.org>
> ---
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c
> b/drivers/gpu/drm/nouveau/nouveau_bios.c
> index ba14397..e24f2a8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bios.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
> @@ -3196,7 +3196,7 @@ static int call_lvds_manufacturer_script(struct
> drm_device *dev, struct dcb_entr
>         }
>  #ifdef __powerpc__
>         /* Powerbook specific quirks */
> -       if (script == LVDS_RESET && ((dev->pci_device & 0xffff) == 0x0179 ||
> (dev->pci_device & 0xffff) == 0x0329))
> +       if (script == LVDS_RESET && ((dev->pci_device & 0xffff) == 0x0179 ||
> (dev->pci_device & 0xffff) == 0x0189 || (dev->pci_device & 0xffff) == 0x0329))
>                 nv_write_tmds(dev, dcbent->or, 0, 0x02, 0x72);
>         if ((dev->pci_device & 0xffff) == 0x0179 || (dev->pci_device & 0xffff)
> == 0x0189 || (dev->pci_device & 0xffff) == 0x0329) {
>                 if (script == LVDS_PANEL_ON) {
> 

Thanks, pushed, but please, next time you send a patch use the mailing list,
bugzilla adds some gratuitous line breaks and I had to do it manually.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
