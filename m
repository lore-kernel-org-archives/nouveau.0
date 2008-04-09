From: "Stephane Marchesin" <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: GoForce 5500 Driver in Toshiba Portege G900
Date: Wed, 9 Apr 2008 13:30:44 +0200
Message-ID: <6a89f9d50804090430j644742e7r816ad5ad53b76c27@mail.gmail.com>
References: <001901c898dd$fcae39d0$0301a8c0@Arseniy>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <001901c898dd$fcae39d0$0301a8c0@Arseniy>
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
To: Arseniy Nikolaev2 <arsnik2-cmBhpYW9OiY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 4/7/08, Arseniy Nikolaev2 <arsnik2-cmBhpYW9OiY@public.gmane.org> wrote:
>
>
>
> Hello, community.

Hello,

>
> Several months ago Toshiba Inc. released a new communicator - "Toshiba
> Port=E9g=E9 G900". All device's features are greate, but in practice thin=
gs are
> going another way: communicator is really SLOW. Toshiba users have found
> that G900 is using nVidia GoForce 5500 Chip in it and it seems like it's
> working partially, because of an incomplete driver. We have written a
> petition to send to toshiba, and got more than 1200 signatures from Toshi=
ba
> users. So when we sent it, we got this reply:
>
>
>
> Thank you for purchasing Toshiba Portage G900.
> We regret to inform you that G900 partially supports the
> functions which GoForce provides,
> though we are aware that GoForce itself supports various
> functions as you mentioned.
> That is the G900 product specifications.
> We acknowldge your comment and would like to reflect it to
> our future product
> to enhance our product line-up.
>
>
>
> Sincerely Yours,
>
>
>
> Mobile Communications Company
> Toshiba Corporation
>
>
>
> As you can see, it looks like Toshiba is not going to support us.
>
>
>
> So, what this all is about:
>
> As we know, you're producing drivers for nVidia video cards. We have the
> next questions:
>
> 1) Is it possible for you to produce a driver for GoForce 5500 Chip which
> will work on our device?
>

As far as I know, the GoForce chips are mostly similar to their
GeForce equivalents (i.e. the GoForce 5500 has similar functionality
to a GeForce 5x00), so in theory a driver is doable for the common
parts (video decoding, 3D) by reusing our code.
However, the issue is mostly that this machine seems to use windows,
while we're working on linux drivers.

> 2) If it is, than can you do this?
>

Well, I don't think we'd do this. However, we have most of the
technical documentation for the GeForce 5x00 chips, so I think someone
with time and a windows mobile DDK could adapt it for the GoForce. You
would need 3 big pieces of code mostly:
- write a windows mobile 2D driver for the chip
- write a gallium frontend for directX
- fix/rewrite/modify our nv30 gallium backend for the GoForce and
windows mobile specifics that will surely come up along the way

That said:
- this is a huge piece of work. We're talking probably 12-24 man-months.
- you would probably drain the battery even quicker then because we
don't know about the specific power saving features of that chip.

> 3) What donations do you want we to make for you?
>

I guess you'll have to find someone to pick up the ball first :)

Stephane
