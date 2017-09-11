From: Nicolas Mercier <mercier.nicolas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau: kernel hang on Optimus+Intel+NVidia GeForce
	1060m
Date: Mon, 11 Sep 2017 21:52:31 +0200
Message-ID: <CAKyUnMVeWzgptcN0CVLg4SYriY7+29wXcdaAH4Xig7tXSuXBtA@mail.gmail.com>
References: <CAKyUnMW6f-EpyjZ=tocOR6Ji8MLprF71YzNsOKv-+UGtbvqH=g@mail.gmail.com>
 <cb794e03-6ca8-7e80-9277-ea780ee0bbd2@mni.thm.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1161123377=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <cb794e03-6ca8-7e80-9277-ea780ee0bbd2-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1161123377==
Content-Type: multipart/alternative; boundary="001a114e7ae27590e00558ef440a"

--001a114e7ae27590e00558ef440a
Content-Type: text/plain; charset="UTF-8"

Hi Tobias,

On Mon, Sep 11, 2017 at 8:49 PM, Tobias Klausmann <
tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> wrote:

> Hi,
>
> i remember seeing the same error with earlier firmware version with a
> similar system (GP106) once in a while on boot, yet it does not happen
> with newer versions. Maybe you could try to update the firmware to the
> latest version from kernel-firmware.
>
Thanks for the suggestion Tobias. I updated the firmware (pulled it down
straight from Git) but unfortunately i got the exact same result.


> As a small addition: I remember deeply: you should ignore the
> _OSI(Linux) query, as it may break the system in some ways, if you don't
> have a specific bug fixed with adding _OSI(Linux), removing it from the
> cmdline is a thing to test!
>
Actually I tried both with and without, it just happens that I forgot to
remove it after many tests.
I read also that it is better to not add _OSI(Linux) so I completely agree,
I will take it out again.

--001a114e7ae27590e00558ef440a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">Hi T=
obias,=C2=A0</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_=
quote">On Mon, Sep 11, 2017 at 8:49 PM, Tobias Klausmann <span dir=3D"ltr">=
&lt;<a href=3D"mailto:tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org" target=3D"_blan=
k">tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">Hi,<br>
<br>
i remember seeing the same error with earlier firmware version with a<br>
similar system (GP106) once in a while on boot, yet it does not happen<br>
with newer versions. Maybe you could try to update the firmware to the<br>
latest version from kernel-firmware.<br></blockquote><div>Thanks for the su=
ggestion Tobias. I updated the firmware (pulled it down straight from Git) =
but unfortunately i got the exact same result.</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">
As a small addition: I remember deeply: you should ignore the<br>
_OSI(Linux) query, as it may break the system in some ways, if you don&#39;=
t<br>
have a specific bug fixed with adding _OSI(Linux), removing it from the<br>
cmdline is a thing to test!<br></blockquote><div>Actually I tried both with=
 and without, it just happens that I forgot to remove it after many tests.<=
/div><div>I read also that it is better to not add _OSI(Linux) so I complet=
ely agree, I will take it out again.</div><div><br></div></div></div></div>

--001a114e7ae27590e00558ef440a--

--===============1161123377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1161123377==--
