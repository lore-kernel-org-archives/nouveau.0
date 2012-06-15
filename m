From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Regression: Blank screen with kernel 3.4
Date: Sat, 16 Jun 2012 06:31:18 +1000
Message-ID: <CACAvsv44j9tNeoYtYOdZCd+RZ8y3=OxkkRsdyZQqNrBb5Dqz=g@mail.gmail.com>
References: <4FDB711F.4070800@babioch.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1305142675=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4FDB711F.4070800-+CCwuOEMgH6ELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Karol Babioch <karol-+CCwuOEMgH6ELgA04lAiVw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1305142675==
Content-Type: multipart/alternative; boundary=20cf3071d0bad991b104c288b2e3

--20cf3071d0bad991b104c288b2e3
Content-Type: text/plain; charset=ISO-8859-1

Am Samstag, 16. Juni 2012 schrieb Karol Babioch :

>
> Hi,
>
> there seems to be a quite serious regression in kernel 3.4, at least for
> me. As soon as the nouveau module gets loaded my screen goes blank.
>
> There is already a bug reported on this issue in your bug tracker, see
> [1]. Interestingly enough I've got nearly the same laptop as the
> reporter of the issue. Personally I've got a Sony VAIO VPCS12C5E. The
> reporter got a VPCS11C5E. We both have a dedicated graphics card (NVIDIA
> GeForce 310M). The CPU does provide its own GPU, but it is disabled,
> which can't be accessed or changed within the BIOS.
>
> It worked fine for kernels 2.6.39 up until now (3.3). I'm not quite sure
> whether 2.6.38 worked, or not, but it was somewhere around this time
> that it got fixed.
>
> From reading various threads, I've got the feeling that a lot of the
> black/blank screen issues should be fixed with 3.4. My best guess would
> be that something was changed, which introduced this kind of regression.
>
> As there are already some logfiles provided within the bug issued in
> your tracker (see [1]), I won't attach anything here. But I'm happy to
> provide anything you need, of course. Just let me know.

Thanks!  I'm aware of the issue and will look into it after the weekend. I
don't have any effected hw, so i'll ping you for testing as needed :)

Ben.

>
> Would be nice, to narrow this one down, as I would like to use kernel
> 3.4 and later at some point in the future ;).
>
> Best regards,
> Karol Babioch
>
> [1] https://bugs.freedesktop.org/show_bug.cgi?id=50175
>
>

--20cf3071d0bad991b104c288b2e3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Am Samstag, 16. Juni 2012 schrieb Karol Babioch :<br><span class=3D"Apple-s=
tyle-span" style>=A0</span><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
there seems to be a quite serious regression in kernel 3.4, at least for<br=
>
me. As soon as the nouveau module gets loaded my screen goes blank.<br>
<br>
There is already a bug reported on this issue in your bug tracker, see<br>
[1]. Interestingly enough I&#39;ve got nearly the same laptop as the<br>
reporter of the issue. Personally I&#39;ve got a Sony VAIO VPCS12C5E. The<b=
r>
reporter got a VPCS11C5E. We both have a dedicated graphics card (NVIDIA<br=
>
GeForce 310M). The CPU does provide its own GPU, but it is disabled,<br>
which can&#39;t be accessed or changed within the BIOS.<br>
<br>
It worked fine for kernels 2.6.39 up until now (3.3). I&#39;m not quite sur=
e<br>
whether 2.6.38 worked, or not, but it was somewhere around this time<br>
that it got fixed.<br>
<br>
From reading various threads, I&#39;ve got the feeling that a lot of the<br=
>
black/blank screen issues should be fixed with 3.4. My best guess would<br>
be that something was changed, which introduced this kind of regression.<br=
>
<br>
As there are already some logfiles provided within the bug issued in<br>
your tracker (see [1]), I won&#39;t attach anything here. But I&#39;m happy=
 to<br>
provide anything you need, of course. Just let me know.</blockquote><div>Th=
anks! =A0I&#39;m aware of the issue and will look into it after the weekend=
. I don&#39;t have any effected hw, so i&#39;ll ping you for testing as nee=
ded :)</div>
<div><br></div><div>Ben.<span></span></div><div></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
<br>
Would be nice, to narrow this one down, as I would like to use kernel<br>
3.4 and later at some point in the future ;).<br>
<br>
Best regards,<br>
Karol Babioch<br>
<br>
[1] <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D50175" target=
=3D"_blank">https://bugs.freedesktop.org/show_bug.cgi?id=3D50175</a><br>
<br>
</blockquote>

--20cf3071d0bad991b104c288b2e3--

--===============1305142675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1305142675==--
