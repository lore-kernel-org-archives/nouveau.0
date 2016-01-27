From: Luis Henriques <luis.henriques@canonical.com>
Subject: Re: Recommendation for cherry-pick between 3.12 and 4.2: 0a363e85cdaf
Date: Wed, 27 Jan 2016 14:24:09 +0000
Message-ID: <20160127142409.GA1872@charon.olymp>
References: <CAKb7UvhmjD5HfNRDwR8phUhFwYhGS0QPMMucnNc+YWZUb5M-dg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKb7UvhmjD5HfNRDwR8phUhFwYhGS0QPMMucnNc+YWZUb5M-dg@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: stable <stable@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Sun, Jan 17, 2016 at 02:28:13PM -0500, Ilia Mirkin wrote:
> Hello,
>=20
> I'd like to recommend backporting this commit:
>=20
> commit 0a363e85cdafbceeee6a49b91c604d0d4d070dc7
> Author: Hans de Goede <hdegoede@redhat.com>
> Date:   Thu Jul 23 17:20:12 2015 +0200
>=20
>     drm/nouveau/nv46: Change mc subdev oclass from nv44 to nv4c
>=20
> This disables MSI by default on G72 (NV46) devices where it's
> apparently a bit buggy. We have a later patch which turns MSI back on
> with a quirk, but it isn't extremely necessary for these devices, and
> disabling (or, rather, not enabling) MSI is a pretty safe thing to do=
=2E
>=20
> The patch went upstream in 4.3-rc1, however I believe that there are
> still a number of kernels between 3.12 (where MSI was first enabled b=
y
> default - commit a27e56996) and 4.2 (inclusive) which are still being
> maintained. To those maintainers, please consider including this in
> your trees.
>=20

Thank you Ilia, I'm queuing it for the 3.16 kernel as well.

Cheers,
--
Lu=EDs

> Cheers,
>=20
>   -ilia
> --
> To unsubscribe from this list: send the line "unsubscribe stable" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
