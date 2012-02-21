From: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Subject: Re: [Patches][nouveau/kms]: Precise Vblank and pageflip
	timestamping v2
Date: Tue, 21 Feb 2012 20:04:33 +0100
Message-ID: <F8CDD288-6434-4FDA-BC09-B7FB39E38650@tuebingen.mpg.de>
References: <[Patches][nouveau/kms]: Precise Vblank and pageflip timestamping
	v2> <1329722667-2240-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1329722667-2240-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Feb 20, 2012, at 8:24 AM, Lucas Stach wrote:

> Just updated versions of the patches send by Mario Kleiner. This  
> ones are
> rebased on top of the nouveau tree and updated according to the review
> feedback.
>
> This time hopefully the right ones.
>
> Regards,
> Lucas
>


Ben, thanks for the feedback. I've resteted the v2 of Lucas new  
reworked and rebased patches, everything fine and precise wrt. to  
timing precision.

For my personal education: Is my understanding correct that these  
registers are basically "double-buffered", and the  
NV50_PDISPLAY_CRTC_C macro accesses the current state, whereas the  
NV50_PDISPLAY_CRTC_P macro provides/sets the programmed values that  
will be latched into the _C registers at some later time, e.g., modeset?

thanks,
-mario
