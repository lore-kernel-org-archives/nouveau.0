From: Karol Herbst <karolherbst@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix LEDS_CLASS=m configuration
Date: Tue, 8 Nov 2016 17:21:39 +0100
Message-ID: <CAEXux-YC7ox=u1bOn3vLE5X1G1Ood=ekgUcBVEAhCu4MfhM9PQ@mail.gmail.com>
References: <20161108135721.2142330-1-arnd@arndb.de> <12373137.2mgsQIhOfV@wuerfel>
 <20161108160701.GC6983@wunner.de> <7299445.oinG8ujhC7@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7299445.oinG8ujhC7@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lukas Wunner <lukas@wunner.de>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

2016-11-08 17:12 GMT+01:00 Arnd Bergmann <arnd@arndb.de>:
> On Tuesday, November 8, 2016 5:07:01 PM CET Lukas Wunner wrote:
>> On Tue, Nov 08, 2016 at 04:52:49PM +0100, Arnd Bergmann wrote:
>> > The underlying problem is that we already have a number of other
>> > symbols that either have "depends on LEDS_CLASS" or
>> > "select LEDS_CLASS". To clean that up properly, we should either
>> > make the symbol itself hidden and only select it from other drivers,
>> > or use "depends on LEDS_CLASS" everywhere.
>> >
>> > Another option is to use the IS_REACHABLE() macro instead of IS_ENABLED()
>> > in the header file, to stub out the calls into the new file, but
>> > that can be a bit confusing.
>>
>> Why don't you just add empty inline stubs for nouveau_led_init / _fini /
>> _suspend / _resume?
>>
>
> That's what I was suggesting:
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_led.h b/drivers/gpu/drm/nouveau/nouveau_led.h
> index 9c9bb6ac938e..bc5f47cb516b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_led.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_led.h
> @@ -35,21 +35,21 @@ struct nouveau_led {
>         struct led_classdev led;
>  };
>
>  static inline struct nouveau_led *
>  nouveau_led(struct drm_device *dev)
>  {
>         return nouveau_drm(dev)->led;
>  }
>
>  /* nouveau_led.c */
> -#if IS_ENABLED(CONFIG_LEDS_CLASS)
> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
>  int  nouveau_led_init(struct drm_device *dev);
>  void nouveau_led_suspend(struct drm_device *dev);
>  void nouveau_led_resume(struct drm_device *dev);
>  void nouveau_led_fini(struct drm_device *dev);
>  #else
>  static inline int  nouveau_led_init(struct drm_device *dev) { return 0; };
>  static inline void nouveau_led_suspend(struct drm_device *dev) { };
>  static inline void nouveau_led_resume(struct drm_device *dev) { };
>  static inline void nouveau_led_fini(struct drm_device *dev) { };
>  #endif
>
> The downside is that now the nouveau_led_init() just won't be called
> if CONFIG_LEDS_CLASS=m and CONFIG_DRM_NOUVEAU=y, which can be
> surprising to users.

yeah, it will. I guess it is fine to force LEDS to y if nouveau is set
to y. The thinks I absolutely dislike is:
1. auto hiding of features I _want_ to have, because I would have to
enable the dependencies first, which is like super annoying if there
are somewhere else
2. preventing me from enabling something, cause the dependency is missing.

We should clarify first if we actually want to enable those features
optionally, because there isn't much of a reason not to enable the
dependencies, except embedded systems. We have a lot more stuff where
we could add things like that: hwmon, debugfs, acpi, compat and maybe
there are even more things

>
>         Arnd
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
