From: Jack Coulter <jscinoz-6Q7r4viT83dXWpQWGVM7sQ@public.gmane.org>
Subject: Re: A request for Virtual GPU based on Nouveau
Date: Mon, 6 Mar 2017 10:54:08 +1100
Message-ID: <2db4f118-bf11-a3d5-3489-0a315d91f18f@jscinoz.so>
References: <23237D6EDF923F47ABCC70E942B37DDD43023A9E@SZXEMA511-MBS.china.huawei.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2005517298=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <23237D6EDF923F47ABCC70E942B37DDD43023A9E-WoCHQBGQUPbVoO+7gWNeMAK1hpo4iccwjNknBlVQO8k@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============2005517298==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GIe8bkBK2LH9cL5U1b1tDr3eClHcofOTv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GIe8bkBK2LH9cL5U1b1tDr3eClHcofOTv
Content-Type: multipart/mixed; boundary="xCL9miSlleCqihwHvNDbAaOoPAVAa31s8";
 protected-headers="v1"
From: Jack Coulter <jscinoz-6Q7r4viT83dXWpQWGVM7sQ@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Message-ID: <2db4f118-bf11-a3d5-3489-0a315d91f18f-6Q7r4viT83dXWpQWGVM7sQ@public.gmane.org>
Subject: Re: [Nouveau] A request for Virtual GPU based on Nouveau
References: <23237D6EDF923F47ABCC70E942B37DDD43023A9E-WoCHQBGQUPbVoO+7gWNeMAK1hpo4iccwjNknBlVQO8k@public.gmane.org>
In-Reply-To: <23237D6EDF923F47ABCC70E942B37DDD43023A9E-WoCHQBGQUPbVoO+7gWNeMAK1hpo4iccwjNknBlVQO8k@public.gmane.org>

--xCL9miSlleCqihwHvNDbAaOoPAVAa31s8
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Jay,


On 25/02/17 14:39, Zhengjie (PARC) wrote:
>
> I know the nouveau project aims to build high-quality, free/libre
> software drivers for nVidia cards
> <https://nouveau.freedesktop.org/wiki/CodeNames/>. Maybe
> the nouveau project developers can do something to help GPU
> Virtualization. So I=E2=80=99d like to ask whether there is the possibi=
lity of
> cooperation on GPU Virtualization between Huawei and the nouveau projec=
t.
>
> Maybe there is another way for cooperation. But I don=E2=80=99t know ho=
w. Or
> you can give some advices to us on GPU Virtualization based on
> nouveau. That will be grateful. I=E2=80=99m looking forward to you repl=
y.
>
I'm no kernel dev, but it's worth mentioning a lot of infrastructure for
GPU virtualisation was merged in 4.10; specifically the GVT
functionality written by Intel which makes use of the VFIO mediated
device framework which itself landed in 4.9, I believe (I could be
mistaken). It may be worth while asking on the intel-gvt-dev list [1]
too, as we would surely all benefit from having standard interfaces for
virtual GPUs regardless of hardware vendor.

You may wish to have a look at the following files & directories in the
kernel source tree:

Documentation/vfio-mediated-device.txt
drivers/vfio/mdev/
drivers/gpu/drm/i915/gvt/

None of this is specifically related to nouveau, but there's certainly
some common infrastructure (mdev) that could be utilised.


[1] https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev


Cheers,
Jack



--xCL9miSlleCqihwHvNDbAaOoPAVAa31s8--

--GIe8bkBK2LH9cL5U1b1tDr3eClHcofOTv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE71dKCcCYmA5mev89/Re7FwgNKc8FAli8pSQACgkQ/Re7FwgN
Kc//7g//ZuqZRXqqc6VP7zWRLkguTHaBb2Y1y07hHLxowBz3QtlOeV7yX5fDQXmT
mWQXOtUYfLfeuWsDHQSYGZ0HMwZiRzO78eQ6GU1ZfsqiY8J3GgflhbEbsHXdrTr/
gqC7iCWNZmoez6zEzokcu9SJ6QHoX3BCA+vEreCFIb3ZGmrG6S5tXIl3NtjaZedD
095f45FdU7RpnVejt25vJq1AT8DZ1MXPPFzBVj47GYAOx4zrZl1gElfuk1zVfjXq
wc2ghD0dHvNZX0TxYhnzJRUknvtkCSzgn30+63MLAZU1mGk8na8SkNkiv0g2rSSI
ANi0Ktw5B36nAsCsFtPuqJ9Vw45qGP1DBaBOUC2nRfcV5CsosyoG2I2yH7yrPy5Q
75inyjQWGxgVkrhwAs9gTNzg2kEo+ESSwEay2LfW2Tshizto5hk70V5mkTqBuE9E
ozz7TlnDpPsA1z+FAU0R5FWUEc1IUeGRBX86MbssLLGqsNuXKVum4mWG74o2eLWV
xGCAvBbyVBSTzZrSaYNsjpe6GxSHYPxnpY6Pa6TL4TwJmil3BB5NKk5WRuOlPdp9
76JioO0/DDjLb3TRJ/pegot22QMbWjoEBVgNSEboCId71jA+28p0uFFf22PNnHEB
pzFS5wUC/foFiKbnYrQ/sZkEwKTjg7MCMzZpLbVTxY8uIa5X7Ys=
=8/yc
-----END PGP SIGNATURE-----

--GIe8bkBK2LH9cL5U1b1tDr3eClHcofOTv--

--===============2005517298==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2005517298==--
