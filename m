From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH] clk: allow config option to enable reclocking
Date: Sat, 17 May 2014 13:54:18 +1000
Message-ID: <CACAvsv7o2Wj7-D0bdB3SBG-TisG-E2PebfSuAWxYCxt6_meiSw@mail.gmail.com>
References: <1400258565-28941-1-git-send-email-imirkin@alum.mit.edu>
 <CACAvsv5an3rkOtk=rPixGcunadZgRDQsXrEnozO65v8uTwaw3A@mail.gmail.com>
 <CAKb7Uvjk0B-4F+OdydstWp6C52GoGu289V0RkrfBLeURmpD+Bg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0253765542=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAKb7Uvjk0B-4F+OdydstWp6C52GoGu289V0RkrfBLeURmpD+Bg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

--===============0253765542==
Content-Type: multipart/alternative; boundary=001a11c2b73e110dac04f9907c6f

--001a11c2b73e110dac04f9907c6f
Content-Type: text/plain; charset=UTF-8

On 17 May 2014 13:39, "Ilia Mirkin" <imirkin@alum.mit.edu> wrote:
>
> On Fri, May 16, 2014 at 11:17 PM, Ben Skeggs <skeggsb@gmail.com> wrote:
> > On 17 May 2014 02:43, "Ilia Mirkin" <imirkin@alum.mit.edu> wrote:
> >>
> >> Adds a NvReclock boolean option to allow the user to enable (or
disable)
> >> reclocking. All chipsets default to off, except NVAA/NVAC, which are
> >> reportedly complete.
> > Hey Ilia,
> >
> > I think I've expressed my thoughts on this previously via IRC, but let
me
> > stick them here too so there's a record of the current state...
> >
> > For nvaa/nvac, yes, let's enable it by default. It should, apparently,
be
> > good enough that it has a decent chance of working.  It's not like we're
> > attempting anything automatic yet, so, this won't break anything for
people
> > who aren't trying..
> >
> > I'm on the fence about Kepler. It actually might work to some extent in
a
> > decent number of cases already, there's potentially some severe issues
even
> > with engine clocks on some  boards that I'm aware of, so it's not just a
> > memory reclocking worry here.
> >
> > That said, it has a good chance of working for some people. So.
Thoughts?
> > I'm also talking making "NvMemExec" default on here too.  Again,
causing a
> > fuck-up will still require direct user action.
> >
> > For the rest (Hm, except maybe nv40, a lot will probably be ok..)
There's
> > *very* little chance memory reclocking will work, even on the systems
where
> > it used to. The code is far less complete, as it was broken in general,
and
> > I haven't yet had the time to *properly* reverse engineer the sequence
> > needed to stably reclock memory.  Kepler is the only implementation
where
> > that's even been started.  Tl;dr - unless you're working on the code for
> > Tesla/Fermi, there's zero point even trying it. So, the block should
stay.
>
> Meh. It works on my G98, for one of the perf levels. I'm sure there
> are lots of tesla's where it totally wouldn't work, but as long as it
> works on some of them, why not let people try?
Because we don't even *try* to handle timing changes, which, for the vast
majority perflvl changes, will not end well.

This is more than a "mere" bug or slight bit of missing handling. It's a
*very* important chunk of the process that's simply missing.

This is the difference between the Kepler code. Kepler might work, this
probably will not, unless you're very very lucky.

>
> >
> > Personally, as you know, I'm more comfortable leaving it developer-only
> > still (except nvaa/nvac) until it at least works on all our own boards
> > without any major known missing bits..  But yeah, for the ones mentioned
> > above, I guess it's a possibility if people *really* want...
>
> I'm of the opposite opinion... if it works on _some_ of our boards, we
> should let people play with it. Why lock it away? Unless there's a
> real danger of it bricking the card. I've never heard of our code
> doing that, and given the way that you were RE'ing this stuff, I doubt
> that there's anything we can do (within reason) to brick the card.
This is why I'm "Hmm, maybe" on Kepler's code.  Again, the rest isn't even
expected to work at all yet.  I'm surprised it did for you.. Were the
clocks you chose close to the boot clocks by chance?

>
> >
> > I can only envision that if we allow this even just in the places it's
known
> > to be partially broken, certain sensationalist, er, people, will feel
the
> > need to test and complain about how broken it all really is... And then
> > retest on a regular basis, despite there having been *zero* work done
> > because no-one has the time, and then complain about the exact same
thing
> > AGAIN! (WHOA.. I'm done ranting now :p)
>
> I would prefer to avoid our decisions being directed by a small number
> of loud complaining users, and instead to try to do things that will
> serve the real users. Those complaints are only as loud as you think
> they are -- you can also think of them as an automated tester that
> puts its results into prose.
Yes, this was more of a rant than an argument against the idea.

Prior to 3.13, we allowed people to try
> reclocking on nv40 and nv50, and I didn't see some huge quantity of
> complaints about how it didn't work perfectly. Perhaps you saw those
> at first, but I think the expectation by now is that it won't work.
> Especially if it's behind a config option.
Yes, but now, the code is lacking the huge chunk of functionality and
probably won't work.  Nv40 is probably in a similar state to before,
however. So, again with the "maybe" there too.

>
> I have no idea what NvMemExec _really_ is doing, so I left it alone. I
> assume that the majority of what my patch enables is actually engine
> reclocking, not memory reclocking. So to get both, people would have
> to flip both flags? Or is there more to it?
I use it during development to allow independent testing or engine clock
code without the more faulty memory code causing problems. The option
prevents the memory recording scripts from being executed.

Ben.

>
>   -ilia

--001a11c2b73e110dac04f9907c6f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On 17 May 2014 13:39, &quot;Ilia Mirkin&quot; &lt;<a href=3D=
"mailto:imirkin@alum.mit.edu">imirkin@alum.mit.edu</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, May 16, 2014 at 11:17 PM, Ben Skeggs &lt;<a href=3D"mailto:ske=
ggsb@gmail.com">skeggsb@gmail.com</a>&gt; wrote:<br>
&gt; &gt; On 17 May 2014 02:43, &quot;Ilia Mirkin&quot; &lt;<a href=3D"mail=
to:imirkin@alum.mit.edu">imirkin@alum.mit.edu</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Adds a NvReclock boolean option to allow the user to enable (=
or disable)<br>
&gt; &gt;&gt; reclocking. All chipsets default to off, except NVAA/NVAC, wh=
ich are<br>
&gt; &gt;&gt; reportedly complete.<br>
&gt; &gt; Hey Ilia,<br>
&gt; &gt;<br>
&gt; &gt; I think I&#39;ve expressed my thoughts on this previously via IRC=
, but let me<br>
&gt; &gt; stick them here too so there&#39;s a record of the current state.=
..<br>
&gt; &gt;<br>
&gt; &gt; For nvaa/nvac, yes, let&#39;s enable it by default. It should, ap=
parently, be<br>
&gt; &gt; good enough that it has a decent chance of working. =C2=A0It&#39;=
s not like we&#39;re<br>
&gt; &gt; attempting anything automatic yet, so, this won&#39;t break anyth=
ing for people<br>
&gt; &gt; who aren&#39;t trying..<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m on the fence about Kepler. It actually might work to some=
 extent in a<br>
&gt; &gt; decent number of cases already, there&#39;s potentially some seve=
re issues even<br>
&gt; &gt; with engine clocks on some =C2=A0boards that I&#39;m aware of, so=
 it&#39;s not just a<br>
&gt; &gt; memory reclocking worry here.<br>
&gt; &gt;<br>
&gt; &gt; That said, it has a good chance of working for some people. So. T=
houghts?<br>
&gt; &gt; I&#39;m also talking making &quot;NvMemExec&quot; default on here=
 too. =C2=A0Again, causing a<br>
&gt; &gt; fuck-up will still require direct user action.<br>
&gt; &gt;<br>
&gt; &gt; For the rest (Hm, except maybe nv40, a lot will probably be ok..)=
 There&#39;s<br>
&gt; &gt; *very* little chance memory reclocking will work, even on the sys=
tems where<br>
&gt; &gt; it used to. The code is far less complete, as it was broken in ge=
neral, and<br>
&gt; &gt; I haven&#39;t yet had the time to *properly* reverse engineer the=
 sequence<br>
&gt; &gt; needed to stably reclock memory. =C2=A0Kepler is the only impleme=
ntation where<br>
&gt; &gt; that&#39;s even been started. =C2=A0Tl;dr - unless you&#39;re wor=
king on the code for<br>
&gt; &gt; Tesla/Fermi, there&#39;s zero point even trying it. So, the block=
 should stay.<br>
&gt;<br>
&gt; Meh. It works on my G98, for one of the perf levels. I&#39;m sure ther=
e<br>
&gt; are lots of tesla&#39;s where it totally wouldn&#39;t work, but as lon=
g as it<br>
&gt; works on some of them, why not let people try?<br>
Because we don&#39;t even *try* to handle timing changes, which, for the va=
st majority perflvl changes, will not end well. </p>
<p dir=3D"ltr">This is more than a &quot;mere&quot; bug or slight bit of mi=
ssing handling. It&#39;s a *very* important chunk of the process that&#39;s=
 simply missing. </p>
<p dir=3D"ltr">This is the difference between the Kepler code. Kepler might=
 work, this probably will not, unless you&#39;re very very lucky.</p>
<p dir=3D"ltr">&gt;<br>
&gt; &gt;<br>
&gt; &gt; Personally, as you know, I&#39;m more comfortable leaving it deve=
loper-only<br>
&gt; &gt; still (except nvaa/nvac) until it at least works on all our own b=
oards<br>
&gt; &gt; without any major known missing bits.. =C2=A0But yeah, for the on=
es mentioned<br>
&gt; &gt; above, I guess it&#39;s a possibility if people *really* want...<=
br>
&gt;<br>
&gt; I&#39;m of the opposite opinion... if it works on _some_ of our boards=
, we<br>
&gt; should let people play with it. Why lock it away? Unless there&#39;s a=
<br>
&gt; real danger of it bricking the card. I&#39;ve never heard of our code<=
br>
&gt; doing that, and given the way that you were RE&#39;ing this stuff, I d=
oubt<br>
&gt; that there&#39;s anything we can do (within reason) to brick the card.=
<br>
This is why I&#39;m &quot;Hmm, maybe&quot; on Kepler&#39;s code.=C2=A0 Agai=
n, the rest isn&#39;t even expected to work at all yet.=C2=A0 I&#39;m surpr=
ised it did for you.. Were the clocks you chose close to the boot clocks by=
 chance? </p>

<p dir=3D"ltr">&gt;<br>
&gt; &gt;<br>
&gt; &gt; I can only envision that if we allow this even just in the places=
 it&#39;s known<br>
&gt; &gt; to be partially broken, certain sensationalist, er, people, will =
feel the<br>
&gt; &gt; need to test and complain about how broken it all really is... An=
d then<br>
&gt; &gt; retest on a regular basis, despite there having been *zero* work =
done<br>
&gt; &gt; because no-one has the time, and then complain about the exact sa=
me thing<br>
&gt; &gt; AGAIN! (WHOA.. I&#39;m done ranting now :p)<br>
&gt;<br>
&gt; I would prefer to avoid our decisions being directed by a small number=
<br>
&gt; of loud complaining users, and instead to try to do things that will<b=
r>
&gt; serve the real users. Those complaints are only as loud as you think<b=
r>
&gt; they are -- you can also think of them as an automated tester that<br>
&gt; puts its results into prose.<br>
Yes, this was more of a rant than an argument against the idea. </p>
<p dir=3D"ltr"> Prior to 3.13, we allowed people to try<br>
&gt; reclocking on nv40 and nv50, and I didn&#39;t see some huge quantity o=
f<br>
&gt; complaints about how it didn&#39;t work perfectly. Perhaps you saw tho=
se<br>
&gt; at first, but I think the expectation by now is that it won&#39;t work=
.<br>
&gt; Especially if it&#39;s behind a config option.<br>
Yes, but now, the code is lacking the huge chunk of functionality and proba=
bly won&#39;t work.=C2=A0 Nv40 is probably in a similar state to before, ho=
wever. So, again with the &quot;maybe&quot; there too. </p>
<p dir=3D"ltr">&gt;<br>
&gt; I have no idea what NvMemExec _really_ is doing, so I left it alone. I=
<br>
&gt; assume that the majority of what my patch enables is actually engine<b=
r>
&gt; reclocking, not memory reclocking. So to get both, people would have<b=
r>
&gt; to flip both flags? Or is there more to it?<br>
I use it during development to allow independent testing or engine clock co=
de without the more faulty memory code causing problems. The option prevent=
s the memory recording scripts from being executed. </p>
<p dir=3D"ltr">Ben. </p>
<p dir=3D"ltr">&gt;<br>
&gt; =C2=A0 -ilia<br>
</p>

--001a11c2b73e110dac04f9907c6f--

--===============0253765542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0253765542==--
