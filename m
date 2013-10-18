From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: [PATCH] drm/nouveau: avoid null deref on bad arguments to
	nouveau_vma_getmap
Date: Fri, 18 Oct 2013 17:44:45 +0300
Message-ID: <20131018144445.GP2924@reaktio.net>
References: <1377130214-17522-1-git-send-email-imirkin@alum.mit.edu>
	<5215B9E8.5080108@canonical.com>
	<CACAvsv7ygYoM6ZzFdY-Zov0herPMQDERaw6jzj6VuB+p20FcJQ@mail.gmail.com>
	<5226DA41.5060203@canonical.com>
	<20130925144152.GK2924@reaktio.net>
	<CACAvsv6qUEug7=7uRHPm6zpbjmA3Cc-u06VBOq0dU8eiJ-fvmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <CACAvsv6qUEug7=7uRHPm6zpbjmA3Cc-u06VBOq0dU8eiJ-fvmg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Ben Skeggs <skeggsb@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Thu, Sep 26, 2013 at 02:48:49AM +1000, Ben Skeggs wrote:
> >
> > Ben/Maarten: Are you guys planning to take a look at this and submit another patch, or.. ?
> >
> > I tested the two earlier patches from this thread, and they both fixed the problem (hard kernel crash).
> > I'm hoping this bug could be finally solved in the kernel..
>
> I shall be looking at it properly once I'm back from XDC next week.
> 

Any thoughts about the patch? 


-- Pasi

> Thanks,
> Ben.
> 
> >
> > Thanks,
> >
> > -- Pasi
> >
