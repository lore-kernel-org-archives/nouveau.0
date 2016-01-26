From: Kamal Mostafa <kamal@canonical.com>
Subject: Re: Recommendation for cherry-pick between 3.12 and 4.2:
 0a363e85cdaf
Date: Tue, 26 Jan 2016 10:14:47 -0800
Message-ID: <1453832087.18485.7.camel@fourier>
References: <CAKb7UvhmjD5HfNRDwR8phUhFwYhGS0QPMMucnNc+YWZUb5M-dg@mail.gmail.com>
	 <569E0E53.4010201@suse.cz>
	 <CAKb7UvgEo-skaxh8nhHQ8ySJQfO157BEPpOPj2C2e-48L1WCkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAKb7UvgEo-skaxh8nhHQ8ySJQfO157BEPpOPj2C2e-48L1WCkA@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: Jiri Slaby <jslaby@suse.cz>, stable <stable@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Tue, 2016-01-19 at 06:03 -0500, Ilia Mirkin wrote:
> > On 01/17/2016, 08:28 PM, Ilia Mirkin wrote:
> >> I'd like to recommend backporting this commit:
> >>
> >> commit 0a363e85cdafbceeee6a49b91c604d0d4d070dc7
> >> Author: Hans de Goede <hdegoede@redhat.com>
> >> Date:   Thu Jul 23 17:20:12 2015 +0200
> >>
> >>     drm/nouveau/nv46: Change mc subdev oclass from nv44 to nv4c
> >>
[...]
> In case of tl;dr, my recommendation is to backport into 3.13:
> 
> fa8c9ac72fe0bcdf5bc7cc84e85cc2a1af53f9fd
> 4761703bd04bbdf56396d264903cc5a1fdcb3c01
> 0a363e85cdafbceeee6a49b91c604d0d4d070dc7

Thanks Ilia -- I'll queue up those three for 3.13-stable, and just the
last one for 3.19-stable and 4.2-stable.

 -Kamal


> In that order. This should avoid buggy MSI on the nv4x IGPs as well as
> NV46 (G72).
> 
> Starting with v3.14, you should only need
> 0a363e85cdafbceeee6a49b91c604d0d4d070dc7, since presumably
> 4761703bd04bbdf56396d264903cc5a1fdcb3c01 will have already been
> backported.
> 
> Cheers,
> 
>   -ilia
> --
> To unsubscribe from this list: send the line "unsubscribe stable" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
