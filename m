From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH 1/3] drm/nouveau: fix vblank interrupt being called before
	event is setup
Date: Tue, 30 Jul 2013 16:13:46 +1000
Message-ID: <CACAvsv5J7gYqMVuhzwVT3xPwwAdZD5hM=mDWHKhFVd-9mc6-0A@mail.gmail.com>
References: <51EE8888.4030302@canonical.com>
	<CACAvsv5enVEYL1_9qMN1+8qfbjiv4rQFhCanFvbK46bJpL_4Dg@mail.gmail.com>
	<51F758BA.3080001@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <51F758BA.3080001@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jul 30, 2013 at 4:10 PM, Maarten Lankhorst
<maarten.lankhorst@canonical.com> wrote:
> Op 30-07-13 04:42, Ben Skeggs schreef:
>> On Tue, Jul 23, 2013 at 11:43 PM, Maarten Lankhorst
>> <maarten.lankhorst@canonical.com> wrote:
>>> Sort of fixes mmiotrace for me again, I could sear I sent a similar patch before
>>> the rework to event interface, so I guess it got reintroduced.
>> I don't know how/why you think this fixes anything.  The interrupt
>> handler can't possibly be called until after priv->base.vblank has
>> been initialised...
>>
>> Seriously, go look, the subdev interrupt handler pointer isn't filled
>> in (and can't be) until after nouveau_disp_create() has been called,
>> and nouveau_disp_create() initialises priv->base.vblank before it
>> returns...
>>
> There's also a disp_dtor function right above it and without a smp_wmb
> the writes could still be reordered in the constructor. O:-) A spinlock would
> be needed to make sure that no interrupt is in process if you set intr to null
> before destroying vblank event, though.
>
> I can probably try to get the oops again indicating that priv->base.vblank was null in the interrupt handler if you want,
> iirc it happened reliably during mmiotracing.
It would've had to have happened during a module unload in that case,
I can't see how else it could've possibly happened.

The destructor case is valid though, but not really a critical issue,
so I'd rather find a better solution than these hacked checks :)  I'll
add it to the list...

Ben.

>
> ~Maarten
