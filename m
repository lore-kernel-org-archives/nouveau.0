From: Jason Ekstrand <jason@jlekstrand.net>
Subject: Re: Chromium - Application-level nouveau blacklist
Date: Sun, 6 Jan 2019 01:37:04 -0600
Message-ID: <CAOFGe95hG=CR2TxCmfeXHKj0zUUmGfPPA-hDui+D2h1dgZKtUQ@mail.gmail.com>
References: <CAKb7UvgPTtc1==f3JtUFG+tQUa0CCdiiCfoBYvMpK6raF=ZwAw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1342907933=="
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7UvgPTtc1==f3JtUFG+tQUa0CCdiiCfoBYvMpK6raF=ZwAw@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: nouveau <nouveau@lists.freedesktop.org>, ML Mesa-dev <mesa-dev@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

--===============1342907933==
Content-Type: multipart/alternative; boundary="00000000000074063f057ec52ee1"

--00000000000074063f057ec52ee1
Content-Type: text/plain; charset="UTF-8"

On Sat, Jan 5, 2019 at 2:40 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> It looks like as of Chromium 71, nouveau is completely blacklisted.
>

That's rather unfortunate. :-(  The intel mesa drivers were also
blacklisted for quite some time a while back.  I'm not really sure what we
did to get blacklisted or what we did to get unblacklisted.


> I don't really see a way back from this, since they don't cite any
> easily reproducible issues, except that some people had some issues
> with indeterminate hardware and indeterminate versions of mesa.
>
> In the bug that triggered this
> (https://bugs.chromium.org/p/chromium/issues/detail?id=876523), where
> I might have slightly lost my cool, they (at the end) suggested that
> we try to make nouveau a first-class citizen with chromium. However I
> will never be able to present concrete evidence that inconcrete issues
> are resolved. I did run the WebGL CTS suite, but that resulted in some
> hangs from the the max-texture-size-equivalent test, and some
> browser-level weirdness after some tests where later tests all fail
> (due to what I have to assume is a browser bug). I don't think I
> managed to properly track down the true reason why. I didn't want to
> reach out to them with such results, as that's just further evidence
> of nouveau not working perfectly.
>

If you want concrete bugs to fix, I highly recommend OpenGL[ES] conformance
tests, dEQP, and the WebGL CTS (which is mostly a re-hash of the OpenGL ES
3.0 CTS).  Google cares quite a bit about driver conformance and are much
more likely to consider nouveau to be high-quality if those test suites are
in good shape.  Years of experience dealing with Google says that dEQP
results speak much louder than philosophical arguments about who should
decide whether or not Chromium should accept the distro GL.  Fortunately
for you, the well funded driver teams (Intel and AMD) have already done a
lot of the painful work of getting a lot of the bugs and "bugs" out of core
mesa and galium.  What's left are likely real back-end driver bugs which
may be affecting some user somewhere so they're worth fixing.


> In the meanwhile, end users are losing accelerated WebGL which in
> practice worked just fine (at least in my usage of it), and probably
> some other functionality.
>
> One idea is to flip GL_VENDOR to some random string if chromium is
> running. I don't like this idea, but I also don't have any great
> alternatives. We can also just take this, as yet-another nail in the
> nouveau coffin.
>

You asked for opinions, so here you go. :-P  In my personal (and rather
disinterested) opinion, I would recommend against such measures.  The last
thing anyone needs is an arms race between nouveau and Chromium teams.  I
think the better short-term thing to do would be to provide some
documentation about WebGL and educate users about Chromium's
--ignore-gpu-blacklist option.  This documentation could go on the mesa
website or, likely more usefully, it could go in various distro wiki
entries about nouveau and/or general nvidia issues.  In the long term,
what's needed is improving nouveau quality and stability and re-building
trust with the Chromium team.  I'm not trying to attack nouveau here but
the fact is that trust has been lost due to an unfortunate history of
mis-filed (against Chromium) bugs.  That trust doesn't get re-built by
nuclear solutions.

--Jason

--00000000000074063f057ec52ee1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, Jan 5,=
 2019 at 2:40 PM Ilia Mirkin &lt;<a href=3D"mailto:imirkin@alum.mit.edu">im=
irkin@alum.mit.edu</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">It looks like as of Chromium 71, nouveau is completely bl=
acklisted.<br></blockquote><div><br></div><div>That&#39;s rather unfortunat=
e. :-(=C2=A0 The intel mesa drivers were also blacklisted for quite some ti=
me a while back.=C2=A0 I&#39;m not really sure what we did to get blacklist=
ed or what we did to get unblacklisted.<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
I don&#39;t really see a way back from this, since they don&#39;t cite any<=
br>
easily reproducible issues, except that some people had some issues<br>
with indeterminate hardware and indeterminate versions of mesa.<br>
<br>
In the bug that triggered this<br>
(<a href=3D"https://bugs.chromium.org/p/chromium/issues/detail?id=3D876523"=
 rel=3D"noreferrer" target=3D"_blank">https://bugs.chromium.org/p/chromium/=
issues/detail?id=3D876523</a>), where<br>
I might have slightly lost my cool, they (at the end) suggested that<br>
we try to make nouveau a first-class citizen with chromium. However I<br>
will never be able to present concrete evidence that inconcrete issues<br>
are resolved. I did run the WebGL CTS suite, but that resulted in some<br>
hangs from the the max-texture-size-equivalent test, and some<br>
browser-level weirdness after some tests where later tests all fail<br>
(due to what I have to assume is a browser bug). I don&#39;t think I<br>
managed to properly track down the true reason why. I didn&#39;t want to<br=
>
reach out to them with such results, as that&#39;s just further evidence<br=
>
of nouveau not working perfectly.<br></blockquote><div><br></div><div>If yo=
u want concrete bugs to fix, I highly recommend OpenGL[ES] conformance test=
s, dEQP, and the WebGL CTS (which is mostly a re-hash of the OpenGL ES 3.0 =
CTS).=C2=A0 Google cares quite a bit about driver conformance and are much =
more likely to consider nouveau to be high-quality if those test suites are=
 in good shape.=C2=A0 Years of experience dealing with Google says that dEQ=
P results speak much louder than philosophical arguments about who should d=
ecide whether or not Chromium should accept the distro GL.=C2=A0 Fortunatel=
y for you, the well funded driver teams (Intel and AMD) have already done a=
 lot of the painful work of getting a lot of the bugs and &quot;bugs&quot; =
out of core mesa and galium.=C2=A0 What&#39;s left are likely real back-end=
 driver bugs which may be affecting some user somewhere so they&#39;re wort=
h fixing.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
In the meanwhile, end users are losing accelerated WebGL which in<br>
practice worked just fine (at least in my usage of it), and probably<br>
some other functionality.<br>
<br>
One idea is to flip GL_VENDOR to some random string if chromium is<br>
running. I don&#39;t like this idea, but I also don&#39;t have any great<br=
>
alternatives. We can also just take this, as yet-another nail in the<br>
nouveau coffin.<br></blockquote><div><br></div><div>You asked for opinions,=
 so here you go. :-P=C2=A0 In my personal (and rather disinterested) opinio=
n, I would recommend against such measures.=C2=A0 The last thing anyone nee=
ds is an arms race between nouveau and Chromium teams.=C2=A0 I think the be=
tter short-term thing to do would be to provide some documentation about We=
bGL and educate users about Chromium&#39;s --ignore-gpu-blacklist option.=
=C2=A0 This documentation could go on the mesa website or, likely more usef=
ully, it could go in various distro wiki entries about nouveau and/or gener=
al nvidia issues.=C2=A0 In the long term, what&#39;s needed is improving no=
uveau quality and stability and re-building trust with the Chromium team.=
=C2=A0 I&#39;m not trying to attack nouveau here but the fact is that trust=
 has been lost due to an unfortunate history of mis-filed (against Chromium=
) bugs.=C2=A0 That trust doesn&#39;t get re-built by nuclear solutions.</di=
v><div><br></div><div>--Jason<br></div></div></div>

--00000000000074063f057ec52ee1--

--===============1342907933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbWVzYS1kZXYg
bWFpbGluZyBsaXN0Cm1lc2EtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL21lc2EtZGV2Cg==

--===============1342907933==--
