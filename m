From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: pwr/macros: Stop playing Russian roulette on data
	memory
Date: Tue, 05 Aug 2014 01:32:13 +0200
Message-ID: <53E017FD.5000203@free.fr>
References: <1406992501-23037-1-git-send-email-rspliet@eclipso.eu>
 <CACAvsv6h00+26WK9=VcGokgVzN=e+3Z5DJR1r1--Q5JYFc4bjA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv6h00+26WK9=VcGokgVzN=e+3Z5DJR1r1--Q5JYFc4bjA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org>
Cc: Nouveau Mailinglist <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 05/08/2014 01:26, Ben Skeggs wrote:
> On Sun, Aug 3, 2014 at 1:15 AM, Roy Spliet <rspliet-pPYjZ15w/Xhulxpn9UvDqw@public.gmane.org> wrote:
>> This patch fixes the pwr firmware to play nicely at least on NVA3. Because Martin might send more patches soon, I didn't include a regenerated nvXX.fuc.h. To me it makes more sense if all patches are merged then, and a final patch regenerates the headers in one go. Of course, I did test this patch and found it to work as intended, so feel free to pick up as you please.

Roy is right, I should take the time and send you my ppwr patches. If 
anything, I would like this patch to be merged:

http://cgit.freedesktop.org/~mperes/nouveau/commit/?h=ppwr_rework&id=b0bbe7dc6aefb68c7e305ca160f452db053633e7

> Nice catch :)
>
> Thanks for pointing out that the ucode changes weren't included too, I
> amended the commit when I merged it to include them.
>
> One small note:  If patches are against the kernel rather than the
> nouveau tree, can you include the "drm/nouveau" prefix too? :)

Good to know!
>
> Thanks,
> Ben.
>
>
