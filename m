From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] nouveau: Do not add most bo's to the
 global bo list.
Date: Wed, 25 Feb 2015 10:59:47 -0600
Message-ID: <CAEk2St=hxYL7QTnC=7=EnAyD8Bw4KJER4Dd+9pYKYckM5m+4Jg@mail.gmail.com>
References: <1424768511-25156-1-git-send-email-maarten.lankhorst@ubuntu.com>
 <1424768511-25156-2-git-send-email-maarten.lankhorst@ubuntu.com>
 <CACvgo53DRfa9JkweCRVB9va7oD5RoKVM9KFkXk99rQwO=vxi0g@mail.gmail.com>
 <54EDE354.6030700@ubuntu.com>
 <CAEk2Stmr7k+Tq_JH+9iuo8iz+NouhJ8tG3RaX9vJA-FHzewBAw@mail.gmail.com>
 <54EDE51B.1070000@ubuntu.com>
 <CAEk2Stk1x86MM0x6FLFutgBGC+0ksG+VKFLoEH=z+zLGKvYyRg@mail.gmail.com>
 <54EDED9B.3000303@ubuntu.com>
 <CAEk2StmOwhMecfkNsVj7j3PbmnazNQ7CAPMs-VNvv-QtrSEmCQ@mail.gmail.com>
 <CAKb7UvhinRCVezUKwVpJR2V4hwTs+8mgQZBvEtHE0MVp7PYc9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1412398589=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhinRCVezUKwVpJR2V4hwTs+8mgQZBvEtHE0MVp7PYc9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1412398589==
Content-Type: multipart/alternative; boundary=001a1133c9e013b1ee050fec90d4

--001a1133c9e013b1ee050fec90d4
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 25, 2015 at 10:35 AM, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> pthread_mutex_lock had *better* imply a compiler barrier across which
> code can't be moved... which is very different from the printf case
> where it might have done it due to register pressure or who knows
> what.
>
In the dummy function, register pressure was certainly not an issue, but
point taken. Still, a compiler barrier prevents reordering like:

x = *a;
y = *a;
pthread_mutex_lock()

This changes the external visibility ordering and is certainly NOT ok.


However, I contend that it doesn't stop:

const int loaded = *a;
x = loaded;
pthread_mutex_lock();
y = loaded;

Because this doesn't change the external visibility behavior, it just
changes whether a value is reloaded. It doesn't break the ordering of a
memory barrier at all.


> If code like
>
> x = *a;
> pthread_mutex_lock or unlock or __memory_barrier()
> y = *a;
>
> doesn't cause a to get loaded twice, then the compiler's in serious
> trouble. Basically functions like pthread_mutex_lock imply that all
> memory is changed to the compiler, and thus need to be reloaded.
>
> Well, I've said before and I might be alone, but I disagree with you. The
compiler is under no requirement to reload (*a) because a lock was changed.
It does, but it doesn't have to. It's fine if you guys don't want to change
it. It may never be a problem with gcc.

This is the definition of pthread_mutex_lock() in glibc. There aren't any
magic hints that this invalidates memory:

extern int pthread_mutex_lock (pthread_mutex_t *__mutex)
__THROWNL __nonnull ((1));

THOWNL is attribute((nothrow)).

--001a1133c9e013b1ee050fec90d4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Feb 25, 2015 at 10:35 AM, Ilia Mirkin <span dir=3D"ltr">&lt;<a =
href=3D"mailto:imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org" target=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>pthread_mutex_lock had *better* imply a compiler barrier across which<br>
code can&#39;t be moved... which is very different from the printf case<br>
where it might have done it due to register pressure or who knows<br>
what.<br></blockquote><div>In the dummy function, register pressure was cer=
tainly not an issue, but point taken. Still, a compiler barrier prevents re=
ordering like:<br></div><div><br></div><div>x =3D *a;<br></div><div>y =3D *=
a;<br></div><div>pthread_mutex_lock()<br><br></div><div>This changes the ex=
ternal visibility ordering and is certainly NOT ok.<br></div><div><br></div=
><div><br></div><div>However, I contend that it doesn&#39;t stop: <br><br><=
/div><div><div>const int loaded =3D *a;<br>x =3D loaded;<br></div><div>pthr=
ead_mutex_lock();<br></div><div>y =3D loaded;<br><br></div><div>Because thi=
s doesn&#39;t change the external visibility behavior, it just changes whet=
her a value is reloaded. It doesn&#39;t break the ordering of a memory barr=
ier at all.<br><br></div></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
If code like<br>
<br>
x =3D *a;<br>
pthread_mutex_lock or unlock or __memory_barrier()<br>
y =3D *a;<br>
<br>
doesn&#39;t cause a to get loaded twice, then the compiler&#39;s in serious=
<br>
trouble. Basically functions like pthread_mutex_lock imply that all<br>
memory is changed to the compiler, and thus need to be reloaded.<br>
<span><font color=3D"#888888"><br></font></span></blockquote><div>Well, I&#=
39;ve said before and I might be alone, but I disagree with you. The compil=
er is under no requirement to reload (*a) because a lock was changed. It do=
es, but it doesn&#39;t have to. It&#39;s fine if you guys don&#39;t want to=
 change it. It may never be a problem with gcc.<br><br>This is the definiti=
on of pthread_mutex_lock() in glibc. There aren&#39;t any magic hints that =
this invalidates memory:<br></div><div><br>extern int pthread_mutex_lock (p=
thread_mutex_t *__mutex)<br>__THROWNL __nonnull ((1));<br><br></div><div>TH=
OWNL is attribute((nothrow)).<br><br></div><br></div></div></div>

--001a1133c9e013b1ee050fec90d4--

--===============1412398589==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1412398589==--
