From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: TV-Out on a GeForce 2MX supported?
Date: Wed, 5 Mar 2014 00:40:34 -0500
Message-ID: <CAKb7Uvj2FKoRt2O6YqiamgL=svZqmxjxoqdxySN3Lidu+bWxsQ@mail.gmail.com>
References: <20140303224123.GA5720@reliance.ac-net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140303224123.GA5720-0i3IwDS6Bd4yxn3+5HPDWA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: fehmarn-rund-6WyM7rXn5Gg@public.gmane.org
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, Mar 3, 2014 at 5:41 PM, Nils Krafft <fehmarn-rund-6WyM7rXn5Gg@public.gmane.org> wrote:
> Hello,
>
> I have here a GeForce 2MX (NV10) with a Brooktree BT869 chip for the
> TV-Out.

http://nouveau.freedesktop.org/wiki/FeatureMatrix/

See note #4 -- nv0x-nv2x (nv17-nv19 excluded) need an external,
third-party manufactured TV encoder. Only some Chrontel branded chips
are currently supported.

> shows me only the DVI connection (in fact it's VGA, not DVI), but not
> the S-Video connection. If not supported, is this planned for future
> versions?

The relevant hardware is not easily available, nor is hardware to
consume s-video/composite connections. This sort of thing is probably
only going to be supported if you make it happen. If you're
interested, the relevant source file is
drivers/gpu/drm/nouveau/dispnv04/tvnv04.c, and you'd have to add
something in drivers/gpu/drm/i2c. BT* chips are usually easy to find
docs for, and some of the additional details can probably be worked
out from mmiotraces, assuming you can find a kernel that the blob
driver will load on.

  -ilia
