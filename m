From: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Subject: Re: Errors during vdpau mpeg2 decoding
Date: Thu, 04 Sep 2014 07:04:22 +0200
Message-ID: <5407F2D6.9060509@canonical.com>
References: <CAKb7UvjMYmt1y+m_uek6vVjA3cHuPTRKKAEicvK3UgghCLOT0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvjMYmt1y+m_uek6vVjA3cHuPTRKKAEicvK3UgghCLOT0A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hey,

On 04-09-14 05:53, Ilia Mirkin wrote:
> Hi Maarten,
> 
> I'm seeing these prints, which feel like they're accompanied by bad frames:
> 
> 0x7f7fcb29ab70 is not a real ref: -0.011 72712/72709  0% 35%  1.0% 0 0
> 
> This comes from
> 
>       if (dec->refs[idx].vidbuf != refs[i]) {
>          debug_printf("%p is not a real ref\n", refs[i]);
>          // FIXME: Maybe do m2mf copy here if a application really
> depends on it?
>          continue;
>       }
> 
> Can you explain what this means, and what the fixme is referring to?
I keep internal track of the reference frames that were decoded last. If vidbuf in the internal state is not equal to the ref here it means something else got decoded in that slot and we no longer have the intermediary frame used for decoding.

~Maarten
