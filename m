From: Jerome Glisse <jglisse@redhat.com>
Subject: Re: [PATCH] drm/nouveau/svm: Convert to use hmm_range_fault()
Date: Mon, 17 Jun 2019 15:54:25 -0400
Message-ID: <20190617195425.GA4085@redhat.com>
References: <1558378918-25279-1-git-send-email-jrdr.linux@gmail.com>
 <CAFqt6zYmL2P9w0Z4yfPtB=ftiy-H6-_beYsXJq-nD9T5OAw6Dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFqt6zYmL2P9w0Z4yfPtB=ftiy-H6-_beYsXJq-nD9T5OAw6Dg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Souptick Joarder <jrdr.linux@gmail.com>
Cc: bskeggs@redhat.com, airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>, jasojgg@ziepe.ca, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Sat, Jun 08, 2019 at 12:14:50AM +0530, Souptick Joarder wrote:
> Hi Jason,
> 
> On Tue, May 21, 2019 at 12:27 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
> >
> > Convert to use hmm_range_fault().
> >
> > Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
> 
> Would you like to take it through your new hmm tree or do I
> need to resend it ?

This patch is wrong as the API is different between the two see what
is in hmm.h to see the differences between hmm_vma_fault() hmm_range_fault()
a simple rename break things.

> 
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_svm.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> > index 93ed43c..8d56bd6 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> > @@ -649,7 +649,7 @@ struct nouveau_svmm {
> >                 range.values = nouveau_svm_pfn_values;
> >                 range.pfn_shift = NVIF_VMM_PFNMAP_V0_ADDR_SHIFT;
> >  again:
> > -               ret = hmm_vma_fault(&range, true);
> > +               ret = hmm_range_fault(&range, true);
> >                 if (ret == 0) {
> >                         mutex_lock(&svmm->mutex);
> >                         if (!hmm_vma_range_done(&range)) {
> > --
> > 1.9.1
> >
