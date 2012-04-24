From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: rendering problems with latest ddx driver (nv50)
Date: Tue, 24 Apr 2012 20:51:30 +0200
Message-ID: <4F96F632.1090608@free.fr>
References: <CAGZ4FETeOjfQD5DV1+=sx4NCk9xuMrvQhH1fS-TrmoVRiMc7mQ@mail.gmail.com>
	<4F96F2C8.900@free.fr>
	<CAGZ4FERhLZdXm51i4wbDxNNjU1g3SP6uX6399eKtR7LRWO_PQw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1748456652=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAGZ4FERhLZdXm51i4wbDxNNjU1g3SP6uX6399eKtR7LRWO_PQw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============1748456652==
Content-Type: multipart/alternative;
 boundary="------------000402000208050207050407"

This is a multi-part message in MIME format.
--------------000402000208050207050407
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Le 24/04/2012 20:49, Maarten Maathuis a =E9crit :
> On Tue, Apr 24, 2012 at 8:36 PM, Martin Peres<martin.peres-GANU6spQydw@public.gmane.org>  wr=
ote:
>> Le 24/04/2012 20:14, Maarten Maathuis a =E9crit :
>>
>>> Do you get rendering errors also when using a nv50 class gpu? I seem
>>> to get them in firefox.
>>>
>>> I also noticed a huge amount of failures when running rendercheck -t
>>> gradients, which i find odd, because they are not supposed to be
>>> accelerated.
>> Hi,
>>
>> By any chance, are you using cairo 1.12? If so, try downgrading to cai=
ro
>> 1.10.
>>
>> Martin
> No, i'm using cairo 1.10.2. Also rendercheck isn't affected by cairo.
> The last driver upgrade included at least the migration to the new
> libdrm and everything that came after it. That's when the rendering
> corruption started.
>
Right, I was under the asumption that both issues were un-related.

I guess you are using the latest ddx which does accelerate solid pictures=
.
Have you tried resetting to this commit ?=20
http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=3Dec019=
b3a50475b7ff1b5e0a5dbe14e5ef677bd9e

Please keep us posted

--------------000402000208050207050407
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Le 24/04/2012 20:49, Maarten Maathuis a &eacute;crit&nbsp;:
    <blockquote
cite="mid:CAGZ4FERhLZdXm51i4wbDxNNjU1g3SP6uX6399eKtR7LRWO_PQw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org"
      type="cite">
      <pre wrap="">On Tue, Apr 24, 2012 at 8:36 PM, Martin Peres <a class="moz-txt-link-rfc2396E" href="mailto:martin.peres-GANU6spQydw@public.gmane.org">&lt;martin.peres-GANU6spQydw@public.gmane.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Le 24/04/2012 20:14, Maarten Maathuis a &eacute;crit :

</pre>
        <blockquote type="cite">
          <pre wrap="">Do you get rendering errors also when using a nv50 class gpu? I seem
to get them in firefox.

I also noticed a huge amount of failures when running rendercheck -t
gradients, which i find odd, because they are not supposed to be
accelerated.
</pre>
        </blockquote>
        <pre wrap="">
Hi,

By any chance, are you using cairo 1.12? If so, try downgrading to cairo
1.10.

Martin
</pre>
      </blockquote>
      <pre wrap="">
No, i'm using cairo 1.10.2. Also rendercheck isn't affected by cairo.
The last driver upgrade included at least the migration to the new
libdrm and everything that came after it. That's when the rendering
corruption started.

</pre>
    </blockquote>
    Right, I was under the asumption that both issues were un-related.<br>
    <br>
    I guess you are using the latest ddx which does accelerate solid
    pictures.<br>
    Have you tried resetting to this commit ?
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <a
href="http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=ec019b3a50475b7ff1b5e0a5dbe14e5ef677bd9e">http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/commit/?id=ec019b3a50475b7ff1b5e0a5dbe14e5ef677bd9e</a><br>
    <br>
    Please keep us posted<br>
  </body>
</html>

--------------000402000208050207050407--

--===============1748456652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1748456652==--
