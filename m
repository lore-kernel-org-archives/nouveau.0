From: Willy Tarreau <w@1wt.eu>
Subject: Re: Recommendation for cherry-pick between 3.12 and 4.2: 0a363e85cdaf
Date: Tue, 1 Mar 2016 07:19:32 +0100
Message-ID: <20160301061932.GA17676@1wt.eu>
References: <CAKb7UvhmjD5HfNRDwR8phUhFwYhGS0QPMMucnNc+YWZUb5M-dg@mail.gmail.com> <20160301055843.GC3200@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160301055843.GC3200@kroah.com>
Sender: stable-owner@vger.kernel.org
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ilia Mirkin <imirkin@alum.mit.edu>, stable <stable@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Tue, Mar 01, 2016 at 05:58:44AM +0000, Greg KH wrote:
> On Sun, Jan 17, 2016 at 02:28:13PM -0500, Ilia Mirkin wrote:
> > Hello,
> > 
> > I'd like to recommend backporting this commit:
> > 
> > commit 0a363e85cdafbceeee6a49b91c604d0d4d070dc7
> > Author: Hans de Goede <hdegoede@redhat.com>
> > Date:   Thu Jul 23 17:20:12 2015 +0200
> > 
> >     drm/nouveau/nv46: Change mc subdev oclass from nv44 to nv4c
> 
> It doesn't apply to 3.14-stable at all :(

I just checked, the path to the file changed, in 3.14 you need to
replace "/nvkm/" with "/core/". However given that all entries in
the switch/case are nearly identical, there are great chances for
this patch to be applied at the wrong positioni (it targets 0x46),
I guess someone who owns this hardware should provide the backport
after testing it to ensure it applies at the right position and
really works.

Willy
