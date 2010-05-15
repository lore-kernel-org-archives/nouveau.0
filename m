From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: VDPAU & 8400GS support?
Date: Sat, 15 May 2010 10:50:53 +0200
Message-ID: <AANLkTik5gLzFPKd37aae6vZA8xk8UY9Jf4F64tK8Xvfc@mail.gmail.com>
References: <AANLkTiliVTt8Kmno2lEr_t-Uc0WxNdYbTk3Ws4a3-5JQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTiliVTt8Kmno2lEr_t-Uc0WxNdYbTk3Ws4a3-5JQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Grant <emailgrant-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, May 15, 2010 at 8:21 AM, Grant <emailgrant-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I've been using the proprietary Nvidia driver and I just found out
> about Nouveau. =A0Does it support VDPAU or are there plans to implement
> it? =A0Does it support the 8400GS card?
>

VDPAU is not supported.

From what I've seen on IRC, it seems like a big mess, with each card
family having (several?) different video decode engine.
The only work I know about is an initial support for mpeg2 decode
engine on nv40 :
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?h=3Dnvfx-vpe&id=3D538=
d6ef8aac1cd861f6336e24e79a315fe58aba0
And afaik, the other engines are mostly unknown (no RE and no code).

Some of these details could be wrong, in that case hopefully someone
can correct me :)

About 8400GS, I suppose it's supported as well as any nv50 card, so
look at the nv50 column to see what to expect :
http://nouveau.freedesktop.org/wiki/FeatureMatrix


Below the main IRC discussion I read about video engines.

23:02 < mwk> pre-NV50 only have b000, but maybe some have f000. NV50
has b000 and f000. NV84-NV96 and NVA0 have b000, 102000, 103000. NV98,
NVAA, NVAC have 84000, 85000, 86000, 87000. NVA3-NVA8 have 104000.
23:02 < mwk> NVC0 has at least 84000, 86000, 104000, 105000.
23:02 < mwk> confusing enough already?
23:03 < shining> calim: ok thanks, sent
23:03 < mwk> 5 engines, just found 85000. 87000 probably exists too.
23:04 < calim> mwk: yes; and my CPU says it doesn't need all this
fancy video decode stuff
23:04 -!- hramrach [debian-tor@gateway/tor-sasl/hramrach] has joined #nouve=
au
23:06 < mwk> how about laptops?
23:07 < mwk> dedicated videodec could be much more power-efficient than a c=
pu...
23:13 < mwk> 87000 is gone... so that'd be 5 vdec engines. unless that
180000 is vdec too. but probably not.
23:14 -!- calim [~chr-BMyq/6P8mq02cXP3M/L8VA@public.gmane.org] has quit [Quit: leaving]
23:16 < ymanton> no point in RE-ing them if you dont have an api to
use them from yet.
23:16 < mwk> and API is supposed to appear out of nowhere?
23:17 < mwk> if there's no API... it's all free software, let's just
make a mplayer plugin that uses this stuff
23:19 < ymanton> well, theyd never accept such a wart, theyll tell you
to go implement vdpau. an mplayer plugin would basically look like
vdpau anyway
23:19 < mwk> so let's implement vdpau.
23:22 < ymanton> if i had more time and wasnt always playing catch up
with gallium id have basic vdpau up, but a few hours a week is all i
can spare. and jb17bsome has vpe patches sitting in a kernel branch
already
23:22 < jb17bsome> Doesn't vdpau do the entire decode? So, we would
have to implement a full decoder in gallium.  Doable, yes.
23:23 < jb17bsome> However, that would take some time.  I am not sure
how many vdpau stages are done in sw versus hw, etc.
23:24 < ymanton> jb17bsome: yeah, thats why i did the whole
pipe_video_context thing, so we could do something like
vpipe->decode_bitstream()
23:24 < ymanton> they dont do anything in software, thats why they
have the A,B,C profiles.
23:29 < mwk> yeah seen the vpe stuff.
23:29 < mwk> this means... 1/10 engines down. heh.
23:29 < jb17bsome> How, odd I thought some of the cards did some stuff
in sw...MIght have just been like the early cards (8200).  Let me
check again.
23:32 -!- ebo^ [~ebolad-0m6NTWbJBkSxjf3ZAHTLoox/QSAw2SXx2QE3O31k/A4@public.gmane.org] has quit [Quit:
Verlassend]
23:33 < ymanton> actually, maybe youre right, they advertise only
partial accel from some hw/codec combos, but the vdpau interface only
accepts bitstream so they must do it in sw...
23:34 < ymanton> to cover the gap
23:38 -!- drago01 [~linux-wTAJDjugSx/2etPX55/tSuIIDdsh8iNBqQr9/NxovVrZlgQu6+UM5V6hYfS7NtTn@public.gmane.org]
has quit [Remote host closed the connection]
23:38 -!- ttlogic [~timl-hDTwYPJw9HnY9uy2lycG/gzFyF7qghRoTifILlU8meQ@public.gmane.org] has quit
[Remote host closed the connection]
23:39 < jb17bsome> Yes, I thought I read that somewhere.  Well, I plan
on looking at the G220 after I get the vpe in a more usable state.
23:43 < ymanton> although if theyre doing things in sw i dont know why
they didnt just support the gimped purevideo on nv40 and the original
nv50
23:43 < ymanton> youd have to look at windows to get those working
23:46 < cjae> ymanton: sorry I asked a question about vertical hold
here yesterday, I just srolled back through logs and saw you answered
23:47 < cjae> sorry got sidetracked yesterday
23:47 -!- Krazubu [~Nobody-IiY68fU1zUaMfJ+o05+rwpO3CpjqGh+aHD/9yKN3hrTk1uMJSBkQmQ@public.gmane.org] has
quit [Remote host closed the connection]
23:48 -!- dark [~dark@unaffiliated/eliasamaral] has joined #nouveau
23:48 < cjae> Hi using kubuntu 10.04 and have a tv hooked up via
svideo, but the vertical hold seems to be gone on the tv? How may I
fix this?
23:49 < jb17bsome> ymanton, You mean the windows nv purevideo support
(non-vdpau)?
23:49 < cjae> I too havent seen this since analog tvs
23:51 < ymanton> jb17bsome: yeah, i think they do parts of vp1 and
h264 on nv40 on windows
23:51 < ymanton> er, vc1*
23:52 < jb17bsome> ymanton, well, I checked that a while ago on nv49
on windows.  vpe wasn't touched for h.264.
23:53 < ymanton> yeah, they use the purevideo hw. goes through PFIFO
apparently along with 2d/3d, according to mwk
23:53 -!- phenriksson_ [~phenrikss-zQqIt0lS/s3kIxA6IGR1fOuxkmSbZO+jawxp4mAvfkc@public.gmane.org] has
quit [Quit: phenriksson_]
23:55 < mwk> I'm not sure about all purevideo going through PFIFO
23:55 < mwk> but at least some of the engines do use it
23:55 -!- agd5f [~alex-WSTiw3dF6oM8Xmy0jQQpC58TWGpLVQNEY5zTr6+EPI+tIzcuEWwsY6xOck334EZe@public.gmane.org] has
quit [Read error: Connection reset by peer]
23:56  * mwk only checked VP2 and VP4 though, not VP1 that is
available on nv4x...
23:56 < jb17bsome> Must be some other block then.  I didn't see any of
the vpe registers changing at all if I remember right.
23:57 -!- agd5f [~alex-WSTiw3dF6oM8Xmy0jQQpC58TWGpLVQNEY5zTr6+EPI+tIzcuEWwsY6xOck334EZe@public.gmane.org] has
joined #nouveau
23:57 < mwk> 0xf000
23:57 < mwk> most likely
--- Day changed sob maj 01 2010
00:00 < jb17bsome> this is just on vp2, vp3, right? and not older
cards like vp1.
00:02 < mwk> no, 0xf000 is vp1
00:02 < mwk> read my video dec engine list from an hour ago
00:03 < jb17bsome> I see.
