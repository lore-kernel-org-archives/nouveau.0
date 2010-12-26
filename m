From: Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Kernel patch: validate nouveau_channel_get id argument
Date: Sun, 26 Dec 2010 11:37:54 +0100
Message-ID: <AANLkTin54dTRksN8JfThwS7-zi3Na+j=HdEfyxm=tav1@mail.gmail.com>
References: <AANLkTikRCm19--tRgjAJqcLgb1f_hWcWJpRvgAqGKfQw@mail.gmail.com>
	<87r5d6yngq.fsf@riseup.net>
	<AANLkTi=cy3Mm4U3zk6-6WXBCPJXqyh4Q8SV_UOBQFNbU@mail.gmail.com>
	<AANLkTikQP2DtprBkFr0z1q5vdb=FwDLc5R-Zeuv7ypz1@mail.gmail.com>
	<87sjxlwvjr.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <87sjxlwvjr.fsf-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

For my culture, why did you not changed the type to uint32_t like in
my original patch ?
Also looking at include/drm/nouveau_drm.h, I see some inconsistant
type for channel in ioctls structures ?

2010/12/25 Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>:
> Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:
>
>> Second try ^^ I'm not used at all at preparing patch for kernel
>
> Thanks. I've pushed it with a couple of minor fixes.
>
