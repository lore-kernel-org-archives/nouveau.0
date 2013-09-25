From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH] drm/nouveau: avoid null deref on bad arguments to
	nouveau_vma_getmap
Date: Thu, 26 Sep 2013 02:48:49 +1000
Message-ID: <CACAvsv6qUEug7=7uRHPm6zpbjmA3Cc-u06VBOq0dU8eiJ-fvmg@mail.gmail.com>
References: <1377130214-17522-1-git-send-email-imirkin@alum.mit.edu>
	<5215B9E8.5080108@canonical.com>
	<CACAvsv7ygYoM6ZzFdY-Zov0herPMQDERaw6jzj6VuB+p20FcJQ@mail.gmail.com>
	<5226DA41.5060203@canonical.com>
	<20130925144152.GK2924@reaktio.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <20130925144152.GK2924@reaktio.net>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: =?ISO-8859-1?Q?Pasi_K=E4rkk=E4inen?= <pasik@iki.fi>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Thu, Sep 26, 2013 at 12:41 AM, Pasi K=E4rkk=E4inen <pasik@iki.fi> wrote:
> Hello,
>
> On Wed, Sep 04, 2013 at 08:59:13AM +0200, Maarten Lankhorst wrote:
>> Op 04-09-13 05:41, Ben Skeggs schreef:
>> > On Thu, Aug 22, 2013 at 5:12 PM, Maarten Lankhorst
>> > <maarten.lankhorst@canonical.com> wrote:
>> >> Op 22-08-13 02:10, Ilia Mirkin schreef:
>> >>> The code expects non-VRAM mem nodes to have a pages list. If that's =
not
>> >>> set, it will do a null deref down the line. Warn on that condition a=
nd
>> >>> return an error.
>> >>>
>> >>> See https://bugs.freedesktop.org/show_bug.cgi?id=3D64774
>> >>>
>> >>> Reported-by: Pasi K=E4rkk=E4inen <pasik@iki.fi>
>> >>> Tested-by: Pasi K=E4rkk=E4inen <pasik@iki.fi>
>> >>> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
>> >>> Cc: <stable@vger.kernel.org> # 3.8+
>> >>> ---
>> >>>
>> >>> I don't exactly understand what's going on, but this is just a
>> >>> straightforward way to avoid a null deref that you see happens in the
>> >>> bug. I haven't figured out the root cause of this, but it's getting
>> >>> well into the "I have no idea how TTM works" space. However this see=
ms
>> >>> like a bit of defensive programming -- nouveau_vm_map_sg will pass
>> >>> node->pages as a list down, which will be dereferenced by
>> >>> nvc0_vm_map_sg. Perhaps the other arguments should make that
>> >>> dereferencing not happen, but it definitely was happening here, as y=
ou
>> >>> can see in the bug.
>> >>>
>> >>> Ben/Maarten, I'll let you judge whether this check is appropriate,
>> >>> since like I hope I was able to convey above, I'm just not really su=
re :)
>> >> Not it really isn't appropriate..
>> >>
>> >> You'd have to call call nouveau_vm_map_sg_table instead, the only pla=
ce that doesn't handle that correctly
>> >> is where it's not expected to be called.
>> >>
>> >> Here, have a completely untested patch to fix things...
>> >>
>> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/=
drm/nouveau/nouveau_display.c
>> >> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
>> >> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
>> >> @@ -138,17 +143,26 @@ nouveau_user_framebuffer_create(struct drm_devi=
ce *dev,
>> >>  {
>> >>         struct nouveau_framebuffer *nouveau_fb;
>> >>         struct drm_gem_object *gem;
>> >> +       struct nouveau_bo *nvbo;
>> >>         int ret =3D -ENOMEM;
>> >>
>> >>         gem =3D drm_gem_object_lookup(dev, file_priv, mode_cmd->handl=
es[0]);
>> >>         if (!gem)
>> >>                 return ERR_PTR(-ENOENT);
>> >>
>> >> +       nvbo =3D nouveau_gem_object(gem);
>> >> +       if (!(nvbo->valid_domains & NOUVEAU_GEM_DOMAIN_VRAM)) {
>> >> +               nv_warn(nouveau_drm(dev), "Trying to create a fb in v=
ram with"
>> >> +                       " valid_domains=3D%08x\n", nvbo->valid_domain=
s);
>> >> +               ret =3D -EINVAL;
>> >> +               goto err_unref;
>> >> +       }
>> >> +
>> > Definitely the right idea, we can't handle this case right now.
>> > However, we may someday want/need to be able to scan out of system
>> > memory, so this is the wrong place.
>> >
>> > I suspect the correct thing to do (which'll also handle the
>> > "defensive" part) is to bail in nouveau_bo_move() on attempts to move
>> > a DMA-BUF backed object into VRAM.
>> >
>> > Sound OK?
>> >
>> If it has a WARN_ON or something that would be ok, I didn't find any oth=
er places that attempt to move buffers to VRAM though, so it's probably har=
mless.
>>
>
> Ben/Maarten: Are you guys planning to take a look at this and submit anot=
her patch, or.. ?
>
> I tested the two earlier patches from this thread, and they both fixed th=
e problem (hard kernel crash).
> I'm hoping this bug could be finally solved in the kernel..
I shall be looking at it properly once I'm back from XDC next week.

Thanks,
Ben.

>
> Thanks,
>
> -- Pasi
>
