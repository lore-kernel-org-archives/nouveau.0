From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: NVIDIA signed firmware release format
Date: Thu, 18 Feb 2016 16:42:05 +1000
Message-ID: <56C567BD.80702@gmail.com>
References: <56C53CDE.8030904@nvidia.com>
 <CAKb7UviMC-NgPM+ofSzgki5Hiwir4cAqugUMWf2kkX3NEVyAow@mail.gmail.com>
 <56C55154.1070009@nvidia.com>
 <CAKb7Uvgr5u9RKGP0xWza7p+yyd+NWRXhkO=vOXsn+xff0QsK-Q@mail.gmail.com>
 <56C55A14.9060308@nvidia.com>
 <CAKb7Uvh4PZyK3ip8B3Y5_wz9juvQEv_d76zwkB9-vXAXn96dqg@mail.gmail.com>
 <56C55EB2.4070608@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2039570346=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <56C55EB2.4070608-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
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
--===============2039570346==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mWhTsvfeAfiHQkS2kaIMVp02S0bjFuSkQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mWhTsvfeAfiHQkS2kaIMVp02S0bjFuSkQ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 02/18/2016 04:03 PM, Alexandre Courbot wrote:
> On 02/18/2016 02:54 PM, Ilia Mirkin wrote:
>> On Thu, Feb 18, 2016 at 12:43 AM, Alexandre Courbot
>> <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> On 02/18/2016 02:37 PM, Ilia Mirkin wrote:
>>>>
>>>> On Thu, Feb 18, 2016 at 12:06 AM, Alexandre Courbot
>>>> <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> wrote:
>>>>>
>>>>> On 02/18/2016 12:47 PM, Ilia Mirkin wrote:
>>>>>>
>>>>>>
>>>>>> On Wed, Feb 17, 2016 at 10:39 PM, Alexandre Courbot
>>>>>> <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>> wrote:
>>>>>>>
>>>>>>>
>>>>>>> Hi everyone,
>>>>>>>
>>>>>>> This email is to start a discussion about the format into which
>>>>>>> NVIDIA
>>>>>>> firmware is going to be provided. If you had a look at the
>>>>>>> linux-firmware
>>>>>>> branch we pushed earlier [1] you may already have an idea of the
>>>>>>> general
>>>>>>> organization, but this email is to discuss more specific details.=

>>>>>>>
>>>>>>> Official firmware is organized per-chip, with an additional level=
 of
>>>>>>> hierarchy for the different managed subsystems.
>>>>>>>
>>>>>>> For example, gm200 currently has two sub-directories, acr and gr,=

>>>>>>> which
>>>>>>> contain the firmware files for secure boot (ACR) and PGRAPH (GR).=

>>>>>>>
>>>>>>> ACR is a particular case and comes in the form of self-contained
>>>>>>> units
>>>>>>> (code, data, signature) that can be run on a high-secure falcon
>>>>>>> (currently
>>>>>>> PMU). It consumes a blob that is built by the kernel and contains=

>>>>>>> the
>>>>>>> signed
>>>>>>> firmwares of the low-secure falcons to load and manage.
>>>>>>>
>>>>>>> The ACR blob is made of a header describing the managed falcons
>>>>>>> and the
>>>>>>> offses of their bootloader, code and data within the blob, as
>>>>>>> well as
>>>>>>> bootloader/code/data sections for each falcon.
>>>>>>>
>>>>>>> A signed, low-secure falcon firmware in the ACR blob is thus the
>>>>>>> aggregation
>>>>>>> of three different components:
>>>>>>>
>>>>>>> - An image containing the bl, code and data sections
>>>>>>> - A descriptor with the offsets of these sections within the imag=
e
>>>>>>> - A signature that the ACR will verify against
>>>>>>>
>>>>>>> These three components can come as files to be directly loaded.
>>>>>>> However
>>>>>>> for
>>>>>>> the current GR firmware we took the approach of splitting the bl,=

>>>>>>> code
>>>>>>> and
>>>>>>> data sections into their own files, and building the image and
>>>>>>> descriptor
>>>>>>> on-the-fly, as you can see from gm200/gr:
>>>>>>>
>>>>>>> gm200/gr/fecs_bl.bin
>>>>>>> gm200/gr/fecs_data.bin
>>>>>>> gm200/gr/fecs_inst.bin
>>>>>>> gm200/gr/fecs_sig.bin
>>>>>>>
>>>>>>> The bl, data, and inst files are loaded and combined into an imag=
e
>>>>>>> while
>>>>>>> the
>>>>>>> corresponding descriptor is built. This is done in the
>>>>>>> ls_ucode_img_build()
>>>>>>> function.
>>>>>>>
>>>>>>> The main reason for doing this is there is that for a given GPU
>>>>>>> generation,
>>>>>>> the _bl and _inst files are very likely going to be exactly the
>>>>>>> same,
>>>>>>> with
>>>>>>> only the data and signature varying. Splitting the sections allow=

>>>>>>> us to
>>>>>>> symlink identical files. For instance, gr/gm200 weights 61KB, whi=
le
>>>>>>> gm204/gr, which mostly symlinks to the former, only takes 8.5KB.
>>>>>>>
>>>>>>> Another advantage is that this also allows the code and data to b=
e
>>>>>>> directly
>>>>>>> loaded via the traditional method into a fused non-secure board,
>>>>>>> although
>>>>>>> this advantage is not too relevant for the community.
>>>>>>>
>>>>>>> That's the design we took for now - it is possible to switch to a=

>>>>>>> more
>>>>>>> smaller number of files per chip, and remove a bit of kernel
>>>>>>> code, at
>>>>>>> the
>>>>>>> cost of firmware footprint.
>>>>>>>
>>>>>>> I just wanted to make sure this design was ok and take any object=
ion
>>>>>>> into
>>>>>>> account before the planned merge of the kernel support for signed=

>>>>>>> firmware,
>>>>>>> hopefully next week.
>>>>>>
>>>>>>
>>>>>>
>>>>>> Since the firmware is completely separate from the kernel, you
>>>>>> need to
>>>>>> think about versioning. The firmware presents an ABI to the kernel=
,
>>>>>> and unless you promise to never ever ever ever ever change the ABI=

>>>>>> with later updates, versioning the firmware files is something you=
're
>>>>>> going to have to think about. Sometimes it's done via filenames, e=
=2Eg.
>>>>>> -1, -2, etc. Sometimes it's done by packing multiple data files
>>>>>> into a
>>>>>> single one, allowing the code to pick whichever one it wants.
>>>>>
>>>>>
>>>>>
>>>>> For versioning purposes, I thought about using different filenames.=

>>>>> It is
>>>>> simple and effective, and since I cannot predict the scope of chang=
es
>>>>> these
>>>>> files may undergo, it also seems to be the most flexible solution.
>>>>>
>>>>> Note that the format of files named similarly for different GPUs mi=
ght
>>>>> also
>>>>> be different. What is guaranteed is that a given file will forever
>>>>> remain
>>>>> backward-compatible.
>>>>>
>>>>> There already are differences between the GM20B (Tegra) firmware fi=
les
>>>>> and
>>>>> the other GM20X due to GM20B coming from a different tree, so
>>>>> although it
>>>>> may be a little bit confusing this is a necessary evil. And it's
>>>>> not like
>>>>> we
>>>>> are not used to dealing with chip-specific ops in Nouveau anyway. :=
)
>>>>
>>>>
>>>> I meant more like an update for, say, GM20B, where you want to updat=
e
>>>> the ABI between the driver and the firmware. So you have the old
>>>> firmware, and now you have a new version of the same firmware, for a=

>>>> particular chip...
>>>
>>>
>>> Right, so for that case GM20B can use different ops than the other
>>> GM20X to
>>> handle its firmware. And if an updated (and incompatible) firmware
>>> lands for
>>> an already existing chip, it will be recorded under a different
>>> filename.
>>> This will ensure that old kernels can keep booting forever. Or am I
>>> missing
>>> something?
>>
>> No, that works. So instead of gm20b/gr/fecs_inst.bin it'll be
>> gm20b/gr/fecs_inst-2.bin and so on?
>=20
> That's what I had in mind, yes. New kernels would try to load the newes=
t
> version, while older ones will still find the initial one.
>=20
> Of course we will try to prevent this from happening too often, but it
> will be sometimes necessary (one example is if/when we release a newer
> ACR with PMU support - the kernel will use the PMU to start/reset other=

> falcons instead of redoing ACR as we currently do).
>=20
> In the case of fecs_inst.bin that you listed, I don't expect it to
> change, at least not in incompatible ways.
I'm also fine with the current method of shipping the firmware.
Versioned filenames seem adequate for handling incompatible ABIs also.

Thanks,
Ben.

> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


--mWhTsvfeAfiHQkS2kaIMVp02S0bjFuSkQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWxWe9AAoJEHYLnGJQkpH7qRgP/007QI+zEr5m3EsWCfsdGX6Z
WQbDTEF8O7sCrEVusT4co+fvKOIvJO47Y/y0oPXbHHb9v7lXSmFbOnbVQamdnQwa
p5gqXC5/9r+jmGntyWLCeBke6ybi3aUrZlLH3CegnMa1OkQGkqjJz0OtiSYjbe5D
JsSj4JlmM6CiRFlTs4ec8CBzkqKMoah77y+VWTyhP0KIHx9WLX56VB7m0SZhOsX1
SSeVIujcBH050oL/CtOZ/eUyhMaqTN6lieLjKQVSlvGo6W7zxyNwTQRA8BAGCJg6
2OtiWSnBWsGtRcRkolXpIeNjX6KVDzCH6xTLGiNqL7/N4WV0ny9MYyyBLMUH+m1H
09WxH5dSPSpH/0+Ihz3BIkDQrc1LEK0KX7dO+lX3KLqfGO6N/LDz9zCB8BYK9uk+
gZDo9bGytuade0sT3m5ngahGAJVni1+VuvEVye9KgVaxSnPdrgJHdSViGn3yA1Bk
YylEJs4Q/lW+wfuNZ6JHlxtLps7j5luOXg8c7tnhdvVo8WsSFWQaxeagB7t4AScZ
oIJyO8jIkgzb9xjPPQilKKeJ6oJEi0FyjfJnBHV0+u9LwrnY2dvjzh3Maiy5YB1X
ttHolftIVkpdTLJQtVLsoQhm1Nxc3gQHtE8ACcs4UpRVFlb/UebQa5n2rU83MvoA
qkL+UD4IXrz1xS7UVOsH
=gJAx
-----END PGP SIGNATURE-----

--mWhTsvfeAfiHQkS2kaIMVp02S0bjFuSkQ--

--===============2039570346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2039570346==--
