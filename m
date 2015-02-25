From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/2] nouveau: Do not add most bo's to the
 global bo list.
Date: Wed, 25 Feb 2015 10:28:22 -0600
Message-ID: <CAEk2StmOwhMecfkNsVj7j3PbmnazNQ7CAPMs-VNvv-QtrSEmCQ@mail.gmail.com>
References: <1424768511-25156-1-git-send-email-maarten.lankhorst@ubuntu.com>
 <1424768511-25156-2-git-send-email-maarten.lankhorst@ubuntu.com>
 <CACvgo53DRfa9JkweCRVB9va7oD5RoKVM9KFkXk99rQwO=vxi0g@mail.gmail.com>
 <54EDE354.6030700@ubuntu.com>
 <CAEk2Stmr7k+Tq_JH+9iuo8iz+NouhJ8tG3RaX9vJA-FHzewBAw@mail.gmail.com>
 <54EDE51B.1070000@ubuntu.com>
 <CAEk2Stk1x86MM0x6FLFutgBGC+0ksG+VKFLoEH=z+zLGKvYyRg@mail.gmail.com>
 <54EDED9B.3000303@ubuntu.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0556821224=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <54EDED9B.3000303-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Maarten Lankhorst <maarten.lankhorst-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Cc: ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0556821224==
Content-Type: multipart/alternative; boundary=001a113a967cc05fd4050fec1f07

--001a113a967cc05fd4050fec1f07
Content-Type: text/plain; charset=UTF-8

So you're saying a compiler can optimize:

>
> - statement with memory access
> - read memory barrier
> - statement with memory access
>
> To drop the second statement? I would worry about your definition of
> memory barrier then..
>
This is tricky, but I think you're mixing up the general case with the
actual code you have. In general, you are pointing to this example:

- Read memory location 1 (asm level)
- RMB
- Read memory location 2 (asm level)

In this case, you are precisely correct, the compiler will not reorder the
reads, and the CPU won't either.

What you actually have is this:
- Access memory location 1 (C code)
- RMB
- Acesss memory location 1 (C code)

I say "access" here because looking at the C code, not assembly. You have
this:

read nvbo->head.next
RMB
read nvbo->head.next

This only works if you can guarantee that the compiler will actually
generate a MOV instruction for the second read. If the variable isn't
marked as "volatile", the compiler has no requirement to. Barriers control
ordering and when a variable can be loaded, but you've already loaded it.
You need to reload the variable, but you haven't shown the compiler a
reason why it should. "Volatile" is a reason why.

I tested this code on gcc:

if(globalFlag) {
    math...
    if(globalFlag) {
        more math
    }
}

It only tests once. If you replace "math" with printf(), it retests the
value of globalFlag. Printf(), which has absolutely no barrier semantics at
all. In other words, GCC conservatively will assume any function call will
require a reload because it could modify anything. The code will work as-is.

Obviously, pthread_mutex_lock() does not modify the value of
`nvbo->head.next`. Once GCC knows that (and maybe other compilers already
do), perhaps with LTO, it doesn't have to generate a second load. If you
ever switch to an inlined lock or different compiler that understands that,
your code will break. I suggest you simply do the right thing the first
time and cast the pointer to volatile since you're treating the value as if
it is volatile (i.e. changing outside of the scope of the compiler's
knowledge).

Patrick

--001a113a967cc05fd4050fec1f07
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So you&#39;re saying a compiler can optimize:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
- statement with memory access<br>
- read memory barrier<br>
- statement with memory access<br>
<br>
To drop the second statement? I would worry about your definition of memory=
 barrier then..<span><font color=3D"#888888"><br></font></span></blockquote=
><div>This is tricky, but I think you&#39;re mixing up the general case wit=
h the actual code you have. In general, you are pointing to this example:<b=
r><br></div><div>- Read memory location 1 (asm level)<br></div><div>- RMB<b=
r></div><div>- Read memory location 2 (asm level)<br><br></div><div>In this=
 case, you are precisely correct, the compiler will not reorder the reads, =
and the CPU won&#39;t either.<br></div><div><br></div><div>What you actuall=
y have is this:<br></div><div><div>- Access memory location 1 (C code)<br><=
/div><div>- RMB<br></div>- Acesss memory location 1 (C code)<br></div><div>=
<br>I say &quot;access&quot; here because looking at the C code, not assemb=
ly. You have this:<br><br></div><div>read nvbo-&gt;head.next<br></div><div>=
RMB<br><div>read nvbo-&gt;head.next<br></div><br></div><div>This only works=
 if you can guarantee that the compiler will actually generate a MOV instru=
ction for the second read. If the variable isn&#39;t marked as &quot;volati=
le&quot;, the compiler has no requirement to. Barriers control ordering and=
 when a variable can be loaded, but you&#39;ve already loaded it. You need =
to reload the variable, but you haven&#39;t shown the compiler a reason why=
 it should. &quot;Volatile&quot; is a reason why.<br><br></div><div>I teste=
d this code on gcc:<br><br></div><div>if(globalFlag) {<br></div><div>=C2=A0=
=C2=A0=C2=A0 math...<br></div><div>=C2=A0=C2=A0=C2=A0 if(globalFlag) {<br><=
/div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 more math<br>=C2=A0=C2=
=A0=C2=A0 }<br>}<br></div><br></div><div class=3D"gmail_quote">It only test=
s once. If you replace &quot;math&quot; with printf(), it retests the value=
 of globalFlag. Printf(), which has absolutely no barrier semantics at all.=
 In other words, GCC conservatively will assume any function call will requ=
ire a reload because it could modify anything. The code will work as-is.<br=
><br>Obviously, pthread_mutex_lock() does not modify the value of `nvbo-&gt=
;head.next`. Once GCC knows that (and maybe other compilers already do), pe=
rhaps with LTO, it doesn&#39;t have to generate a second load. If you ever =
switch to an inlined lock or different compiler that understands that, your=
 code will break. I suggest you simply do the right thing the first time an=
d cast the pointer to volatile since you&#39;re treating the value as if it=
 is volatile (i.e. changing outside of the scope of the compiler&#39;s know=
ledge).<br><br></div><div class=3D"gmail_quote">Patrick<br></div><div class=
=3D"gmail_quote"><div><br></div><div><br><br></div></div></div></div>

--001a113a967cc05fd4050fec1f07--

--===============0556821224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0556821224==--
