From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH][next] drm/nouveau: Use fallthrough pseudo-keyword
Date: Tue, 07 Jul 2020 20:27:12 -0700
Message-ID: <1c37340fba4afb910a37cae43182f6c48302fa28.camel@perches.com>
References: <20200707173628.GA29695@embeddedor>
         <CACAvsv4ahps=4gWwGXwvHFZOTBg1ubW86t3++dN4fAJ6JsBhDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACAvsv4ahps=4gWwGXwvHFZOTBg1ubW86t3++dN4fAJ6JsBhDw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Skeggs <skeggsb@gmail.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Wed, 2020-07-08 at 13:22 +1000, Ben Skeggs wrote:
> On Wed, 8 Jul 2020 at 03:31, Gustavo A. R. Silva <gustavoars@kernel.org> wrote:
> > Replace the existing /* fall through */ comments and its variants with
> > the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> > fall-through markings when it is the case.
> I really like this!  I was not a fan of explicitly marking those with comments.
> 
> Thank you, taken in my tree.
[]
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
[]
> > @@ -932,7 +932,7 @@ nv50_dp_bpc_to_depth(unsigned int bpc)
> >         switch (bpc) {
> >         case  6: return 0x2;
> >         case  8: return 0x5;
> > -       case 10: /* fall-through */
> > +       case 10: fallthrough;

IMO: this comment/fallthrough should be removed instead.
