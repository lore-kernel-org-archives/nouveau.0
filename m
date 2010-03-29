From: Stephane Marchesin <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [radeonhd] Re: [Mesa3d-dev] Status of s3tc patent in
	respect to open-source drivers and workarounds
Date: Sun, 28 Mar 2010 21:53:53 -0700
Message-ID: <6a89f9d51003282153l2c20b049s38d94c9691531efa@mail.gmail.com>
References: <4BAF41C0.5010201@warriorhut.org>
	<e7bd23c31003281707v4d8107a8ka4330ce69ba5b322@mail.gmail.com>
	<4BB004EB.5080109@warriorhut.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1291658942=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4BB004EB.5080109-nc9XehmSRdrhF+sknpXCvw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: SpliFF <spliff-nc9XehmSRdrhF+sknpXCvw@public.gmane.org>
Cc: Corbin Simpson <mostawesomedude-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, radeonhd-stAJ6ESoqRxg9hUCZPvPmw@public.gmane.org, mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1291658942==
Content-Type: multipart/alternative; boundary=0016368e295dc05e5c0482e94c32

--0016368e295dc05e5c0482e94c32
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Mar 28, 2010 at 18:39, SpliFF <spliff-nc9XehmSRdrhF+sknpXCvw@public.gmane.org> wrote:

> On 03/29/10 11:07, Corbin Simpson wrote:On 03/29/10 11:07, Corbin
> Simpson wrote:
> > Since neither you nor Andrew are lawyers, I would kindly ask that you
> > refrain from attempting to provide legal advice. :3
> >
>
> If you know I'm not a lawyer (and my nick should be the first clue) then
> it isn't an issue is it? As for Andrew you'll have to ask him that
> yourself. Since it's also clear I'm not a mesa3d developer you assume no
> legal responsibility for what I say either and you are under no
> responsibility to listen.
>
> Which is all irrelevant anyway because proposing to create a new
> invention is not legal advice; it's an engineering suggestion. I
> describe the patent claims and Andrews interpretation of patent law only
> to emphasise things that a hypothetical new invention should *not* do.
>
> > The scant legal advice that *has* been obtained suggests that the
> > current course of action, wherein S3TC is not advertised without the
> > aid of an external library or a configuration option force-enabling
> > it, is the best course of action. I for one would prefer to have
> > firsthand legal advice before making any changes, although I am not a
> > lawyer and cannot provide legal advice.
> >
>
> Solves nothing other than push the legal burden onto someone else
> (distributions) who further push the burden to the end-user. All of
> which makes it harder to use. As far as I can tell the official site of
> the "external project" claims the project is unmaintained and at any
> rate it's rather unpopular with certain distributions for reasons that
> should be obvious.
>
> I'm certainly not sugesting that knowingly infringing material be added
> to mesa3d. What I'm suggesting is that some resources be made available
> to write a new *non-infringing* decompressor and that it seems likely
> the community may have overestimated the difficulty of the task. I often
> wonder if the OSS community isn't becoming a victim of its own FUD. If
> we need lawyers before writing code then we can't write ANY code and we
> might as well all do something else.
>
> I want to reiterate that it is my belief (as in non-legal opinion) that
> the s3tc patent does not cover the s3tc format itself, or even specific
> algorithms. What it covers appear to be specific methods that can be
> used to encode it and some steps that can be used to decode it. The
> issue is whether those claimed steps are the ONLY way of achieving an
> acceptable result and I honestly don't think they are. You are free to
> form your own opinion on that point. Then again if the community plays
> ostrich and assumes the problem is now solved - and worse concludes that
> any discussion of it is heresy - then how can a new invention be
> developed (at least collaboratively)? Unfortunately I lack the indepth
> knowledge of mesa3d internals and s3tc processing requirements required
> to invent such a thing myself.
>

I made a similar proposal a couple of years ago. Basically the patent
explicits the vector quantization scheme, and I wanted to go with another
vector quantization scheme instead. Also that would probably mean better
overall compressed texture quality (the quantization algorithm used in the
patent is approximate to say the least) but longer compression times.

The core issue is that some people do not want to see this code in mesa in
whatever form, because they're afraid of lawsuits. Rumour has it that VIA
told them that they would sue. And the same things happened with SGI for the
float patents by the way. So blame VIA and SGI for their anti-oss behaviour
instead. For example next time you see a motherboard with a VIA chipset,
think twice...

Stephane

--0016368e295dc05e5c0482e94c32
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Sun, Mar 28, 2010 at 18:39, SpliFF <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:spliff-nc9XehmSRdrhF+sknpXCvw@public.gmane.org">spliff@warrior=
hut.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padd=
ing-left: 1ex;">
On 03/29/10 11:07, Corbin Simpson wrote:On 03/29/10 11:07, Corbin<br>
<div class=3D"im">Simpson wrote:<br>
&gt; Since neither you nor Andrew are lawyers, I would kindly ask that you<=
br>
&gt; refrain from attempting to provide legal advice. :3<br>
&gt;<br>
<br>
</div>If you know I&#39;m not a lawyer (and my nick should be the first clu=
e) then<br>
it isn&#39;t an issue is it? As for Andrew you&#39;ll have to ask him that<=
br>
yourself. Since it&#39;s also clear I&#39;m not a mesa3d developer you assu=
me no<br>
legal responsibility for what I say either and you are under no<br>
responsibility to listen.<br>
<br>
Which is all irrelevant anyway because proposing to create a new<br>
invention is not legal advice; it&#39;s an engineering suggestion. I<br>
describe the patent claims and Andrews interpretation of patent law only<br=
>
to emphasise things that a hypothetical new invention should *not* do.<br>
<div class=3D"im"><br>
&gt; The scant legal advice that *has* been obtained suggests that the<br>
&gt; current course of action, wherein S3TC is not advertised without the<b=
r>
&gt; aid of an external library or a configuration option force-enabling<br=
>
&gt; it, is the best course of action. I for one would prefer to have<br>
&gt; firsthand legal advice before making any changes, although I am not a<=
br>
&gt; lawyer and cannot provide legal advice.<br>
&gt;<br>
<br>
</div>Solves nothing other than push the legal burden onto someone else<br>
(distributions) who further push the burden to the end-user. All of<br>
which makes it harder to use. As far as I can tell the official site of<br>
the &quot;external project&quot; claims the project is unmaintained and at =
any<br>
rate it&#39;s rather unpopular with certain distributions for reasons that<=
br>
should be obvious.<br>
<br>
I&#39;m certainly not sugesting that knowingly infringing material be added=
<br>
to mesa3d. What I&#39;m suggesting is that some resources be made available=
<br>
to write a new *non-infringing* decompressor and that it seems likely<br>
the community may have overestimated the difficulty of the task. I often<br=
>
wonder if the OSS community isn&#39;t becoming a victim of its own FUD. If<=
br>
we need lawyers before writing code then we can&#39;t write ANY code and we=
<br>
might as well all do something else.<br>
<br>
I want to reiterate that it is my belief (as in non-legal opinion) that<br>
the s3tc patent does not cover the s3tc format itself, or even specific<br>
algorithms. What it covers appear to be specific methods that can be<br>
used to encode it and some steps that can be used to decode it. The<br>
issue is whether those claimed steps are the ONLY way of achieving an<br>
acceptable result and I honestly don&#39;t think they are. You are free to<=
br>
form your own opinion on that point. Then again if the community plays<br>
ostrich and assumes the problem is now solved - and worse concludes that<br=
>
any discussion of it is heresy - then how can a new invention be<br>
developed (at least collaboratively)? Unfortunately I lack the indepth<br>
knowledge of mesa3d internals and s3tc processing requirements required<br>
to invent such a thing myself.<br></blockquote><div><br>I made a similar pr=
oposal a couple of years ago. Basically the patent explicits the vector qua=
ntization scheme, and I wanted to go with another vector quantization schem=
e instead. Also that would probably mean better overall compressed texture =
quality (the quantization algorithm used in the patent is approximate to sa=
y the least) but longer compression times.<br>
<br>The core issue is that some people do not want to see this code in mesa=
 in whatever form, because they&#39;re afraid of lawsuits. Rumour has it th=
at VIA told them that they would sue. And the same things happened with SGI=
 for the float patents by the way. So blame VIA and SGI for their anti-oss =
behaviour instead. For example next time you see a motherboard with a VIA c=
hipset, think twice...<br>
<br></div></div>Stephane<br><br>

--0016368e295dc05e5c0482e94c32--

--===============1291658942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1291658942==--
