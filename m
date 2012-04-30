From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 4/4] drm/nouveau: gpu lockup recovery
Date: Mon, 30 Apr 2012 11:47:46 +0200
Message-ID: <4F9E5FC2.6030703@free.fr>
References: <1335388836-13127-4-git-send-email-marcin.slusarz@gmail.com>
	<20120428145615.GB10116@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20120428145615.GB10116-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Le 28/04/2012 16:56, Marcin Slusarz a =E9crit :
> On Wed, Apr 25, 2012 at 11:20:36PM +0200, Marcin Slusarz wrote:
>> Overall idea:
>> Detect lockups by watching for timeouts (vm flush / fence), return -EIOs,
>> handle them at ioctl level, reset the GPU and repeat last ioctl.
>>
>> GPU reset is done by doing suspend / resume cycle with few tweaks:
>> - CPU-only bo eviction
>> - ignoring vm flush / fence timeouts
>> - shortening waits
>>
>> Signed-off-by: Marcin Slusarz<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
> Martin,
>
> I'm wondering how below patch (which builds upon the above) affects
> reclocking stability. I can't test it on my card, because it has only
> one performance level. Can you test it on yours?
Hi Marcin,

I was away from my computers for a few days. I'll test this patch tonight.

Martin
