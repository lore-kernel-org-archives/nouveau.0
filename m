From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Recommendation for cherry-pick between 3.12 and 4.2: 0a363e85cdaf
Date: Tue, 01 Mar 2016 05:58:44 +0000
Message-ID: <20160301055843.GC3200@kroah.com>
References: <CAKb7UvhmjD5HfNRDwR8phUhFwYhGS0QPMMucnNc+YWZUb5M-dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAKb7UvhmjD5HfNRDwR8phUhFwYhGS0QPMMucnNc+YWZUb5M-dg@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: stable <stable@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Sun, Jan 17, 2016 at 02:28:13PM -0500, Ilia Mirkin wrote:
> Hello,
> 
> I'd like to recommend backporting this commit:
> 
> commit 0a363e85cdafbceeee6a49b91c604d0d4d070dc7
> Author: Hans de Goede <hdegoede@redhat.com>
> Date:   Thu Jul 23 17:20:12 2015 +0200
> 
>     drm/nouveau/nv46: Change mc subdev oclass from nv44 to nv4c

It doesn't apply to 3.14-stable at all :(
