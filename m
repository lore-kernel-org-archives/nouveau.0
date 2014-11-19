From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Is it necessary to parse the VBIOS init table when
 executable is false?
Date: Thu, 20 Nov 2014 05:42:11 +1000
Message-ID: <CACAvsv7PM9V2oMKTJfbinFqGpmcEiZf59-RqQd07_eaUqPrQkQ@mail.gmail.com>
References: <BAY407-EAS1855F8C9730A7C4C05C1BAADA890@phx.gbl>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1178016036=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <BAY407-EAS1855F8C9730A7C4C05C1BAADA890-MsuGFMq8XAE@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: =?UTF-8?B?5p2O6YeR5Y2O?= <goodqt-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1178016036==
Content-Type: multipart/alternative; boundary=001a11c360f86df06d05083b6895

--001a11c360f86df06d05083b6895
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 20 Nov 2014 01:31, "=E6=9D=8E=E9=87=91=E5=8D=8E" <goodqt-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org> wr=
ote:
>
> Hello everyone,
>
> The code is at /core/subdev/bios/init.c.
> When the executable is 0,these functions that parse the VBIOS init table
seems to do nothing except the parsing.
Correct.  We do not handle every opcode, only the ones that have been
observed so far.  The purpose is to be able to test whether we will be able
to fully execute the table, to avoid failing in a critical path (such as
resume from suspend) where we can't recover.

Ben.

And in my opinion,init_exec_force does nothing,too!
>
> Then I tried to test it on my computer,when the VBIOS parser tries to
change a MMIO register or call a function of struct nouveau_devinit (such
as devinit->pll_set,etc.),it will print a message into the kernel log.
However,I cannot see any message about this in the kernel log!
>
> Finally,I decided to just return when executable is zero. Then I found
out the driver also works perfectly.
>
> So I asked the question here,thanks for your help.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau

--001a11c360f86df06d05083b6895
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On 20 Nov 2014 01:31, &quot;=E6=9D=8E=E9=87=91=E5=8D=8E&quot=
; &lt;<a href=3D"mailto:goodqt-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org">goodqt-1ViLX0X+lBJBDgjK7y7TUQ@public.gmane.org</a>&gt; wrot=
e:<br>
&gt;<br>
&gt; Hello everyone,<br>
&gt;<br>
&gt; The code is at /core/subdev/bios/init.c.<br>
&gt; When the executable is 0,these functions that parse the VBIOS init tab=
le seems to do nothing except the parsing.<br>
Correct.=C2=A0 We do not handle every opcode, only the ones that have been =
observed so far.=C2=A0 The purpose is to be able to test whether we will be=
 able to fully execute the table, to avoid failing in a critical path (such=
 as resume from suspend) where we can&#39;t recover. </p>
<p dir=3D"ltr">Ben. </p>
<p dir=3D"ltr"> And in my opinion,init_exec_force does nothing,too!<br>
&gt;<br>
&gt; Then I tried to test it on my computer,when the VBIOS parser tries to =
change a MMIO register or call a function of struct nouveau_devinit (such a=
s devinit-&gt;pll_set,etc.),it will print a message into the kernel log. Ho=
wever,I cannot see any message about this in the kernel log!<br>
&gt;<br>
&gt; Finally,I decided to just return when executable is zero. Then I found=
 out the driver also works perfectly.<br>
&gt;<br>
&gt; So I asked the question here,thanks for your help.<br>
&gt; _______________________________________________<br>
&gt; Nouveau mailing list<br>
&gt; <a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32mqWrfYKbYh0A@public.gmane.org=
ktop.org</a><br>
&gt; <a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau">http=
://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</p>

--001a11c360f86df06d05083b6895--

--===============1178016036==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1178016036==--
