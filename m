From: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/9] drm/vblank: Add vblank works
Date: Tue, 14 Apr 2020 14:17:11 -0400
Message-ID: <20200414181711.GO60335@mtj.duckdns.org>
References: <20200318004159.235623-1-lyude@redhat.com>
 <20200318004159.235623-2-lyude@redhat.com>
 <20200318134657.GV2363188@phenom.ffwll.local>
 <e4fb0c39ec024d60587e5e1e70b171b99eb537f4.camel@redhat.com>
 <faf63d8a9ed23c16af69762f59d0dca6b2bf085f.camel@redhat.com>
 <96cb912809f99d04cd5cdd46c77b66b8c1163380.camel@redhat.com>
 <20200413204243.GL60335@mtj.duckdns.org>
 <a2d9da054ace3f0ff59373c5a6252f25e1c3df4b.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a2d9da054ace3f0ff59373c5a6252f25e1c3df4b.camel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hello,

On Tue, Apr 14, 2020 at 12:52:51PM -0400, Lyude Paul wrote:
> Hi, thanks for the response! And yes-I think this would actually be perfect
> for what we need, I guess one question I might as well ask since I've got you
> here: would patches to expose an unlocked version of kthread_queue_worker() be
> accepted? With something like that I should be able to just reuse the
> delayed_work_list and spinlocks that come with kthread_worker which would make
> the vblank works implementation a bit easier

Difficult to tell w/o looking at the code but if technically reasonable and
justified, I don't see a reason why something like that couldn't be accepted.
That said, whatever gain coming from sharing an inner lock like that usually
is miniscule and API and logic simplicity often easily outweighs.

Thanks.

-- 
tejun
