From: Didier Spaier <didier.spaier-GqzDj6/B2j8@public.gmane.org>
Subject: Re: Blank screen at startup (conflict with VESA VGA)
Date: Tue, 06 Apr 2010 20:43:04 +0200
Message-ID: <4BBB80B8.5000806@epsm.fr>
References: <4BBA4F3C.9070606@epsm.fr> <20100405214559.GA4230@joi.lan>
	<4BBAF07E.9070005@epsm.fr> <20100406172019.GA2744@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100406172019.GA2744-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Marcin Slusarz wrote:
> On Tue, Apr 06, 2010 at 10:27:42AM +0200, Didier Spaier wrote:
>> Thansk for your answer, kernel logs are attached.
>>
> 
> Can you check attached patch? It's a quick hack to kick vesa before
> we initialize the hardware.
> 
> Marcin
> 
I tried it on a vanilla Linus' 2.6.33.1 kernel and on a recent 2.6 Nouveau kernel pulled from git.

In both case switch from VESA to nouveaufb works well during startup, thanks ;)

Will this patch be applied to mainstream ?

Best regards,

Didier
