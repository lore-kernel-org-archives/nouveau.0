From: Anssi Hannula <anssi.hannula-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH r2] drm/nv04: fix null pointer dereferences
 of	native_mode
Date: Mon, 24 Aug 2009 02:37:02 +0300
Message-ID: <4A91D29E.7040605@iki.fi>
References: <4A8840D7.5000409@iki.fi> <4A886130.5020005@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A886130.5020005-X3B1VOXEql0@public.gmane.org>
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

Anssi Hannula wrote:
> nv_connector->native_mode is not set when no modes were found for the
> connector, so its existence can't be assumed.
> 
> In nv04_dfp_mode_fixup, reject the mode if GPU scaling is enabled but
> native mode is not known.
> 
> In nv04_dfp_mode_set, use clock value from output_mode (nv_encoder->mode)
> instead of nv_connector->native_mode. If panel scaling is enabled on a
> TMDS display and the display did not have a valid EDID, native_mode is
> NULL.
> 
> In nv04_lvds_dpms and nv04_dfp_restore, refuse to turn on an LVDS panel
> if native mode is not known. While clock is not always required for
> turning panel on, having an LVDS without native mode means something went
> wrong already, so trying to turn panel on only in cases where clock is
> required would yield no added benefit.
> 
> Signed-off-by: Anssi Hannula <anssi.hannula-X3B1VOXEql0@public.gmane.org>
> 
> ---
> 
> Rev2: Use output_mode (&nv_encoder->mode) in nv04_dfp_mode_set; that shortcut
> was just added by Francisco Jerez so it didn't make it into my initial patch
> 
> Please review especially the changes in nv04_dfp_mode_fixup. Previously
> (2 << 24) | (8 << 28) was set in regp->fp_control with dual link TMDS
> panel, even if we were using a single link mode with panel scaling. As I
> didn't know what it is for, I assumed it was a mistake and made it depend
> on the actual output mode (i.e. native_mode with GPU scaling only) instead.
> Someone who knows this stuff should confirm this or fix it in another
> way :)
> 
> This fixes up http://bugs.freedesktop.org/show_bug.cgi?id=23295

Ping?

-- 
Anssi Hannula
