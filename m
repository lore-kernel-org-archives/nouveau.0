From: "Maarten Maathuis" <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: How to set a different resolution?
Date: Wed, 1 Oct 2008 15:06:24 +0200
Message-ID: <6d4bc9fc0810010606s4e80d9bcv28f051614288daba@mail.gmail.com>
References: <48E297C8.3050803@wpkg.org> <200809301735.51849.mrgrim@gr1m.org>
	<48E30BD3.8010505@wpkg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <48E30BD3.8010505-Nem3ZqsbT/g@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Tomasz Chmielewski <mangoo-Nem3ZqsbT/g@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Oct 1, 2008 at 7:34 AM, Tomasz Chmielewski <mangoo-Nem3ZqsbT/g@public.gmane.org> wrote:
> Michael Kreitzer schrieb:
>> Tomasz,
>>
>> It sounds to me like what may be happening is the video card is doing the
>> scaling instead of the monitor.  This is evidenced by the fact that the
>> resolution does change, but the LCD still sees the native resolution coming
>> in. This shouldn't affect dual head, however.
>>
>> I'm not sure how to change this. It's also possible your monitor needs this.
>> This should, however, give you a starting point on where to look for how to
>> correct this.
>
> With nvidia or nv driver though, the monitor sees the correct resolution
> (I can't use dual head with nv, though).
>
>
> --
> Tomasz Chmielewski
> http://wpkg.org
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

There should be a SCALING_MODE property, which can be set to
"fullscreen", the default however (iirc) is "aspect" scaling which may
leave top or bottom bars (but not both).

Maarten.
