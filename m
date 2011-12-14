From: "csolisr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <csolisr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nouveau should create a script to download the
 bleeding-edge version
Date: Wed, 14 Dec 2011 17:04:26 -0600
Message-ID: <CALOQyNO052JaWb7f9=+S06SZ=EhPvRTejb2GSLfnAHSzxX6gzg@mail.gmail.com>
References: <CALOQyNPw7Q5dKu0t+Y0ip_zBA6BzAjZVhNscw5m43n5LYzUdWA@mail.gmail.com>
	<op.v6h24z008t7z9u@arch-laptop>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1578045668=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <op.v6h24z008t7z9u@arch-laptop>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1578045668==
Content-Type: multipart/alternative; boundary=f46d04190e52ea646804b415641b

--f46d04190e52ea646804b415641b
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Well, even with that particular PPA, my screen is detected as 1024x768
instead of its true 1366x768. The last tweak I tried was to force it to
work with xorg.conf but the GUI would stop loading completely instead
(until the xorg.conf file was reset, that is).
- Carlos Sol=EDs


2011/12/14 Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

> On Wed, 14 Dec 2011 21:43:13 -0000, csolisr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org <csolisr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
>
>  I've tried to use Nouveau several times, with several operative systems
>> (Ubuntu, Mint, Trisquel). Seemingly, the versions of Nouveau are too old=
,
>> since my screen is detected as being smaller than it is. All in all, I
>> tried to follow the instructions to build from scratch (in order to have
>> the really latest version), and failed. Would somebody mind to create a
>> script to download the sources, compile them and install them?
>> - Carlos Sol=EDs
>>
>
> Hi Carlos
>
> To the best of my knowledge, an old version of nouveau should not cause
> your screen to be "detected as being smaller than it is"
>
> Nevertheless such a script is quite a tricky thing to make due to the
> specific "requirements" every person/ GNU Linux distribution has.
>
> I have personally worked out a script to build and install the latest
> nouveau and I've got fed up with it due to the various hacks that had to
> be used - read "Debian(Ubuntu) is using nasty hacks when compiling their
> libdrm, kernel"
>
> Thus I would advise you
>
> * If you wish to use Ubuntu/Mint try the latest packages from
> xorg-edgers[1]
> should be up to scratch
>
> * Try another Linux distribution (such as Arch, Gentoo, etc.) where you c=
an
> easily rebuild everything from git
>
> Regards
> Emil
>
> [1] https://launchpad.net/~xorg-**edgers/+archive/ppa<https://launchpad.n=
et/%7Exorg-edgers/+archive/ppa>
>

--f46d04190e52ea646804b415641b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Well, even with that particular PPA, my screen is detected as 1024x768 inst=
ead of its true 1366x768. The last tweak I tried was to force it to work wi=
th xorg.conf but the GUI would stop loading completely instead (until the x=
org.conf file was reset, that is).<br clear=3D"all">

- Carlos Sol=EDs<br>
<br><br><div class=3D"gmail_quote">2011/12/14 Emil Velikov <span dir=3D"ltr=
">&lt;<a href=3D"mailto:emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org<=
/a>&gt;</span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">

<div class=3D"HOEnZb"><div class=3D"h5">On Wed, 14 Dec 2011 21:43:13 -0000,=
 <a href=3D"mailto:csolisr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">csolisr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</=
a> &lt;<a href=3D"mailto:csolisr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank">csolisr@gmail=
.com</a>&gt; wrote:<br>


<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
I&#39;ve tried to use Nouveau several times, with several operative systems=
<br>
(Ubuntu, Mint, Trisquel). Seemingly, the versions of Nouveau are too old,<b=
r>
since my screen is detected as being smaller than it is. All in all, I<br>
tried to follow the instructions to build from scratch (in order to have<br=
>
the really latest version), and failed. Would somebody mind to create a<br>
script to download the sources, compile them and install them?<br>
- Carlos Sol=EDs<br>
</blockquote>
<br></div></div>
Hi Carlos<br>
<br>
To the best of my knowledge, an old version of nouveau should not cause<br>
your screen to be &quot;detected as being smaller than it is&quot;<br>
<br>
Nevertheless such a script is quite a tricky thing to make due to the<br>
specific &quot;requirements&quot; every person/ GNU Linux distribution has.=
<br>
<br>
I have personally worked out a script to build and install the latest<br>
nouveau and I&#39;ve got fed up with it due to the various hacks that had t=
o<br>
be used - read &quot;Debian(Ubuntu) is using nasty hacks when compiling the=
ir<br>
libdrm, kernel&quot;<br>
<br>
Thus I would advise you<br>
<br>
* If you wish to use Ubuntu/Mint try the latest packages from xorg-edgers[1=
]<br>
should be up to scratch<br>
<br>
* Try another Linux distribution (such as Arch, Gentoo, etc.) where you can=
<br>
easily rebuild everything from git<br>
<br>
Regards<br>
Emil<br>
<br>
[1] <a href=3D"https://launchpad.net/%7Exorg-edgers/+archive/ppa" target=3D=
"_blank">https://launchpad.net/~xorg-<u></u>edgers/+archive/ppa</a><br>
</blockquote></div><br><style>img, #cubbies-overlay{ -moz-transition-proper=
ty: margin, box-shadow, z-index; -moz-transition-duration: 0.1s; -webkit-tr=
ansition-property: margin, box-shadow, z-index; -webkit-transition-duration=
: 0.1s; }
.cubbies-selected{ z-index: 9999; box-shadow: 3px 3px 8px -1px blue !import=
ant; cursor: pointer !important; margin: -3px 3px 3px -3px; }
.cubbies-selected:active{ box-shadow: 2px 2px 5px -1px darkblue !important;=
 margin: -1px 1px 1px -1px; }
#cubbies-overlay{ position: fixed; z-index: 9999; bottom: 30px; left: 30px;=
 box-shadow: 0 2px 3px rgba(0,0,0,0.8); border: none; }
#cubbies-overlay:hover{ box-shadow: 0 2px 3px rgb(0,0,0); }</style>

--f46d04190e52ea646804b415641b--

--===============1578045668==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1578045668==--
