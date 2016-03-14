From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: [PATCH mesa] clover: Fix pipe_grid_info.indirect not
	being initialized
Date: Mon, 14 Mar 2016 13:49:52 -0700
Message-ID: <87lh5k4wen.fsf@riseup.net>
References: <1457959848-23790-1-git-send-email-hdegoede@redhat.com>
 <56E6B629.8080708@gmail.com> <56E6BBFC.2020306@redhat.com>
 <56E6BCD2.5000002@gmail.com> <56E6BD32.5000203@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0701697807=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <56E6BD32.5000203-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, mesa-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0701697807==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On 03/14/2016 02:29 PM, Samuel Pitoiset wrote:
>>
>>
>> On 03/14/2016 02:26 PM, Hans de Goede wrote:
>>> Hi,
>>>
>>> On 14-03-16 14:01, Samuel Pitoiset wrote:
>>>>
>>>>
>>>> On 03/14/2016 01:50 PM, Hans de Goede wrote:
>>>>> After pipe_grid_info.indirect was introduced, clover was not modified
>>>>> to set it causing it to pass uninitialized memory for it to
>>>>> launch_grid.
>>>>>
>>>>> This commit fixes this by zero-ing the entire pipe_grid_info struct
>>>>> when
>>>>> declaring it, to avoid similar problems popping-up in the future.
>>>>>
>>>>> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>>>>> ---
>>>>>   src/gallium/state_trackers/clover/core/kernel.cpp | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/src/gallium/state_trackers/clover/core/kernel.cpp
>>>>> b/src/gallium/state_trackers/clover/core/kernel.cpp
>>>>> index 8396be9..dad66aa 100644
>>>>> --- a/src/gallium/state_trackers/clover/core/kernel.cpp
>>>>> +++ b/src/gallium/state_trackers/clover/core/kernel.cpp
>>>>> @@ -55,7 +55,7 @@ kernel::launch(command_queue &q,
>>>>>      const auto reduced_grid_size =3D
>>>>>         map(divides(), grid_size, block_size);
>>>>>      void *st =3D exec.bind(&q, grid_offset);
>>>>> -   struct pipe_grid_info info;
>>>>> +   struct pipe_grid_info info =3D { 0, };
>>>>
>>>> Right, good catch, it's my fault.
>>>>
>>>> =3D { 0 }; is enough btw.
>>>
>>> I prefer to add the "," to make clear that we are initializing the
>>> entire struct,
>>> I read it as  ", ...".
>>
>> Well, usually we use { 0 } in mesa, try to grep and you will see. :-)
>> There is only 3 occurrences of { 0, }, but I think they are quite old.
>
> Of course, I'm not really against this ",", but I just want consistency=20
> with the other parts.
>

In C++ '{}' is standard, more concise, and works for a wider range of
types regardless of their layout ('{ 0 }' is valid or not depending on
what the first member of the struct is, while '{}' works regardless, in
C++11 it can even be used to initialize non-POD types with custom
constructors), so it should be generally preferred instead.

Don't bother to resend just because of my nitpicking, I'll fix it up
before I push the last revision of your change, which is:

Reviewed-by: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>

>>
>>>
>>>> This should be backported to mesa 11.2 I guess, could you please send
>>>> a v2 with this minor fix and add the cc thing?
>>>
>>> Sure, as soon as we're done bikeshedding on the "," :)
>>>
>>> Regards,
>>>
>>> Hans
>>
>
> --=20
> -Samuel
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iF4EAREIAAYFAlbnI/AACgkQg5k4nX1Sv1sMhAD8D5U86L09MzS5yRvlbqSH0EKz
k7b+RiFNiqqeYYWp93sBAJNaxhE/igUWKwPf/eSNIJMWEM8V5dS8SxHsN7kI96q0
=XjJd
-----END PGP SIGNATURE-----
--==-=-=--

--===============0701697807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0701697807==--
