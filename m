From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/6] drm/nouveau: Support sync FDs and sync
 objects
Date: Thu, 24 Sep 2020 12:05:09 +0200
Message-ID: <20200924100509.GD2483160@ulmo>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
 <20200923091853.GA1229032@ulmo>
 <20200923152124.GO438822@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1604824414=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200923152124.GO438822-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1604824414==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sXc4Kmr5FA7axrvy"
Content-Disposition: inline


--sXc4Kmr5FA7axrvy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 05:21:24PM +0200, Daniel Vetter wrote:
> On Wed, Sep 23, 2020 at 11:18:53AM +0200, Thierry Reding wrote:
> > On Fri, Aug 28, 2020 at 12:40:10PM +0200, Thierry Reding wrote:
> > > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >=20
> > > Hi,
> > >=20
> > > This series implements a new IOCTL to submit push buffers that can
> > > optionally return a sync FD or sync object to userspace. This is usef=
ul
> > > in cases where userspace wants to synchronize operations between the =
GPU
> > > and another driver (such as KMS for display). Among other things this
> > > allows extensions such as eglDupNativeFenceFDANDROID to be implemente=
d.
> > >=20
> > > Note that patch 4 modifies the ABI introduced in patch 3 by allowing =
DRM
> > > sync objects to be passed rather than only sync FDs. It also allows a=
ny
> > > number of sync FDs/objects to be passed in or emitted. I think those =
are
> > > useful features, but I left them in a separate patch in case everybody
> > > else thinks that this won't be needed. If we decide to merge the new =
ABI
> > > then patch 4 should be squashed into patch 3.
> > >=20
> > > The corresponding userspace changes can be found here:
> > >=20
> > >   libdrm: https://gitlab.freedesktop.org/tagr/drm/-/commits/nouveau-s=
ync-fd-v2/
> > >   mesa: https://gitlab.freedesktop.org/tagr/mesa/-/commits/nouveau-sy=
nc-fd/
> > >=20
> > > I've verified that this works with kmscube's --atomic mode and Weston.
> >=20
> > Hi Ben,
> >=20
> > any thoughts on this series? I realize that this is somewhat suboptimal
> > because we're effectively adding a duplicate of the existing IOCTL with
> > only the "minor" extension of adding sync FDs/objects, but at the same
> > time I don't have any good ideas on what else to add to make this more
> > appealing or if you have any plans of your own to address this in the
> > future.
>=20
> drm core automatically zero-extends ioctl structs both ways, so if all you
> do is add more stuff to the top level ioctl struct at the bottom, there's
> no need to duplicate any code. At least as long as you guarantee that 0 =
=3D=3D
> old behaviour for both in and out parameters.

But that only works if the structure size remains fixed, right? In this
case, however, we have to extend the structure with additional fields,
so the size is going to change and therefore the IOCTL number will also
change.

Thierry

--sXc4Kmr5FA7axrvy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9sb1UACgkQ3SOs138+
s6HZ8w/8CIpOGWCol7KAZUj4+fPZb9zZBd+XXqsTOldX4uiM5+eyC8PZn6mIElnr
k5E+Hr5gRAZGPFnjH6wXMIyg8vGk54RNHHH4qrDWfI9dT6O/dMhtRIB4fsS8iF1X
FQc2lgftmvaojFLnxHV4lKDO8IB74B0jexTEKtzjobIzbnYaAwMU0WT/UCwZtpmu
rn8PedXVHsSxEns/vzB3NkjdofsUfKVmxncxiZIn324ImwCcF1UpRQBzX/1QyBww
3aMHUTAH8VYkxMDYw4aPlQ2O8V+1vbnnDm2hegK6Ie7wd1S6EAqzfQVXSWo/weCP
8kcx+ghEDODhXJpK5cy2jUb1b+sxg08q8dFHtdbAQiy/QXmwqE9JYaOOZhrVOJF3
P1OzmqyDomrbCl6zU8kcXoAasVhf3OjZmA0iXuphHD3vWrAGvqhE0pwWxeOV+Ttw
+W6sRDAY0WjrEynEGqgCQiJvZ+1h4WgezXslgnbhx0NQW7xp8pFJpoCWBMzO8SNn
LzaawSgO38hF0YgqwBOhRHb5kmk3GnPxk86c001gkaKNza8/sWa8zcTKk8sGFH4V
ryGEM29HxjKhFmrN1MDMC3OXo2o7hrtytYKSLzxN+6L1YHrVU+YoNFnA1Qjn6PCu
EYO256IQoDJNBe5I3pbyOAiZF+pt/9mKMHARJh+BU/92InYhURE=
=sR60
-----END PGP SIGNATURE-----

--sXc4Kmr5FA7axrvy--

--===============1604824414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
https://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1604824414==--
