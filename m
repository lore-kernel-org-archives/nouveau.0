From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] nouveau: Do not add most bo's to the
 global bo list.
Date: Wed, 25 Feb 2015 13:04:10 -0600
Message-ID: <CAEk2StkquQkBeQfn-coB3EiTLnhecSdtFnzvQ2QWzzVx6O=msw@mail.gmail.com>
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
 <CAEk2St=hxYL7QTnC=7=EnAyD8Bw4KJER4Dd+9pYKYckM5m+4Jg@mail.gmail.com>
 <CAKb7UvgnB-Tvy1EFF-8ERfOFUBGCzBbPjL0Yv1TZAWRm1Be0wg@mail.gmail.com>
 <54EE02A8.2040004@canonical.com>
 <CAEk2St=0LWc-E-O-2DOHWvDtQYJiRe=+7yz7UaGy2KWNTCsbmA@mail.gmail.com>
 <54EE0C88.4010509@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0512330060=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <54EE0C88.4010509-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Maarten Lankhorst <maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0512330060==
Content-Type: multipart/alternative; boundary=001a113a967ceb83ab050fee4cc3

--001a113a967ceb83ab050fee4cc3
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 25, 2015 at 11:55 AM, Maarten Lankhorst <
maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:

>
>
> On 25-02-15 18:26, Patrick Baggett wrote:
> >>
> >>
> >> In general things don't get optimized across function calls, except in
> >> case of inlinable functions.
> >>
> >> And for compiler attributes it's the opposite,__attribute__((const)) and
> >> __attribute((pure)) can be used to indicate some kind of safety to
> optimize
> >> across functions.
> >>
> >> https://gcc.gnu.org/onlinedocs/gcc/Function-Attributes.html
> >>
> >> This is true, but LTO increases the compiler's ability to make these
> sorts
> > of optimizations across function calls and even C source file boundaries
> > without you needing to explicitly mark functions as such.
> Even if pthread_mutex_lock was completely inlined there would still be a
> asm volatile(("" ::: "memory")) in there acting as a complete memory
> barrier to the compiler.
>

I agree with your conclusion and I agree then that the patch can stand
as-is without any changes I proposed. I don't really think "memory barrier"
is the right word though, not that it matters. It's more like "all writes
need to finish and all *previous reads are* *invalid*". Anyways, you've
definitely proven to me that the solution is fine.

--001a113a967ceb83ab050fee4cc3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Feb 25, 2015 at 11:55 AM, Maarten Lankhorst <span dir=3D"ltr">&=
lt;<a href=3D"mailto:maarten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org" target=3D"_blank">maa=
rten.lankhorst-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"><div><div><br>
<br>
On 25-02-15 18:26, Patrick Baggett wrote:<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; In general things don&#39;t get optimized across function calls, e=
xcept in<br>
&gt;&gt; case of inlinable functions.<br>
&gt;&gt;<br>
&gt;&gt; And for compiler attributes it&#39;s the opposite,__attribute__((c=
onst)) and<br>
&gt;&gt; __attribute((pure)) can be used to indicate some kind of safety to=
 optimize<br>
&gt;&gt; across functions.<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://gcc.gnu.org/onlinedocs/gcc/Function-Attributes.=
html" target=3D"_blank">https://gcc.gnu.org/onlinedocs/gcc/Function-Attribu=
tes.html</a><br>
&gt;&gt;<br>
&gt;&gt; This is true, but LTO increases the compiler&#39;s ability to make=
 these sorts<br>
&gt; of optimizations across function calls and even C source file boundari=
es<br>
&gt; without you needing to explicitly mark functions as such.<br>
</div></div>Even if pthread_mutex_lock was completely inlined there would s=
till be a asm volatile((&quot;&quot; ::: &quot;memory&quot;)) in there acti=
ng as a complete memory barrier to the compiler.<br></blockquote><div><br><=
/div><div>I agree with your conclusion and I agree then that the patch can =
stand as-is without any changes I proposed. I don&#39;t really think &quot;=
memory barrier&quot; is the right word though, not that it matters. It&#39;=
s more like &quot;all writes need to finish and all <i>previous reads are</=
i> <i>invalid</i>&quot;. Anyways, you&#39;ve definitely proven to me that t=
he solution is fine.<br></div><div>=C2=A0<br></div></div></div></div>

--001a113a967ceb83ab050fee4cc3--

--===============0512330060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0512330060==--
